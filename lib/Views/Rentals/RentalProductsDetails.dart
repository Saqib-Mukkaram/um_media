import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:um_media/Controller/RentalsController.dart';
import 'package:um_media/Models/Rentals.dart';

import '../../AppConstants.dart';

class RentalProductDetails extends StatelessWidget {
  final Rentals rentals;

  RentalProductDetails({required this.rentals, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          rentals.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: rentals.id,
                child: CachedNetworkImage(
                  imageUrl:  rentals.image,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  rentals.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                  style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.black,
                        foregroundColor: AppConstants.siteSubColor,
                        minimumSize: Size(165, 40),
                      ),
                      onPressed: () {
                        //copy the number to clipboard
                        Clipboard.setData(ClipboardData(text: "000 000 000"));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Copied to Clipboard"),
                        ));
                      },
                      child: Text(
                        "Call Us 000 000 000",
                        style: TextStyle(fontSize: 14),
                      )),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Explore More",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: 6,
                      itemBuilder: (con, index) {
                        return GestureDetector(
                            onTap: () {
                              // Get.to(RentalProductDetails());
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl:  rentals.image,
                                fit: BoxFit.fitWidth,
                              ),
                            ));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
