
class Articles {
  final String status;
  final int totalResults;
  final List<dynamic> articles;

  const Articles({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      status: json['status']?.toString() ?? '',
      totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
      articles: json['articles'] 
         
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }
}
