import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/CustomWidgets/CustomAppBar.dart';
import 'package:um_media/CustomWidgets/SideBar.dart';
import 'package:um_media/CustomWidgets/TalentPost.dart';
import 'package:um_media/CustomWidgets/TalentProfile.dart';

class TalentsView extends StatefulWidget {
  const TalentsView({super.key});

  @override
  State<TalentsView> createState() => _TalentsViewState();
}

class _TalentsViewState extends State<TalentsView> {
  var scaffoldKey;
  @override
  void initState() {
    // TODO: implement initState
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var talentslist = ["Sana Mirza"];
  var talenturl = ["assets/imgs/People/Sana-2.png"];

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
        key: scaffoldKey,
        drawer: SideBar(),
        appBar: CustomAppBar(
          scaffoldkey: scaffoldKey,
        ),
        body: SafeArea(
          child: ListView.builder(
            // scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true, // Set shrinkWrap to true
            itemCount:3 ,
            itemBuilder: (BuildContext context, int index) {
              return TalentPost() ;
            },
          ),
        ));
  }
}
// 
//  Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.to(TalentProfile());
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(12)),
//                             child: Container(
//                                 color: Colors.black,
//                                 // color: Color.fromARGB(28, 0, 0, 0),
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       // Image.asset(AppConstants.img_photography)
//                                       Image.asset(
//                                         talenturl[0],
//                                         width: 150,
//                                         height: 200,
//                                         fit: BoxFit.cover,
//                                       )
//                                     ]))),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.to(TalentProfile());
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(12)),
//                             child: Container(
//                                 color: Colors.black,
//                                 // color: Color.fromARGB(28, 0, 0, 0),
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       // Image.asset(AppConstants.img_photography)
//                                       Image.asset(
//                                         talenturl[0],
//                                         width: 150,
//                                         height: 200,
//                                         fit: BoxFit.cover,
//                                       )
//                                     ]))),
//                       ),
//                     ),
                    
//                   ],
//                 );