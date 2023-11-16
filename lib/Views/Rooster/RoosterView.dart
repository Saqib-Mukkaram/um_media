// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Models/EnquiredRooster.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/EnquireList.dart';
import 'package:um_media/Views/Rooster/EnquireListRoosterView.dart';

class RoosterView extends StatefulWidget {
  final int rooster_id;

  RoosterView({required this.rooster_id, super.key});

  @override
  State<RoosterView> createState() => _RoosterViewState();
}

class _RoosterViewState extends State<RoosterView> {
  RoosterController _controller = Get.find();
  EnquireListController _enquireListController = Get.find();

  RxBool _isTapped = false.obs;

  Future<void> _refresh() async {
    setState(() {
      _controller.fetchAll();
    });
  }

  var _isbuttonTapped = false.obs;

  var infohead = [
    "Name",
    "Location",
    "Date of Birth",
    "Number",
    "Weight",
    "Height"
  ];

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

  var scaffoldkey;

  @override
  void initState() {
    _isbuttonTapped = _controller.roosterList
            .where((element) => element.id == widget.rooster_id)
            .first
            .IsEnquired
            .value
        ? true.obs
        : false.obs;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Create widgets and add them to the list
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.subTextGrey,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Back",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Obx(() => Stack(
                children: [
                  // Icon
                  IconButton(
                      icon: Icon(
                        Icons.favorite_outlined,
                        color: AppConstants.siteSubColor,
                      ),
                      onPressed: () {
                        Get.to(EnquireListRoosterView());
                      }), // Replace with your desired icon

                  // Counter
                  Positioned(
                    right: 5,
                    top: 7,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _enquireListController
                                      .roosterEnquireList.length ==
                                  0
                              ? Colors.transparent
                              : Colors.red // Customize the color
                          ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Center(
                          child: Obx(
                        () => _enquireListController
                                    .roosterEnquireList.length ==
                                0
                            ? SizedBox()
                            : Text(
                                _enquireListController.roosterEnquireList.length
                                    .toString(),
                                // Replace with your counter value
                                style: TextStyle(
                                  color:
                                      Colors.white, // Customize the text color
                                  fontSize: 12, // Customize the font size
                                ),
                              ),
                      )),
                    ),
                  ),
                ],
              ))
        ],
      ),
      body: FutureBuilder(
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
              child: Text("Error: Cannot Fetch Data."), // Show an error message
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            var _rooster = _controller.roosterList
                .where((element) => element.id == widget.rooster_id)
                .toList();
            print(_rooster);
            List<Widget> widgets = [];

            var tilelist = [
              "${_rooster.first.firstName} ${_rooster.first.lastName}",
              "${_rooster.first.city}, ${_rooster.first.country}",
              _rooster.first.dob,
              _rooster.first.phone,
              _rooster.first.weight,
              _rooster.first.height
            ];

            for (int i = 0; i < _rooster.first.interests.length; i++) {
              print(
                  "Rooster Interests Length = ${_controller.roosterList.length}");

              //store the interests in a list
              var interests = _rooster.first.interests.elementAt(i);

              widgets.add(
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text(
                      "${interests.name}",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppConstants.siteSubColor,
                      backgroundColor: AppConstants.subTextGrey,
                      minimumSize: Size(40, 30),
                    ),
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Shadow color
                                  spreadRadius: 5, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  // offset: Offset(0, 3), // Offset from the widget
                                ),
                              ]),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: AppConstants.base_URL +
                                  _rooster.first.profileImage,
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Padding(
                                padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: AppConstants.siteSubColor,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${_rooster.first.firstName} ${_rooster.first.lastName}",
                          style: TextStyle(
                              color: AppConstants.subTextGrey, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "122",
                                  style: TextStyle(
                                      color: AppConstants.siteSubColor,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Inquiries",
                                  style: TextStyle(
                                      color: AppConstants.subTextGrey),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "3.5K",
                                  style: TextStyle(
                                      color: AppConstants.siteSubColor,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Likes",
                                  style: TextStyle(
                                      color: AppConstants.subTextGrey),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 225,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Row(
                                    children: widgets,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.black,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => ButtonCustom(
                                      elevation: 0,
                                      height: 25,
                                      width: size.width / 4,
                                      buttonText: "Photos".toUpperCase(),
                                      fontsize: 12,
                                      onPress: () {
                                        _isTapped.value = false;
                                      },
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: _isTapped.value
                                          ? AppConstants.siteSubColor
                                          : Colors.white,
                                      paddingBottom: 0,
                                      paddingTop: 0,
                                      paddingRight: 8,
                                    )),
                                Obx(
                                  () => ButtonCustom(
                                    elevation: 0,
                                    height: 25,
                                    fontsize: 12,
                                    width: size.width / 4,
                                    buttonText: "Info".toUpperCase(),
                                    onPress: () {
                                      // setState(() {
                                      //   _isTapped.value = true;
                                      // });
                                      _isTapped.value = true;
                                    },
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: _isTapped.value
                                        ? Colors.white
                                        : AppConstants.siteSubColor,
                                    paddingLeft: 0,
                                    paddingBottom: 0,
                                    paddingTop: 0,
                                    paddingRight: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Divider(
                        //   indent: 16,
                        //   endIndent: 16,
                        //   color: AppConstants.siteSubColor,
                        // ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: Obx(() {
                            print(
                                "Gallery Length is ${_rooster.first.gallery.length}");
                            print(
                                "rooster Inquiry value = ${_rooster.first.IsEnquired.value}");
                            return _isTapped.value
                                ? Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 300,
                                        child: ListView.builder(
                                            itemCount: 3,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              print("this is working -- Info");
                                              return ListTile(
                                                  visualDensity: VisualDensity(
                                                      vertical: -4),
                                                  leading: infoIcons[index],
                                                  title: Text(infohead[index]),
                                                  subtitle: Text(tilelist[index]
                                                      .toString()),
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
                                              print(
                                                  "info List is Working Correctly");
                                              return ListTile(
                                                  visualDensity: VisualDensity(
                                                      vertical: -4),
                                                  leading: infoIcons[index + 3],
                                                  title:
                                                      Text(infohead[index + 3]),
                                                  subtitle: Text(
                                                      tilelist[index + 3]
                                                          .toString()),
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          16, 0, 0, 0));
                                            }),
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: 300,
                                    child: _rooster.first.gallery.isEmpty
                                        ? Center(
                                            child: Text("No Data Available"),
                                          )
                                        : GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                            ),
                                            //FIXME: Hardcoded VALUE
                                            itemCount:
                                                _rooster.first.gallery.length,
                                            padding: EdgeInsets.all(8),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              print(
                                                  "Gallery Length is ${_rooster.first.gallery.length}");
                                              if (_rooster
                                                      .first.gallery.length ==
                                                  0) {
                                                return Center(
                                                  child:
                                                      Text("No Data Available"),
                                                );
                                              } else {
                                                var gallery = _rooster
                                                    .first.gallery
                                                    .elementAt(index);

                                                return Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        AppConstants.base_URL +
                                                            gallery.image,
                                                    width: 200,
                                                    height: 100,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              32, 64, 32, 64),
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        color: AppConstants
                                                            .siteSubColor,
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                );
                                              }
                                            },
                                          ));
                          }),
                        ),

                        Obx(() => ButtonCustom(
                              elevation: 0,
                              fontsize: 12,
                              width: size.width - 32,
                              buttonText: _isbuttonTapped.value &&
                                      _rooster.first.IsEnquired.value == true
                                  ? "Remove".toUpperCase()
                                  : "Add".toUpperCase(),
                              onPress: () {
                                _isbuttonTapped.toggle();
                                _isbuttonTapped.value
                                    ? {
                                        Get.defaultDialog(
                                            title: "Rooster Inquired",
                                            middleText: "Check Inquire List.",
                                            onConfirm: () {
                                              Navigator.of(context).pop();
                                            },
                                            confirmTextColor:
                                                AppConstants.siteSubColor,
                                            buttonColor:
                                                AppConstants.subTextGrey),
                                        _enquireListController
                                            .roosterEnquireList
                                            .add(EnquireRooster(
                                                rooster: _rooster.first)),
                                        _rooster.first.IsEnquired.toggle(),
                                        print(
                                            "Rooster Value = ${_rooster.first.IsEnquired.value}")
                                      }
                                    : {
                                        Get.defaultDialog(
                                            title: "Inquiry Canceled.",
                                            middleText:
                                                "Rooster removed from Inquire List",
                                            onConfirm: () {
                                              Navigator.of(context).pop();
                                            },
                                            onCancel: () {
                                              // Navigator.of(context).pop();
                                            },
                                            confirmTextColor:
                                                AppConstants.siteSubColor,
                                            buttonColor:
                                                AppConstants.subTextGrey),
                                        _enquireListController
                                            .roosterEnquireList
                                            .removeWhere((element) =>
                                                element.rooster.id ==
                                                _rooster.first.id),
                                        _rooster.first.IsEnquired.toggle(),
                                        print(
                                            "Rooster Value = ${_rooster.first.IsEnquired.value}")
                                      };
                              },
                              backgroundColor: _isbuttonTapped.value &&
                                      _rooster.first.IsEnquired.value == true
                                  ? AppConstants.siteSubColor
                                  : AppConstants.subTextGrey,
                              foregroundColor: _isbuttonTapped.value &&
                                      _rooster.first.IsEnquired.value == true
                                  ? Colors.white
                                  : AppConstants.siteSubColor,
                              paddingLeft: 8,
                              paddingBottom: 0,
                              paddingTop: 0,
                              paddingRight: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text("Loading"));
          }
        },
      ),
    );
  }
}
