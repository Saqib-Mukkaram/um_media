import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/Controller/TalentController.dart';

import 'package:um_media/CustomWidgets/TalentPost.dart';
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

  RoosterController _roosterController = RoosterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          centerTitle: true,
          title: Text(
            widget.category_name.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _roosterController.fetchAll();
            },
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
                          "Error: Cannot Fetch Data. ${snapshot.error} "), // Show an error message
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    // var specificRooster =
                    //     _roosterController.roosterList.where((element) {
                    //   return element.interest_name.any(
                    //       (element) => element.name == widget.category_name);
                    // // }).toList();
                    // print(specificRooster.length);
                    // print(specificRooster.elementAt(1));
                    var list = _roosterController.roosterList.first;
                    // list.interest.map((key, value) => )
                    return ListView.builder(
                      // scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10.0),
                      shrinkWrap: true, // Set shrinkWrap to true
                      itemCount: _roosterController.roosterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        // var talentCategory =
                        //     _talentController.categories.elementAt(index);
                        var rooster_img =
                            _roosterController.roosterGallery.elementAt(index);
                        var rooster_interest = _roosterController
                            .roosterInterests
                            .elementAt(index);
                        var rooster_list =
                            _roosterController.roosterList.elementAt(index);
                        var rooster_gallery = rooster_img.elementAt(index);
                        // List<RoosterData> roosterData = _roosterController.roosterList.where((element) => element. )
                        return TalentPost(
                          roosterId: rooster_list.id,
                          imagePath:
                              AppConstants.base_URL + rooster_gallery.image,
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