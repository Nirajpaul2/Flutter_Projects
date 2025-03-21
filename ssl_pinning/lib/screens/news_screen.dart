import 'package:flutter/material.dart';
import 'package:ssl_pinning/model/news.dart';
import '../services/news_api_service.dart';
import '../constants/app_constants.dart';

class NewsScreen extends StatelessWidget {
  final NewsApiService apiService;

  const NewsScreen({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appTitle)),
      body: FutureBuilder<List<Article>>(
        future: apiService.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${AppConstants.errorOccurred}: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text(AppConstants.noNewsFound));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(
                    article.description ?? "No description available",
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
