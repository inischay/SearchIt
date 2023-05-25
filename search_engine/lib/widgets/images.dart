import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final List<dynamic> image;
  const ImagePage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 40,
              )),
          title: const Text(
            "SearchIt",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
          )),
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (context, index) {
          final item = image[index];
          final imageUrl = item['pagemap']['cse_thumbnail'][0]['src'];

          if (imageUrl != null) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: AspectRatio(
                      aspectRatio: 1.5, child: Image.network(imageUrl)),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
