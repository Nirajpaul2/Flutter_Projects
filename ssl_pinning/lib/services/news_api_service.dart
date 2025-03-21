import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ssl_pinning/model/news.dart';
import '../constants/app_constants.dart';

/// Handles fetching news data from the API
class NewsApiService {
  final http.Client client;

  NewsApiService(this.client);

  Future<List<Article>> fetchNews() async {
    final Uri uri = Uri.parse(
      '${AppConstants.newsApiUrl}&apiKey=${AppConstants.apiKey}',
    );
    final http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body)).articles;
    } else {
      throw Exception(AppConstants.errorOccurred);
    }
  }
}
