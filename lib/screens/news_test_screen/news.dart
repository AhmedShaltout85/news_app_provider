
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../controller/articale_provider.dart';
import '../../model/article_model.dart';
import '../../utils/app_constants.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Article> articles = [];
  List<Article> filteredArticles = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response =
          await Provider.of<ArticleProvider>(context, listen: false)
              .fetchData("everything", {"q": "apple", "apiKey": apiKey});

      log("FETCHED DATA STATUS CODE: ${response.statusCode}");

      if (response.statusCode == 200) {
        setState(() {
          articles = List<Map<String, dynamic>>.from(response.data['articles'])
              .map((json) => Article.fromJson(json))
              .toList();
          filteredArticles = articles;
          isLoading = false;
        });

        log("ARTICLES LENGTH: ${articles.length}");
        if (articles.isNotEmpty) {
          log("FIRST ARTICLE TITLE: ${articles.first.title}");
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load articles';
        });
      }
    } catch (e) {
      log("ERROR FETCHING ARTICLES: $e");
      setState(() {
        isLoading = false;
        errorMessage = 'Error: ${e.toString()}';
      });
    }
  }

  void _searchNews(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredArticles = articles;
      } else {
        filteredArticles = articles.where((article) {
          return article.title.toLowerCase().contains(query.toLowerCase()) ||
              (article.description
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchArticles,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search articles...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _searchNews,
            ),
          ),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return ErrorWidget(
        message: errorMessage!,
        onRetry: _fetchArticles,
      );
    }

    if (filteredArticles.isEmpty) {
      return const EmptyStateWidget();
    }

    return ListView.builder(
      itemCount: filteredArticles.length,
      itemBuilder: (context, index) {
        final article = filteredArticles[index];
        return ArticleCard(article: article);
      },
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: article.urlToImage != null
            ? Image.network(
                article.urlToImage!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.article, size: 40);
                },
              )
            : const Icon(Icons.article, size: 40),
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.source.name,
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
            if (article.description != null)
              Text(
                article.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.detailRouteName,
            arguments: article,
          );
        },
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.article, size: 64, color: Colors.black54),
          const SizedBox(height: 16),
          Text(
            'No articles found',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Try refreshing or check your connection',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
        ],
      ),
    );
  }
}
