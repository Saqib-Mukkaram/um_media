import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/CustomWidgets/ProfileInfo.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/Views/Enquire/EnquireForm.dart';

class TalentProfile extends StatefulWidget {
  const TalentProfile({super.key});

  @override
  State<TalentProfile> createState() => _TalentProfileState();
}

class _TalentProfileState extends State<TalentProfile> {
  var scaffoldKey;
  var _isTapped;
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
  var infohead = ["Name", "Location", "Age", "Bust", "Waist", "Hips"];
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

  @override
  void initState() {
    // TODO: implement initState
    scaffoldKey = GlobalKey<ScaffoldState>();
    _isTapped = false;
    _isbuttonTapped = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: const Color.fromARGB(99, 84, 76, 76),
      drawer: SideBar(),
      appBar: CustomAppBar(scaffoldkey: scaffoldKey),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/imgs/People/Sana-1.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sana Mirza",
                  style:
                      TextStyle(color: AppConstants.subTextGrey, fontSize: 18),
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
                              color: AppConstants.siteSubColor, fontSize: 18),
                        ),
                        Text(
                          "Enquiries",
                          style: TextStyle(color: AppConstants.subTextGrey),
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
                              color: AppConstants.siteSubColor, fontSize: 18),
                        ),
                        Text(
                          "Likes",
                          style: TextStyle(color: AppConstants.subTextGrey),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "#Model",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppConstants.siteSubColor,
                          backgroundColor: AppConstants.subTextGrey,
                          minimumSize: Size(40, 20),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "#Actor",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppConstants.siteSubColor,
                          backgroundColor: AppConstants.subTextGrey,
                          minimumSize: Size(40, 20),
                        ),
                      ),
                    ],
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
                        ButtonCustom(
                          elevation: 0,
                          height: 25,
                          width: size.width / 4,
                          buttonText: "Photos".toUpperCase(),
                          fontsize: 12,
                          onPress: () {
                            setState(() {
                              _isTapped = false;
                            });
                          },
                          backgroundColor: Colors.transparent,
                          foregroundColor: _isTapped
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
                              _isTapped = true;
                            });
                          },
                          backgroundColor: Colors.transparent,
                          foregroundColor: _isTapped
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
                          onPress:
                              (){
                                setState(() {
                                  _isbuttonTapped= !_isbuttonTapped;
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
                    child: _isTapped
                        ? Row(
                            children: [
                              Container(
                                width: 200,
                                height: 300,
                                child: ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                          visualDensity:
                                              VisualDensity(vertical: -4),
                                          leading: infoIcons[index],
                                          title: Text(infohead[index]),
                                          subtitle: Text(infolist[index]),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 0, 0, 0));
                                    }),
                              ),
                              Container(
                                width: 200,
                                height: 300,
                                child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                          visualDensity:
                                              VisualDensity(vertical: -4),
                                          leading: infoIcons[index + 3],
                                          title: Text(infohead[index + 3]),
                                          subtitle: Text(infolist[index + 3]),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 0, 0, 0));
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
                              itemCount: _imgs_sana.length,
                              padding: EdgeInsets.all(8),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Image.asset(
                                    _imgs_sana[index],
                                    width: 100,
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
      ),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}

// ListTile(
//                       contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
//                       title: Text("Name"),
//                       subtitle: Text("Sana Mirza"),
//                     );
//  Container(
//                             height: 300,
//                             child: ListView.builder(
//                                 itemCount: 3,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return ListTile(
//                                       leading: infoIcons[index],
//                                       title: Text(infohead[index]),
//                                       subtitle: Text(infolist[index]),
//                                       contentPadding:
//                                           EdgeInsets.fromLTRB(16, 0, 0, 0));
//                                 }),
//                           )