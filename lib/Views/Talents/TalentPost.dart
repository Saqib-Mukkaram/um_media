// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/ShimmerController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/TalentProfile.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/RoosterInterests.dart';
import 'package:um_media/Views/Rooster/RoosterView.dart';

class TalentPost extends StatelessWidget {
  final String profilePath;
  final String imagePath;
  final String roosterName;
  final int roosterId;
  final List<Interest> roosterTags;
  const TalentPost(
      {required this.roosterId,
      required this.roosterName,
      required this.imagePath,
      required this.profilePath,
      required this.roosterTags,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String tagsText = roosterTags.map((tag) => tag.name).join(' #');
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          // offset: Offset(0, 3), // Offset from the widget
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                child: Text(
                                  roosterName,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
                                child: Text(
                                  "#$tagsText",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppConstants.subTextGrey),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: CachedNetworkImage(
                            imageUrl: imagePath,
                            width: size.width,
                            height: 400,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                ShimmerController.shimmerList(),
                            // progressIndicatorBuilder:
                            //     (context, url, downloadProgress) => Padding(
                            //   padding: EdgeInsets.fromLTRB(32, 64, 32, 64),
                            //   child: CircularProgressIndicator(
                            //     value: downloadProgress.progress,
                            //     color: AppConstants.siteSubColor,
                            //   ),
                            // ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //This is the Center Image

            Positioned(
              right: 15,
              bottom: 20,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.to(RoosterView(
                      rooster_id: roosterId,
                    ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Material(
                      elevation: 8,
                      child: Container(
                        width: 75,
                        height: 75,
                        color: AppConstants.subTextGrey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // SizedBox(height: 10,),
                            Text(
                              "View",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppConstants.siteSubColor,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // child: CachedNetworkImage(
                    //   imageUrl:profilePath,
                    //   width: 75,
                    //   height: 75,
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ButtonCustom(buttonText: "View Profile", onPress:(){
//                Get.to(RoosterView(
//                 rooster_id: roosterId,
//               ));
//             },
//             width: 30,
//             backgroundColor: AppConstants.subTextGrey,
//             foregroundColor: AppConstants.siteSubColor,
//             ),