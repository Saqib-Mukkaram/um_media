import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Rentalsdescription extends StatelessWidget {
  final int tag;
  final String url;
  final String description;

  Rentalsdescription(
      {required this.description,
      required this.url,
      required this.tag,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: tag,
                  child: CachedNetworkImage(
                    imageUrl: url,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
