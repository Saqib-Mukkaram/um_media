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
                      .where((element) => element.interests.any(
                          (element) => element.name == widget.category_name))
                      .toList();

                  print(
                      "specific ${specific.length} value of specific is ${specific}");
                  return RefreshIndicator(
                    onRefresh: onRefresh,
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10.0),
                      shrinkWrap: true, // Set shrinkWrap to true
                      itemCount: specific.length == 0 ? 1 : specific.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (specific.length == 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                "No Roosters Found",
                                style: TextStyle(color: Colors.black, fontSize: 24),
                              )),
                            ],
                          );
                        } else {
                          var rooster =
                              // _roosterController.roosterList.elementAt(index);
                              specific.elementAt(index);
                          return TalentPost(
                            roosterId: rooster.id,
                            imagePath: AppConstants.base_URL +
                                rooster.gallery.elementAt(index + 1).image,
                            profilePath:
                                AppConstants.base_URL + rooster.profileImage,
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