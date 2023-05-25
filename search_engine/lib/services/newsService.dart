import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchNews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=175c616b390f4ba2bcfce0f387b01e55'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['articles'];
  } else {
    throw Exception("failed to load");
  }
}
