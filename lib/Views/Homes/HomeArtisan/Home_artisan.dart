// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/ArtisanController.dart';
import 'package:um_media/Controller/LoginController.dart';
import 'package:um_media/Controller/UpdateController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/CustomWidgets/ModelSideBar.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/CustomWidgets/StudioCard.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';
import 'package:um_media/CustomWidgets/TalentCard_Artisan.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/Update.dart';
import 'package:um_media/Views/Talents/TalentsView.dart';

class HomeArtisanScreen extends StatefulWidget {
  final Rooster rooster;

  HomeArtisanScreen({Key? key, required this.rooster}) : super(key: key);

  @override
  State<HomeArtisanScreen> createState() => _HomeArtisanScreenState();
}

enum CustomTabButtons { Photos, Info, Talents }

class _HomeArtisanScreenState extends State<HomeArtisanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // final LoginController _loginController = Get.find();
  // ArtisanController _artisanController = ArtisanController();

  final UpdateController _updateController = Get.put(UpdateController());
  var barNumber = 0;
  late CustomTabButtons _tabButtons;

  var grid_image;
  var profileImage;
  List<dynamic> grid_image_list = [];
  var picker = ImagePicker();

  //
  Future<void> _getImage(String type) async {
    if (type == "profile") {
      try {
        var pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile == null) {
          return;
        } else {
          setState(() {
            profileImage = pickedFile
                ?.path; // Use null-aware operator to avoid null issues
            grid_image_list.add(grid_image);
          });
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      try {
        var pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile == null) {
          return;
        } else {
          setState(() {
            grid_image = pickedFile
                ?.path; // Use null-aware operator to avoid null issues
            grid_image_list.add(grid_image);
          });
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  // Future<void> _getImage(String type) async {
  //   try {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //     if (pickedFile != null) {
  //       print("Image picked: ${pickedFile.path}");
  //
  //       setState(() {
  //         grid_image = pickedFile.path;
  //         grid_image_list.add(grid_image);
  //         print("grid_image_list: $grid_image_list");
  //       });
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // Future<void> _getImage(String type) async {
  //   if (type == "profile") {
  //     try {
  //       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //       // Handle the picked image
  //       // ...
  //       if (pickedFile != null) {
  //         setState(() {
  //           profileImage = pickedFile!.path;
  //         });
  //       }
  //
  //     } catch (e) {
  //       print('Error: $e');
  //     }
  //   } else {
  //     try {
  //       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //       if (pickedFile != null) {
  //         setState(() {
  //           grid_image = pickedFile!.path;
  //           grid_image_list.add(grid_image);
  //         });
  //       }
  //     } catch (e) {
  //       print('Error: $e');
  //     }
  //   }
  // }

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

  // var rooster = _artisanController.rooster;
  Future<void> saveRooster(Rooster rooster) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final roosterJson = jsonEncode(rooster.toJson());
    await prefs.setString('rooster', roosterJson);
  }

  @override
  void initState() {
    // picker = ImagePicker();

    scaffoldKey = GlobalKey<ScaffoldState>();
    _tabController = TabController(length: 1, vsync: this);
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
    var infolist = [
      "${widget.rooster!.firstName} ${widget.rooster.lastName}",
      "${widget.rooster.city} ${widget.rooster.country}",
      "${widget.rooster.dob}",
      "${widget.rooster.phone}",
      "${widget.rooster.weight}",
      "${widget.rooster.height}"
    ];
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 500),
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: ModelSideBar(
          rooster: widget.rooster,
        ),
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
              // Tab(
              //   child: IconButton(
              //       onPressed: () {
              //         _tabController.animateTo(1);
              //       },
              //       icon: Icon(
              //         Icons.book_outlined,
              //         color: AppConstants.siteSubColor,
              //       )),
              // ),
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            "home".tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: RefreshIndicator(
                      color: AppConstants.siteSubColor,
                      displacement: 80,
                      onRefresh: () async {
                        setState(() {});
                      },
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
                              "${widget.rooster.firstName} ${widget.rooster.lastName}",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 40,
                              color: Colors.black,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          _isbuttonTapped = !_isbuttonTapped;
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
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                  visualDensity: VisualDensity(
                                                      vertical: -4),
                                                  leading: infoIcons[index],
                                                  title: Text(infohead[index]),
                                                  subtitle:
                                                      Text(infolist[index]),
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
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                  visualDensity: VisualDensity(
                                                      vertical: -4),
                                                  leading: infoIcons[index + 3],
                                                  title:
                                                      Text(infohead[index + 3]),
                                                  subtitle:
                                                      Text(infolist[index + 3]),
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          16, 0, 0, 0));
                                            }),
                                      ),
                                    ],
                                  )
                                : barNumber == 0
                                    ? Container(
                                        height: 500,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount: grid_image_list.isEmpty
                                              ? 1
                                              : grid_image_list.length +
                                                  (widget.rooster.gallery
                                                          ?.length ??
                                                      0),
                                          padding: EdgeInsets.all(8),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            if (index == 0
                                                ) {
                                              return IconButton(
                                                onPressed: () async {
                                                  if (grid_image_list.length <
                                                      6) {
                                                    await _getImage("");
                                                  } else {
                                                    Get.defaultDialog(
                                                      title: "Limit Reached",
                                                      middleText:
                                                          "You can only add 5 images",
                                                    );
                                                  }
                                                  if (grid_image_list.length >
                                                      0) {
                                                    var update = Update(
                                                      id: widget.rooster.id,
                                                      firstname: widget
                                                          .rooster.firstName,
                                                      lastName: widget
                                                          .rooster.lastName,
                                                      city: widget.rooster.city,
                                                      country: widget
                                                          .rooster.country,
                                                      dob: widget.rooster.dob,
                                                      email:
                                                          widget.rooster.email,
                                                      galleryImage:
                                                          grid_image_list,
                                                      state:
                                                          widget.rooster.state,
                                                    );
                                                    await _updateController
                                                        .updateRooster(
                                                            updated: update);
                                                  }
                                                },
                                                icon: Icon(Icons.add),
                                              );
                                            } else {
                                              // Adjust index to account for the "Add" button
                                              int adjustedIndex = index - 1;

                                              if (adjustedIndex <
                                                  grid_image_list.length) {
                                                // Display images from grid_image_list
                                                return Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Image.file(
                                                    File(grid_image_list[
                                                        adjustedIndex]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                );
                                              } else {
                                                // Display images from widget.rooster.gallery
                                                var galleryIndex =
                                                    adjustedIndex -
                                                        grid_image_list.length;
                                                var galleryImage = widget
                                                    .rooster
                                                    .gallery?[galleryIndex];

                                                return Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        AppConstants.base_URL +
                                                            galleryImage!.image,
                                                    fit: BoxFit.fill,
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      )
                                    : Container(
                                        height: 500,
                                        child: ListView.builder(
                                            itemCount:
                                                widget.rooster.interests.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var interest = widget
                                                  .rooster.interests[index];
                                              return ButtonCustom(
                                                borderRadius: 5,
                                                paddingBottom: 0,
                                                paddingTop: 10,
                                                backgroundColor:
                                                    AppConstants.subTextGrey,
                                                foregroundColor:
                                                    AppConstants.siteSubColor,
                                                buttonText: "${interest.name}",
                                                onPress: () {},
                                              );
                                            }),
                                      )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                        child: Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 3, // Spread radius
                              blurRadius: 7, // Blur radius
                            ),
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(75)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              child: Container(
                                  height: 150,
                                  width: 150,
                                  color: Colors.grey.shade300,
                                  child: widget.rooster.profileImage.isEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.add_a_photo_outlined,
                                            size: 36,
                                          ),
                                          onPressed: () async {
                                            _getImage("profile");
                                          },
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              "${AppConstants.base_URL}/${widget.rooster.profileImage}",
                                          fit: BoxFit.cover,
                                        )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //The Availibilty of the Rooster Yet to be Implemented.
            // SafeArea(
            //   child: Stack(
            //     children: [
            //       ListView.builder(
            //         itemCount: 1,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Padding(
            //             padding: EdgeInsets.all(8.0),
            //             child: ListTile(
            //               title: Text("Sana Mirza"),
            //               subtitle: Text("#actor, #model"),
            //               trailing: IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(
            //                   Icons.delete_outlined,
            //                   color: Colors.red.shade500,
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //       Positioned(
            //           bottom: 0,
            //           child: Column(
            //             children: [
            //               Container(
            //                 child: ButtonCustom(
            //                   buttonText: "Confirm Availibility",
            //                   onPress: () {},
            //                   foregroundColor: AppConstants.siteSubColor,
            //                   backgroundColor: AppConstants.subTextGrey,
            //                 ),
            //               ),
            //             ],
            //           ))
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
