// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/EnquireListController.dart';
import 'package:um_media/Controller/LoginController.dart';
import 'package:um_media/Controller/RentalsController.dart';
import 'package:um_media/Controller/StudioController.dart';
import 'package:um_media/Controller/TalentController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/SidebarButtons.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/EnquireList.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/RentalBar.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/Studios.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/StudiosBar.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/Talents.dart';
import 'package:um_media/Views/Homes/ClientHome/widgets/TalentsBar.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Registeration/Register.dart';
import 'package:um_media/Views/Rentals/RentalsSection.dart';

import '../../../Models/Rentals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final EnquireListController _enquireListController = Get.find();
  final LoginController _loginController = Get.find();

  var scaffoldKey;

  Future<void> _refresh() async {
    StudioController _studioController = Get.find();
    TalentController _talentController = Get.find();
    RentalController _rentalController = Get.find();
    await _studioController.fetchAll();
    await _talentController.fetchAll();
    setState(() {});
  }

  @override
  void initState() {
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
        // drawer: SideBar(),
        appBar: AppBar(
          // leading: SizedBox(),
          // IconButton(
          //   icon: Icon(Icons.menu_outlined),
          //   color: AppConstants.siteSubColor,
          //   onPressed: () {
          //     scaffoldKey.currentState?.openDrawer();
          //   // },

          bottom: TabBar(
            controller: _tabController,
            dividerColor: AppConstants.siteSubColor,
            indicatorColor: AppConstants.siteSubColor,
            indicatorSize: TabBarIndicatorSize.tab,
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
                child: Obx(
                  () => _enquireListController.roosterEnquireList.isEmpty
                      ? IconButton(
                          onPressed: () {
                            _tabController.animateTo(1);
                          },
                          icon: Icon(
                            Icons.favorite_outlined,
                            color: AppConstants.siteSubColor,
                          ),
                        )
                      : Stack(children: [
                          // Icon
                          IconButton(
                              icon: Icon(
                                Icons.favorite_outlined,
                                color: AppConstants.siteSubColor,
                              ),
                              onPressed: () {
                                _tabController.animateTo(1);
                              }),
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
                                        _enquireListController
                                            .roosterEnquireList.length
                                            .toString(),
                                        // Replace with your counter value
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Customize the text color
                                          fontSize:
                                              12, // Customize the font size
                                        ),
                                      ),
                              )),
                            ),
                          ),
                        ]),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "home".tr,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: _loginController.isLoggedin.value
                  ? SideBarButtons(
                      buttonIcon: Icon(
                        Icons.logout_outlined,
                      ),
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Sign Out",
                            cancel: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No"),
                            ),
                            middleText:
                                "Tapping yes will return to login screen",
                            confirm: ElevatedButton(
                              onPressed: () {
                                Get.offAll(LoginScreen());
                              },
                              child: Text("Yes"),
                            ));
                      },
                      label: Text("Logout"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                    )
                  : SideBarButtons(
                      buttonIcon: Icon(
                        Icons.login_outlined,
                      ),
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      label: Text("Log In"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
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
                          //Talents Bar
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
                          //Rental Bar
                          Container(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RentalsBar(),
                            ),
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: RentalsSection(),
                          ),
                          //Studios Bar
                          InkWell(
                            child: Container(
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StudiosBar(),
                              ),
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
                              Get.to(RegisterScreen());
                            },
                            backgroundColor: AppConstants.subTextGrey,
                            foregroundColor: AppConstants.siteSubColor,
                            paddingTop: 8,
                            paddingBottom: 0,
                            paddingLeft: 0,
                            paddingRight: 0,
                            width: 200,
                          ),
                          SizedBox(
                            height: 20,
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
