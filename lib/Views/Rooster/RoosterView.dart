import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/RoosterImages.dart';
import 'package:um_media/Models/RoosterInterests.dart';

class RoosterView extends StatefulWidget {
  final int rooster_id;
  RoosterView({required this.rooster_id, super.key});

  @override
  State<RoosterView> createState() => _RoosterViewState();
}

class _RoosterViewState extends State<RoosterView> {
  //FIXME: Need to Come back here for testing if this is necessary
  RoosterController _controller = RoosterController();

  RxBool _isTapped = false.obs;

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
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Create widgets and add them to the list
  @override
  Widget build(BuildContext context) {
    //TODO: TAKE A LOOK

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
      ),
      body: FutureBuilder(
          future: _controller.fetchAll(),
          builder: (context, snapshot) {
            List<Widget> widgets = [];
            List<RoosterData> rooster;
            // var rooster_interests = _controller.roosterInterests.first;
            var tilelist = [];

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
                child:
                    Text("Error: Cannot Fetch Data."), // Show an error message
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              rooster = _controller.roosterList
                  .where((element) => element.id == widget.rooster_id)
                  .toList();
              var rooster_data = rooster.first;

              // rooster_images = _controller.roosterGallery.where((element) => element.roster_id == widget.rooster_id).toList();
              List<List<RoosterImages>> rooster_images = _controller
                  .roosterGallery
                  .where((innerList) => innerList
                      .any((element) => element.roster_id == widget.rooster_id))
                  .toList();

              tilelist = [
                "${rooster_data.firstName} ${rooster_data.lastName}",
                "${rooster_data.city} ${rooster_data.country}",
                rooster_data.dob,
                rooster_data.phone,
                rooster_data.weight,
                rooster_data.height
              ];
              print(" ${rooster_data.firstName} \n${rooster_data.lastName}\n");
              List<List<RoosterInterests>> rooster_interests = _controller
                  .roosterInterests
                  .where((innerList) => innerList
                      .any((element) => element.roosterId == widget.rooster_id))
                  .toList();
              
              for (int i = 0; i < rooster_interests.first.length ; i++) {
                print("Rooster Interests Length = ${rooster_interests.length}");
                var interestsdata = rooster_interests.first;
                var interests = interestsdata.elementAt(i);

                widgets.add(
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text(
                        interests.name,
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppConstants.siteSubColor,
                        backgroundColor: AppConstants.subTextGrey,
                        minimumSize: Size(40, 20),
                      ),
                    ),
                  ),
                );
              }
              return SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        //FIXME: THis is yet to be Looked AT.
                        ClipOval(
                          child: Image.network(
                            AppConstants.base_URL + rooster_data.profile_image,
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${rooster_data.firstName} ${rooster_data.lastName}",
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
                                  "Enquiries",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //FIXME: Its not Showing Buttons But
                            Container(
                              height: 75,
                              child: Row(
                                children: widgets,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
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
                                        //FIXME: THis is to be Looked at
                                        // setState(() {
                                        //   _isTapped.value = false;
                                        // });
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
                                Obx(() => ButtonCustom(
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
                                    ),),
                                //TODO: Put in it the bottom of the page.
                              ],
                            ),
                          ),
                        ),
                        // Divider(
                        //   indent: 16,
                        //   endIndent: 16,
                        //   color: AppConstants.siteSubColor,
                        // ),
                        SingleChildScrollView(
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: Obx(() {
                                return _isTapped.value
                                    ? Row(
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 300,
                                            child: ListView.builder(
                                                itemCount: 3,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  print(
                                                      "this is working -- Info");
                                                  return ListTile(
                                                      visualDensity:
                                                          VisualDensity(
                                                              vertical: -4),
                                                      leading: infoIcons[index],
                                                      title:
                                                          Text(infohead[index]),
                                                      subtitle: Text(
                                                          tilelist[index]
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
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  print(
                                                      "info List is Working Correctly");
                                                  return ListTile(
                                                      visualDensity:
                                                          VisualDensity(
                                                              vertical: -4),
                                                      leading:
                                                          infoIcons[index + 3],
                                                      title: Text(
                                                          infohead[index + 3]),
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
                                        height: 350,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          //FIXME: Hardcoded VALUE
                                          itemCount: 5,
                                          padding: EdgeInsets.all(8),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            print(
                                                "Rooster images length == ${rooster_images}");
                                            var roostergallery =
                                                rooster_images.first;
                                            var roosterPhoto =
                                                roostergallery.elementAt(index);
                                            return Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Image.network(
                                                AppConstants.base_URL +
                                                    roosterPhoto.image,
                                                width: 200,
                                                height: 100,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                              })),
                        ),
                        // ButtonCustom(
                        //   buttonText: "Enquire Now",
                        //   onPress: () {
                        //     Get.to(Enquire());
                        //   },
                        //   backgroundColor: AppConstants.subTextGrey,
                        //   foregroundColor: AppConstants.siteSubColor,
                        // )
                        Obx(() => ButtonCustom(
                                      elevation: 0,
                                      
                                      fontsize: 12,
                                      width: size.width  - 32,
                                      buttonText: _isbuttonTapped.value
                                          ? "enquired".toUpperCase()
                                          : "Enquire".toUpperCase(),
                                      onPress: () {
                                        //TODO: THis is to be Implemented
                                        _isbuttonTapped.toggle();
                                        _isbuttonTapped.value
                                            ? Get.defaultDialog(
                                                title: "Rooster Enquired",
                                                middleText:
                                                    "Check Enquire List.")
                                            : Get.defaultDialog(
                                                title: "Enquiry Canceled.",
                                                middleText:
                                                    "Rooster removed from Enquire List");
                                      },
                                      backgroundColor: _isbuttonTapped.value
                                          ? AppConstants.siteSubColor
                                          : AppConstants.subTextGrey,
                                      foregroundColor: _isbuttonTapped.value
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
              );
            } else {
              return Center(
                child: Text("Loading...."),
              );
            }
          }),
    );
  }
}
