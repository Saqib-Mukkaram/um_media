import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/LabelText.dart';
import 'package:um_media/CustomWidgets/ModelSideBar.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/CustomWidgets/StudioCard.dart';
import 'package:um_media/CustomWidgets/TalentCard.dart';
import 'package:um_media/CustomWidgets/TalentCard_Artisan.dart';
import 'package:um_media/Views/Talents/TalentsView.dart';

class HomeArtisanScreen extends StatefulWidget {
  const HomeArtisanScreen({super.key});

  @override
  State<HomeArtisanScreen> createState() => _HomeArtisanScreenState();
}

enum CustomTabButtons { Photos, Info, Talents }

class _HomeArtisanScreenState extends State<HomeArtisanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var barNumber = 0;
  late CustomTabButtons _tabButtons;

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
  var infolist = [
    "Sana Mirza",
    "Lahore Pakistan",
    "26",
    "81cm",
    "66cm",
    "89cm"
  ];
  var _isTapped;
  var _imgs_sana = AppConstants.img_sana;
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
        body: Builder(
          builder: (context) {
            return TabBarView(
              controller: _tabController,
              children: [
                SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width,
                          height: (size.height - kToolbarHeight - 150),
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
                                  spreadRadius: 5, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  // offset: Offset(0, 3), // Offset from the widget
                                ),
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                "Sana Mirza",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                                    leading: infoIcons[index],
                                                    title:
                                                        Text(infohead[index]),
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ListTile(
                                                    visualDensity:
                                                        VisualDensity(
                                                            vertical: -4),
                                                    leading:
                                                        infoIcons[index + 3],
                                                    title: Text(
                                                        infohead[index + 3]),
                                                    subtitle: Text(
                                                        infolist[index + 3]),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            16, 0, 0, 0));
                                              }),
                                        ),
                                      ],
                                    )
                                  : barNumber == 0
                                      ? Container(
                                        height: 600,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount: _imgs_sana.length,
                                          padding: EdgeInsets.all(8),
                                          itemBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return index == 0
                                                ? IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.add))
                                                : Padding(
                                                    padding:
                                                        EdgeInsets.all(4),
                                                    child: Image.asset(
                                                      _imgs_sana[index],
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
                                              itemCount: 2,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ButtonCustom(
                                                  borderRadius: 0,
                                                  paddingBottom: 0,
                                                  paddingTop: 10,
                                                  backgroundColor:
                                                      AppConstants.subTextGrey,
                                                  foregroundColor:
                                                      AppConstants.siteSubColor,
                                                  buttonText: "Actor",
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
                            padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
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
                                    BorderRadius.all(Radius.circular(50)),
                                child: Image.asset(
                                  "assets/imgs/People/Sana-1.png",
                                  width: 75,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(
                                    "assets/imgs/People/Sana-2.png"),
                              ),
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
            );
          },
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
