import 'package:flutter/material.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../controller/articale_provider.dart';
import '../../model/article_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var newsProvider = context.watch<ArticleProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                Provider.of<ArticleProvider>(context, listen: false)
                    .getNewsData(),
          ),
        ],
      ),
      body: newsProvider.isLoading == false
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search articles...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      newsProvider.searchNews(value);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: newsProvider.newsList.length,
                    itemBuilder: (context, index) {
                      final article = newsProvider.newsList[index];
                      return ArticleCard(article: article);
                    },
                  ),
                ),
              ],
            ),
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
        // leading: article.hasImage
        leading: Image.network(
          article.urlToImage!,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.article, size: 40);
          },
        ),
        // : const Icon(Icons.article, size: 40),
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.source.name,
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
            // Text(article.formattedDate),
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
          // Navigate to article detail
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
          Icon(Icons.article, size: 64, color: Colors.black54),
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
