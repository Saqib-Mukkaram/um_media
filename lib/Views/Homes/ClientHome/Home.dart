import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/Controller/TalentController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/EnquireList.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/Studios.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/StudiosBar.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/Talents.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/TalentsBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var scaffoldKey;

  Future<void> _refresh() async {
    StudioController _studioController = Get.find();
    TalentController _talentController = Get.find();
    setState(() {
      _studioController.getStudios();
      _talentController.getCategories();
    });
    
  }

  @override
  void initState() {
    // TODO: implement initState
    scaffoldKey = GlobalKey<ScaffoldState>();
    _tabController = TabController(length: 2, vsync: this);
    //INIT the Controller
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 500),
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: SideBar(),
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
                      Icons.shopping_bag_outlined,
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
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  AppConstants.img_person,
                  width:
                      35.0, // Set the width and height to twice the radius to make it circular
                  height: 35.0,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        body: Builder(
          builder: (context) {
            return TabBarView(
              controller: _tabController,
              children: [
                RefreshIndicator(
                  onRefresh: _refresh,
                  color: AppConstants.siteSubColor,
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TalentsBar(),
                            ),
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Talents()),
                          // Divider(
                          //   indent: 16,
                          //   endIndent: 16,
                          // ),
                          InkWell(
                            child: Container(
                              color: Colors.black,
                              child: StudiosBar(),
                            ),
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Studios()),
                          Divider(
                            indent: 16,
                            endIndent: 16,
                          ),
                          Text(
                            "join_us_talent".tr,
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
                            buttonText: "apply_now_button".tr,
                            onPress: () async {
                              // print(_controller.parseCategory(data));
                            },
                            backgroundColor: AppConstants.subTextGrey,
                            foregroundColor: AppConstants.siteSubColor,
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
                ),
                SafeArea(
                  child: EnqurieList(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
