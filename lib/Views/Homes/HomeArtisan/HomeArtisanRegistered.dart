// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/ArtisanController.dart';
import 'package:um_media/Controller/LoginController.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/CustomWidgets/ModelSideBar.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/CustomWidgets/StudioCard.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';
import 'package:um_media/CustomWidgets/TalentCard_Artisan.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Views/Talents/TalentsView.dart';

class HomeArtisanRegistered extends StatefulWidget {
  int rooster_id;

  HomeArtisanRegistered({Key? key, required this.rooster_id}) : super(key: key);

  @override
  State<HomeArtisanRegistered> createState() => _HomeArtisanRegisteredState();
}

enum CustomTabButtons { Photos, Info, Talents }

class _HomeArtisanRegisteredState extends State<HomeArtisanRegistered>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // final LoginController _loginController = Get.find();
  ArtisanController _artisanController = ArtisanController();
  List<dynamic> grid_image_list = [];
  var barNumber = 0;
  late CustomTabButtons _tabButtons;
  var grid_image;
  var profileImage;
  final picker = ImagePicker();
  Future<void> _getImage(String type) async {
    if (type == "profile") {
      try {
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        // Handle the picked image
        // ...
        setState(() {
          profileImage = pickedFile!.path;
        });
      } catch (e) {
        print('Error: $e');
      }
    } else {
      try {
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);

        setState(() {
          grid_image = pickedFile!.path;
          grid_image_list!.add(grid_image);
        });
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  int CustomBar(int exp) {
    switch (exp) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 3;
      default:
        print(' invalid entry');
    }
    return 1;
  }

  bool _isbuttonTapped = false;

  var _isTapped;
  var _imgs_sana = AppConstants.img_sana;
  var infohead = ["Name", "Location", "Age", "Phone", "Weight", "Height"];

  final infoIcons = [
    Icon(
      Icons.person_outlined,
      color: AppConstants.subTextGrey,
    ),
    Icon(
      Icons.place_outlined,
      color: AppConstants.subTextGrey,
    ),
    Icon(
      Icons.psychology_outlined,
      color: AppConstants.subTextGrey,
    ),
    Icon(
      Icons.accessibility_outlined,
      color: AppConstants.subTextGrey,
    ),
    Icon(
      Icons.accessibility_outlined,
      color: AppConstants.subTextGrey,
    ),
    Icon(
      Icons.accessibility_outlined,
      color: AppConstants.subTextGrey,
    ),
  ];

  var radius = 35.0;
  var scaffoldKey;

  @override
  void initState() {
    // TODO: implement initState
    scaffoldKey = GlobalKey<ScaffoldState>();
    _tabController = TabController(length: 2, vsync: this);
    _isTapped = false;
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 500),
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: ModelSideBar(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu_outlined),
            color: AppConstants.siteSubColor,
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            dividerColor: AppConstants.siteSubColor,
            indicatorColor: AppConstants.siteSubColor,
            tabs: [
              Tab(
                  child: IconButton(
                      onPressed: () {
                        _tabController.animateTo(0);
                      },
                      icon: Icon(
                        Icons.home_outlined,
                        color: AppConstants.siteSubColor,
                      ))),
              Tab(
                child: IconButton(
                    onPressed: () {
                      FIXME:
                      "THis is to be Redone";
                      _tabController.animateTo(1);
                    },
                    icon: Icon(
                      Icons.book_outlined,
                      color: AppConstants.siteSubColor,
                    )),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            "home".tr,
            style: TextStyle(color: Colors.white),
          ),
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: ClipOval(
          //       child: Image.asset(
          //         AppConstants.img_person,
          //         width:
          //             35.0, // Set the width and height to twice the radius to make it circular
          //         height: 35.0,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   )
          // ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FutureBuilder(
              //FIXME: This is to be Made Dynamic
                future: _artisanController.fetchArtisanDetails(1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var rooster = _artisanController.rooster;
                    var infolist = [
                      "${rooster!.firstName} ${rooster.lastName}",
                      "${rooster.city} ${rooster.country}",
                      "${rooster.dob}",
                      "${rooster.phone}",
                      "60kg",
                      "5ft"
                    ];
                    return SafeArea(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: size.width,
                              height: (size.height - kToolbarHeight - 225),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      // offset: Offset(0, 3), // Offset from the widget
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Text(
                                    "${rooster!.firstName} ${rooster.lastName}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 40,
                                    color: Colors.black,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          ButtonCustom(
                                            elevation: 0,
                                            height: 25,
                                            width: size.width / 4,
                                            buttonText: "Photos".toUpperCase(),
                                            fontsize: 12,
                                            onPress: () {
                                              setState(() {
                                                _isTapped = false;
                                                barNumber = 0;
                                              });
                                            },
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: barNumber == 0
                                                ? Colors.white
                                                : AppConstants.siteSubColor,
                                            paddingBottom: 0,
                                            paddingTop: 0,
                                            paddingRight: 8,
                                          ),
                                          ButtonCustom(
                                            elevation: 0,
                                            height: 25,
                                            fontsize: 12,
                                            width: size.width / 4,
                                            buttonText: "Info".toUpperCase(),
                                            onPress: () {
                                              setState(() {
                                                _isTapped = true;
                                                barNumber = 1;
                                              });
                                            },
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: barNumber == 1
                                                ? Colors.white
                                                : AppConstants.siteSubColor,
                                            paddingLeft: 0,
                                            paddingBottom: 0,
                                            paddingTop: 0,
                                            paddingRight: 0,
                                          ),
                                          ButtonCustom(
                                            elevation: 0,
                                            height: 25,
                                            fontsize: 12,
                                            width: size.width / 4,
                                            buttonText: "Talents",
                                            onPress: () {
                                              setState(() {
                                                _isbuttonTapped =
                                                !_isbuttonTapped;
                                                barNumber = 2;
                                              });
                                            },
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: barNumber == 2
                                                ? Colors.white
                                                : AppConstants.siteSubColor,
                                            paddingLeft: 8,
                                            paddingBottom: 0,
                                            paddingTop: 0,
                                            paddingRight: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  barNumber == 1
                                      ? Row(
                                    // This is the Info Tab
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 300,
                                        child: ListView.builder(
                                            padding: EdgeInsets.all(0),
                                            itemCount: 3,
                                            itemBuilder:
                                                (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                  visualDensity:
                                                  VisualDensity(
                                                      vertical: -4),
                                                  leading:
                                                  infoIcons[index],
                                                  title: Text(
                                                      infohead[index]),
                                                  subtitle: Text(
                                                      infolist[index]),
                                                  contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      16, 0, 0, 0));
                                            }),
                                      ),
                                      Container(
                                        width: 200,
                                        height: 300,
                                        child: ListView.builder(
                                            itemCount: 3,
                                            itemBuilder:
                                                (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                  visualDensity:
                                                  VisualDensity(
                                                      vertical: -4),
                                                  leading: infoIcons[
                                                  index + 3],
                                                  title: Text(infohead[
                                                  index + 3]),
                                                  subtitle: Text(infolist[
                                                  index + 3]),
                                                  contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      16, 0, 0, 0));
                                            }),
                                      ),
                                    ],
                                  )
                                      : barNumber == 0
                                      ? Container(
                                    //This is for Pictures
                                    height: 500,
                                    child: GridView.builder(
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemCount:
                                      grid_image_list.length == 0
                                          ? 1
                                          : grid_image_list
                                          .length,
                                      padding: EdgeInsets.all(8),
                                      itemBuilder:
                                          (BuildContext context,
                                          int index) {
                                        return index == 0
                                            ? IconButton(
                                            onPressed: () {
                                              _getImage("");

                                            },
                                            icon: Icon(Icons.add))
                                            : Padding(
                                          padding:
                                          EdgeInsets.all(4),
                                          child: Image.file(
                                            File(
                                                grid_image_list[
                                                index]),
                                            width: 100,
                                            height: 100,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                      : Container(
                                    height: 500,
                                    child: ListView.builder(
                                        itemCount: rooster.interests.length,
                                        itemBuilder:
                                            (BuildContext context,
                                            int index) {
                                          var interest = rooster.interests[index];
                                          return ButtonCustom(
                                            borderRadius: 0,
                                            paddingBottom: 0,
                                            paddingTop: 10,
                                            backgroundColor:
                                            AppConstants
                                                .subTextGrey,
                                            foregroundColor:
                                            AppConstants
                                                .siteSubColor,
                                            buttonText: "$interest",
                                            onPress: () {},
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withOpacity(0.2), // Shadow color
                                          spreadRadius: 3, // Spread radius
                                          blurRadius: 7, // Blur radius
                                          // offset: Offset(0, 3), // Offset from the widget
                                        ),
                                      ]),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(75)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: Container(
                                            height: 150,
                                            width: 150,
                                            color: Colors.grey.shade300,
                                            child: profileImage == null
                                                ? IconButton(
                                              icon: Icon(
                                                Icons
                                                    .add_a_photo_outlined,
                                                size: 36,
                                              ),
                                              onPressed: () async {
                                                _getImage("profile");
                                              },
                                            )
                                                : Image.file(
                                              File(profileImage),
                                              fit: BoxFit.cover,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            SafeArea(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          // leading: ClipRRect(
                          //   borderRadius:
                          //       BorderRadius.all(Radius.circular(20)),
                          //   //FIXME : THE AVALIBILITY CHART
                          //   child: widget.rooster.profileImage == null
                          //       ? IconButton(
                          //           onPressed: () {},
                          //           icon: Icon(
                          //             Icons.add_outlined,
                          //             size: 24,
                          //           ),
                          //         )
                          //       : Image.asset(
                          //           "assets/imgs/People/Sana-2.png"),
                          // ),
                          title: Text("Sana Mirza"),
                          subtitle: Text("#actor, #model"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.red.shade500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Container(
                            child: ButtonCustom(
                              buttonText: "Confirm Availibility",
                              onPress: () {},
                              foregroundColor: AppConstants.siteSubColor,
                              backgroundColor: AppConstants.subTextGrey,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Column(
//                       children: [
//

//                       ],
//                     ),
