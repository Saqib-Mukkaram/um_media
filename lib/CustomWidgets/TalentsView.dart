import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/Controller/TalentController.dart';

import 'package:um_media/CustomWidgets/TalentPost.dart';
import 'package:um_media/Models/RoosterImages.dart';

class TalentsView extends StatelessWidget {
  TalentController _talentController = Get.find();
  RoosterController _roosterController = Get.put(RoosterController());
  final int category_id;
  final String category_name;
  TalentsView(
      {required this.category_id, required this.category_name, super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

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
          title: Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: FutureBuilder(
                future: _roosterController.fetchAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                          "Error: Cannot Fetch Data. "), // Show an error message
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      // scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10.0),
                      shrinkWrap: true, // Set shrinkWrap to true
                      itemCount: _roosterController.roosterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        // var talentCategory =
                        //     _talentController.categories.elementAt(index);
                        var rooster_img =
                            _roosterController.roosterImages.elementAt(index);
                        var rooster_interest =
                            _roosterController.roosterInterests;
                        var rooster_list =
                            _roosterController.roosterList.elementAt(index);
                        List<RoosterImages> rooster_gallery =
                            _roosterController.roosterGallery.elementAt(index);

                        print(rooster_gallery.elementAt(index));
                        return TalentPost(
                          roosterId: rooster_list.id,
                          imagePath: AppConstants.base_URL + rooster_img.image,
                          profilePath: AppConstants.base_URL +
                              rooster_list.profile_image,
                          roosterName:
                              rooster_list.firstName + rooster_list.lastName,
                          roosterTags: rooster_interest,
                        );
                      },
                    );
                  } else {
                    return Text("Loading");
                  }
                }),
          ),
        ));
  }
}

// 
//  Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.to(TalentProfile());
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(12)),
//                             child: Container(
//                                 color: Colors.black,
//                                 // color: Color.fromARGB(28, 0, 0, 0),
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       // Image.asset(AppConstants.img_photography)
//                                       Image.asset(
//                                         talenturl[0],
//                                         width: 150,
//                                         height: 200,
//                                         fit: BoxFit.cover,
//                                       )
//                                     ]))),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.to(TalentProfile());
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(12)),
//                             child: Container(
//                                 color: Colors.black,
//                                 // color: Color.fromARGB(28, 0, 0, 0),
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       // Image.asset(AppConstants.img_photography)
//                                       Image.asset(
//                                         talenturl[0],
//                                         width: 150,
//                                         height: 200,
//                                         fit: BoxFit.cover,
//                                       )
//                                     ]))),
//                       ),
//                     ),
                    
//                   ],
//                 );