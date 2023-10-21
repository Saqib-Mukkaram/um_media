import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Views/Login/Login.dart';

import 'SidebarButtons.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  var buttonlist = [];
  var functionlist = [];
  var buttonIconlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 8,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),

            Divider(
              indent: 16,
              endIndent: 16,
            ),
            // Container(
            //   height: 500,
            //   child: ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     padding: EdgeInsets.all(10.0),
            //     shrinkWrap: true, // Set shrinkWrap to true
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         dense: true,
            //         leading: Icon(
            //           Icons.help_outline_outlined,
            //         ),
            //         title: Text("Sample"),
            //         subtitle: Text("Description"),
            //       );
            //     },
            //   ),
            // ),
            Spacer(),
            SideBarButtons(
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
                    middleText: "Tapping yes will show the Login Screen",
                    confirm: ElevatedButton(
                      onPressed: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Text("Yes"),
                    ));
              },
              label: Text("Logout"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
