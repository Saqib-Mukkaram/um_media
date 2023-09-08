// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:um_media/AppConstants.dart';
// import 'package:um_media/CustomWidgets/CustomAppBar.dart';

// class CustomAppBarWithNav extends StatefulWidget
//     implements PreferredSizeWidget {
//   final scaffoldkey;

//   CustomAppBarWithNav({
//     required this.scaffoldkey,
//     Key? key,
//   }) : super(key: key);

//   set scaffoldKey(GlobalKey<ScaffoldState> scaffoldKey) {}

//   @override
//   _CustomAppBarWithNavState createState() => _CustomAppBarWithNavState();

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }

// class _CustomAppBarWithNavState extends State<CustomAppBarWithNav> {
//   @override
//   void initState() {
//     widget.scaffoldKey = GlobalKey<ScaffoldState>();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.menu_outlined),
//             color: Colors.white,
//             onPressed: () {
//               widget.scaffoldkey.currentState?.openDrawer();
//             },
//           ),
//           backgroundColor: Colors.black,
//           elevation: 0,
//           title: Text(
//             "home".tr,
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: ClipOval(
//                 child: Image.asset(
//                   AppConstants.img_person,
//                   width: 35.0,
//                   height: 35.0,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             )
//           ],
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Tab 1'),
//               Tab(text: 'Tab 2'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Contents for Tab 1
//             Center(
//               child: Text('Tab 1 Content'),
//             ),
//             // Contents for Tab 2
//             Center(
//               child: Text('Tab 2 Content'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TabsAppbar extends StatefulWidget {
//   const TabsAppbar({super.key});

//   @override
//   State<TabsAppbar> createState() => _TabsAppbarState();
// }

// class _TabsAppbarState extends State<TabsAppbar> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: CustomAppBar(scaffoldkey: scaffoldkey),
//       ),
//     );
//   }
// }
