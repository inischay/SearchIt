import 'package:flutter/material.dart';
import 'package:search_engine/pages/newsDetailPage.dart';
import 'package:search_engine/services/newsService.dart';

import 'package:search_engine/services/services.dart';
import 'package:search_engine/widgets/images.dart';

import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  bool _isLoading = false;
  Map<String, dynamic>? _searchResults;
  String? _errorMessage;
  late Future<Map<String, dynamic>> _searchResultsFuture;

  void _submitSearch(String query) async {
    final results = searchEngine(query);
  }

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      searchEngine(query).then((results) {
        setState(() {
          _isLoading = false;
          _searchResults = results;
        });
      }).catchError((error) {
        setState(() {
          _isLoading = false;
          _searchResults = null;
          _errorMessage = error.toString();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D45),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1D45),
        title: const Text(
          "SearchIt",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              "assets/images/ser.png",
              height: 250,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 140, 138, 242).withOpacity(0.2),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Color.fromARGB(255, 215, 215, 215),
              //     blurRadius: 10,
              //     spreadRadius: 3,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              autofocus: true,
              controller: _searchController,
              cursorColor: Colors.grey,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              onChanged: (query) {
                setState(() {
                  _searchResults = null;
                  _errorMessage = null;
                });
              },
              onSubmitted: _handleSearch,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () async {
                    _submitSearch(_searchController.text);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Search Something",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (_searchResults != null &&
                  _searchResults!['items'].isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImagePage(
                            image: _searchResults!['items'],
                          )),
                );
              }
            },
            child: _searchResults != null && _searchResults!['items'].isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 215, 215, 215),
                    ),
                    child: const Text(
                      "Images",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(
            height: 20,
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_searchResults != null)
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults != null &&
                        _searchResults!.containsKey('items')
                    ? _searchResults!['items'].length
                    : 0,
                itemBuilder: (context, index) {
                  final item = _searchResults!['items'][index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      leading: item['pagemap'] != null &&
                              item['pagemap']['cse_thumbnail'] != null &&
                              item['pagemap']['cse_thumbnail'].isNotEmpty &&
                              item['pagemap']['cse_thumbnail'][0] != null
                          ? AspectRatio(
                              aspectRatio: 0.9,
                              child: Image.network(
                                item['pagemap']['cse_thumbnail'][0]['src'],
                              ),
                            )
                          : const SizedBox.shrink(),
                      subtitle: Text(
                        item['snippet'],
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        launchUrlString(item['link']);
                      },
                    ),
                  );
                },
              ),
            )
          else if (_errorMessage != null)
            Text(_errorMessage!)
          else
            Expanded(
              child: FutureBuilder(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final newsList = snapshot.data as List<dynamic>;
                    return ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        final news = newsList[index];
                        final imageUrl = news['urlToImage']?.toString();
                        if (imageUrl != null &&
                            Uri.parse(imageUrl).isAbsolute) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewDetailPage(
                                            title: news['title'],
                                            image: news['urlToImage'],
                                            description: news['description'],
                                            content: news['content'],
                                            name: news['source']['name'],
                                          )));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 90,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 13,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      news['title'],
                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
