import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RoosterController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/Models/Rooster.dart';

class RoosterView extends StatefulWidget {
  const RoosterView({super.key});

  @override
  State<RoosterView> createState() => _RoosterViewState();
}

class _RoosterViewState extends State<RoosterView> {
  RoosterController _controller = RoosterController();

  var _isTapped = RxBool(false);
  bool _isbuttonTapped = false;
  var _imgs_sana = AppConstants.img_sana;
  var infolist = [
    "Sana Mirza",
    "Lahore Pakistan",
    "26",
    "81cm",
    "66cm",
    "89cm"
  ];

  Future<Future> PageFuture() {
     _controller.fetchRoosters();
     _controller.fetchRoostersImages();
     _controller.fetchRoostersInterests();
    return Future.delayed(Duration(seconds: 1));
  }

  var infohead = ["Name", "Location", "Date of Birth", "Bust", "Waist", "Hips"];
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
  void _handlefunctionTap() {
    setState(() {
      _isbuttonTapped = !_isbuttonTapped;
    });
  }

  var scaffoldkey;
  @override
  void initState() {
    // TODO: implement initState
    scaffoldkey = GlobalKey<ScaffoldState>();
    // _controller.fetchRoostersInterests();
    // _controller.fetchRoosters();
    PageFuture();
    _isTapped = false.obs;
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
          future: PageFuture(),
          builder: (context, snaphsot) {
            List<Widget> widgets = [];
            for (int i = 0; i < _controller.roosterInterests.length; i++) {
              var interests = _controller.roosterInterests.elementAt(i);
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
            var rooster = _controller.roosterList.first;
            var rooster_images = _controller.roosterImages.first;
            // var rooster_interests = _controller.roosterInterests.first;
            var tilelist = [
              "${rooster.firstName} ${rooster.lastName}",
              "${rooster.city} ${rooster.country}",
              rooster.dob,
              rooster.phone,
              rooster.weight,
              rooster.height
            ];

            if (snaphsot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ClipOval(
                          child: Image.network(
                            AppConstants.base_URL + rooster.profile_image,
                            width: 150,
                            height: 150,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${rooster.firstName} ${rooster.lastName}",
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
                                ButtonCustom(
                                  elevation: 0,
                                  height: 25,
                                  width: size.width / 4,
                                  buttonText: "Photos".toUpperCase(),
                                  fontsize: 12,
                                  onPress: () {
                                    setState(() {
                                      _isTapped.value = false;
                                    });
                                    // _isTapped.value = false;
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: _isTapped.value
                                      ? AppConstants.siteSubColor
                                      : Colors.white,
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
                                      _isTapped.value = true;
                                    });
                                    // _isTapped.value = true;
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
                                ButtonCustom(
                                  elevation: 0,
                                  height: 25,
                                  fontsize: 12,
                                  width: size.width / 4,
                                  buttonText: _isbuttonTapped
                                      ? "enquired".toUpperCase()
                                      : "Enquire".toUpperCase(),
                                  onPress: () {
                                    setState(() {
                                      _isbuttonTapped = !_isbuttonTapped;
                                    });
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: _isbuttonTapped
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
                        // Divider(
                        //   indent: 16,
                        //   endIndent: 16,
                        //   color: AppConstants.siteSubColor,
                        // ),
                        SingleChildScrollView(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: _isTapped.value
                                ? Row(
                                    children: [
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
                                                  leading: infoIcons[index],
                                                  title: Text(infohead[index]),
                                                  subtitle:
                                                      Text(tilelist[index]),
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
                                                      Text(tilelist[index + 3]),
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
                                      itemCount:
                                          _controller.roosterImages.length,
                                      padding: EdgeInsets.all(8),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var roosterPhoto = _controller
                                            .roosterImages
                                            .elementAt(index);
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
                                  ),
                          ),
                        ),
                        // ButtonCustom(
                        //   buttonText: "Enquire Now",
                        //   onPress: () {
                        //     Get.to(Enquire());
                        //   },
                        //   backgroundColor: AppConstants.subTextGrey,
                        //   foregroundColor: AppConstants.siteSubColor,
                        // )
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
