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
    setState(() {
      _roosterController.fetchAll();
    });
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
                    shrinkWrap: true,
                    //FIXME: FIX this Shit again DUE TO THE CHANGES IN THE BACKEND!!
                    itemCount: specific.length == 0 ? 1 : specific.length - 1,
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

                        // Check if the rooster has an image
                        if (rooster.gallery.isNotEmpty &&
                            rooster.gallery[index].image != null) {
                          return TalentPost(
                            roosterId: rooster.id,
                            imagePath: AppConstants.base_URL +
                                (index + 1 < rooster.gallery.length &&
                                        rooster.gallery[index + 1].image != null
                                    ? rooster.gallery[index + 1].image
                                    : rooster.gallery[index].image),
                            profilePath:
                                AppConstants.base_URL + rooster.profileImage,
                            roosterName:
                                "${rooster.firstName} ${rooster.lastName}",
                            roosterTags: rooster.interests,
                          );
                        } else {
                          // Skip rooster with no image
                          return SizedBox.shrink();
                        }
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
