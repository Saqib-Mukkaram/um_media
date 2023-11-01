import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/Controller/TalentController.dart';

import 'package:um_media/Views/Talents/TalentPost.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/RoosterImages.dart';

class TalentsView extends StatefulWidget {
  final int category_id;
  final String category_name;

  TalentsView(
      {required this.category_id, required this.category_name, super.key});

  @override
  State<TalentsView> createState() => _TalentsViewState();
}

class _TalentsViewState extends State<TalentsView> {
  TalentController _talentController = Get.find();

  RoosterController _roosterController = Get.find();

  Future<void> onRefresh() async {
    // setState(() {
    //   _roosterController.fetchAll();
    // });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.subTextGrey,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          widget.category_name.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: _roosterController.isDataFetched(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  _roosterController.isDataFetched() == false) {
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
                print(snapshot.error);
                return Center(
                  child: Text(
                      "Error: Cannot Fetch Data."), // Show an error message
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                var specific = _roosterController.roosterList
                    .where((element) => element.interests
                        .any((element) => element.name == widget.category_name))
                    .toList();

                print(
                    "specific ${specific.length} value of specific is ${specific}");
                return RefreshIndicator(
                  onRefresh: onRefresh,
                  child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(10.0),

                    //FIXME: FIX this Shit again DUE TO THE CHANGES IN THE BACKEND!! == 0 ? 1 : specific.length - 1
                    itemCount: specific.length == 0 ? 1 : specific.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (specific.length == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "No Roosters Found",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ),
                          ],
                        );
                      } else {
                        var rooster = specific.elementAt(index);
                        var galleryLength = rooster.gallery.length;

                        // Check if the rooster has an image
                        return TalentPost(
                          roosterId: rooster.id,
                          imagePath: (rooster.gallery.length > 0
                              ? index >= rooster.gallery.length
                                  ? AppConstants.base_URL +
                                      rooster.gallery.first.image
                                  : AppConstants.base_URL +
                                      rooster.gallery[index].image
                              : "https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png"),
                          profilePath: rooster.profileImage.isEmpty
                              ? "https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png"
                              : AppConstants.base_URL + rooster.profileImage,
                          roosterName:
                              "${rooster.firstName} ${rooster.lastName}",
                          roosterTags: rooster.interests,
                        );
                      }
                    },
                  ),
                );
              } else {
                return Text("Loading");
              }
            }),
      ),
    );
  }
}
