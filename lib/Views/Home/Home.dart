import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/CustomWidgets/StudioCard.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';

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
  var talenturl = [
    "http://ummediagroup.com/assets/images/categories/actor.jpg",
    "http://ummediagroup.com/assets/images/categories/influencer.jpg",
    "http://ummediagroup.com/assets/images/categories/dj.jpg",
    "http://ummediagroup.com/assets/images/categories/musician.jpg",
    "http://ummediagroup.com/assets/images/categories/singer.jpg",
    "http://ummediagroup.com/assets/images/categories/youtuber.jpg",
    "http://ummediagroup.com/assets/images/categories/dancers.jpg",
    "http://ummediagroup.com/assets/images/categories/photography.jpg",
  ];
  var studiourl = [
    "http://ummediagroup.com/assets/images/studios/studio-cover.jpg",
    "http://ummediagroup.com/assets/images/studios/photo-01.jpg",
    "http://ummediagroup.com/assets/images/studios/photo-02.jpg",
    "http://ummediagroup.com/assets/images/studios/photo-03.jpg",
    "http://ummediagroup.com/assets/images/studios/photo-04.jpg"
  ];
  var studioitem = [
    "Music Studio",
    "Muffled Studio",
    "Music Instruments",
    "Padded Room"
  ];
  var radius = 35.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("home".tr),
        actions: [
          ClipOval(
            child: Image.asset(
              AppConstants.img_person,
              width:
                  radius, // Set the width and height to twice the radius to make it circular
              height: radius,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        "talents".tr.toUpperCase(),
                        style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: Text("viewall".tr),
                    )
                  ],
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
                        itemCount: talentlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TalentCard(
                            src: talenturl[index],
                            text: talentlist[index],
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
              InkWell(
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
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: Text("viewall".tr),
                    )
                  ],
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
      ),
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