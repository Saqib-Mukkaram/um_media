import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Views/Login/Login.dart';
import 'package:um_media/Views/Profile/ProfilePage.dart';

import 'SidebarButtons.dart';

class ModelSideBar extends StatefulWidget {
  const ModelSideBar({
    super.key,
  });

  @override
  State<ModelSideBar> createState() => _ModelSideBarState();
}

class _ModelSideBarState extends State<ModelSideBar> {
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
            // ListTile(
            //   tileColor: Colors.transparent,
            //   leading: ClipOval(
            //     child: Image.asset(
            //       AppConstants.img_person,
            //       width: 50,
            //       height: 50,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   enabled: true,
            //   title: Text("username".tr),
            //   subtitle: Text("Number/Descp"),
            //   onTap: () {},
            // ),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10.0),
                shrinkWrap: true, // Set shrinkWrap to true
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Get.to(ProfilePage());
                    },
                    dense: true,
                    leading: Icon(
                      Icons.account_circle_outlined,
                    ),
                    title: Text("Profile"),
                    subtitle: Text("Profile Settings"),
                  );
                },
              ),
            ),
            Spacer(),
            SideBarButtons(
              buttonIcon: Icon(
                Icons.logout_outlined,
              ),
              onPressed: () {
                Get.offAll(LoginScreen());
              },
              label: Text("Logout"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
