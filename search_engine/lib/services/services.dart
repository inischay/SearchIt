import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

Future<Map<String, dynamic>> searchEngine(String query) async {
  print("correct");
  final response = await http.get(Uri.parse(
      "https://www.googleapis.com/customsearch/v1?key=AIzaSyDWeqxQj4lBH-LgKyhbouYIWaMwU31prz0&cx=16c4cddd3cc2d4497&q=$query"));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw ("Failed to load search results");
  }
}
