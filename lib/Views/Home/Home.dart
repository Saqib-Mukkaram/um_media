import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/CustomWidgets/StudioCard.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';
import 'package:um_media/CustomWidgets/TalentsView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var talentlist = [
    "Actor",
    "Influencer",
    "dj",
    "musician",
    "Singer",
    "youtuber",
    "dancers",
    "photography"
  ];
  // var talenturl = [
  //   "http://ummediagroup.com/assets/images/categories/actor.jpg",
  //   "http://ummediagroup.com/assets/images/categories/influencer.jpg",
  //   "http://ummediagroup.com/assets/images/categories/dj.jpg",
  //   "http://ummediagroup.com/assets/images/categories/musician.jpg",
  //   "http://ummediagroup.com/assets/images/categories/singer.jpg",
  //   "http://ummediagroup.com/assets/images/categories/youtuber.jpg",
  //   "http://ummediagroup.com/assets/images/categories/dancers.jpg",
  //   "http://ummediagroup.com/assets/images/categories/photography.jpg",
  // ];
  var talenturl = AppConstants.talentlist;
  // var studiourl = [
  //   "http://ummediagroup.com/assets/images/studios/studio-cover.jpg",
  //   "http://ummediagroup.com/assets/images/studios/photo-01.jpg",
  //   "http://ummediagroup.com/assets/images/studios/photo-02.jpg",
  //   "http://ummediagroup.com/assets/images/studios/photo-03.jpg",
  //   "http://ummediagroup.com/assets/images/studios/photo-04.jpg"
  // ];
  var studiourl = AppConstants.img_studio;
  var studioitem = [
    "Music Studio",
    "Muffled Studio",
    "Music Instruments",
    "Padded Room"
  ];

  var talentsgrid = [];

  var radius = 35.0;
  var scaffoldKey;
  @override
  void initState() {
    // TODO: implement initState
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideBar(),
      appBar: CustomAppBar(scaffoldkey: scaffoldKey),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text(
                            "talents".tr.toUpperCase(),
                            style: TextStyle(
                                fontSize: 22,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            FIXME:
                            "This is yet to be Implemented";
                            print("View all is tapped");
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: Text(
                              "viewall".tr,
                              style:
                                  TextStyle(color: AppConstants.siteSubColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 275,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10.0),
                          shrinkWrap: true, // Set shrinkWrap to true
                          itemCount: talentlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                print(
                                    "The tapped Item is ${talentlist[index]}");
                                if (index > talentsgrid.length) {
                                  setState(() {
                                    Get.showSnackbar(GetSnackBar(
                                      title:
                                          "${talentlist[index]}".toUpperCase(),
                                      message: "No Data found.",
                                      isDismissible: true,
                                      duration: Duration(seconds: 1),
                                    ));
                                  });
                                } else {
                                  Get.to(TalentsView());
                                }
                              },
                              child: TalentCard(
                                netImg: false,
                                src: talenturl[index],
                                text: talentlist[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider(
                //   indent: 16,
                //   endIndent: 16,
                // ),
                InkWell(
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text(
                            "studio".tr.toUpperCase(),
                            style: TextStyle(
                                fontSize: 28,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: Text(
                            "viewall".tr,
                            style: TextStyle(color: AppConstants.siteSubColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 345,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10.0),
                          shrinkWrap: true, // Set shrinkWrap to true
                          itemCount: studioitem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return StudioCard(
                              netImg: false,
                              src: studiourl[index],
                              text: studioitem[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                Text(
                  "cant_decide".tr,
                  style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Container(
                  width: 200,
                  child: Center(
                    child: Text(
                      "let_us_decide".tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ButtonCustom(
                  buttonText: "Decide",
                  onPress: () {},
                  backgroundColor: Colors.black,
                  paddingTop: 8,
                  paddingBottom: 0,
                  paddingLeft: 0,
                  paddingRight: 0,
                  width: 200,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

// HomeCard(
//                     src: AppConstants.net_actor,
//                     text: "Actor",
//                   ),
//                   HomeCard(
//                     src: AppConstants.net_photographer,
//                     text: "Photographer",
//                   ),
//                   HomeCard(
//                     src: AppConstants.net_dancing,
//                     text: "Dance",
//                   ),
//                   HomeCard(
//                     src: AppConstants.net_YT,
//                     text: "Youtuber",
//                   ),
//                   HomeCard(
//                     src: AppConstants.net_musician,
//                     text: "Musician",
//                   ),
//                   HomeCard(
//                     src: AppConstants.net_dj,
//                     text: "DJ",
//                   ),
//                   HomeCard(
//                     src: AppConstants.net_singing,
//                     text: "Singing",
//                   ),
