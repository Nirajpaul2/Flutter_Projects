import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'services/ssl_helper.dart';
import 'services/news_api_service.dart';
import 'screens/news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final http.Client secureClient = await SSLHelper.createSecureClient();
  final NewsApiService apiService = NewsApiService(secureClient);

  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final NewsApiService apiService;

  const MyApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NewsScreen(apiService: apiService));
  }
}
