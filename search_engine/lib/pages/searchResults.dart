import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  final dynamic _searchResult;

  const SearchResultScreen(this._searchResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_searchResult['title']),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _searchResult['title'],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_searchResult['htmlSnippet']),
          ),
        ])));
  }
}
