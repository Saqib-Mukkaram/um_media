import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final scaffoldkey;
  CustomAppBar({
    required this.scaffoldkey,
    Key? key,
  }) : super(key: key);

  set scaffoldKey(GlobalKey<ScaffoldState> scaffoldKey) {}

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    widget.scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu_outlined),
        color: Colors.white,
        onPressed: () {
          widget.scaffoldkey.currentState?.openDrawer();
        },
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
    );
  }
}
