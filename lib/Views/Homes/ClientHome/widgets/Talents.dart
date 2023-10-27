import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/CacheController.dart';
import 'package:um_media/Controller/TalentController.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';
import 'package:um_media/Views/Talents/TalentsView.dart';

import 'package:um_media/Views/Homes/Shimmers/TalentShimmer.dart';

class Talents extends StatefulWidget {
  const Talents({super.key});

  @override
  State<Talents> createState() => _TalentsState();
}

class _TalentsState extends State<Talents> {

  final TalentController _controller = Get.find();

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 275,
          child: FutureBuilder(
              future: _controller.isDataFetched(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    _controller.isDataFetched() == false) {
                 
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                            color: AppConstants
                                .siteSubColor), // Show a loading indicator
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Error: Cannot Fetch Data."), // Show an error message
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(10.0),
                    shrinkWrap: true, // Set shrinkWrap to true
                    itemCount: _controller.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                     
                      var category = _controller.categories.elementAt(index);
                     

                      return InkWell(
                        onTap: () {
                          Get.to(TalentsView(
                            category_id: category.id,
                            category_name: category.name,
                          ));
                        },
                       
                        child: TalentCard(
                                netImg: true,
                                src: AppConstants.base_URL + category.photo,
                                text: category.name,
                              ),
                            
                      );
                    },
                  );
                } else {
                  return Text("Loading");
                }
              }),
        ),
      ],
    );
  }
}
