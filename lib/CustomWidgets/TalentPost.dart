import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/TalentProfile.dart';
import 'package:um_media/Models/RoosterInterests.dart';
import 'package:um_media/Views/Rooster/RoosterView.dart';

class TalentPost extends StatelessWidget {
  final String profilePath;
  final String imagePath;
  final String roosterName;
  final int roosterId;
  final List<RoosterInterests> roosterTags;
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
    String tagsText = roosterTags.map((tag) => tag.name).join(', ');
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Material(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            elevation: 12,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                //  TODO: Needs to be FIXED //
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.network(imagePath,
                        width: size.width, height: 300, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
          //This is the Center Image
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 7, // Blur radius
                        // offset: Offset(0, 3), // Offset from the widget
                      ),
                    ]),
                    child: InkWell(
                      onTap: () {
                        //FIXME: THese need to be looked at
                        Get.to(RoosterView());
                      },
                      //FIXME: Images are to be Like Fixed
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.network(
                          profilePath,
                          width: 75,
                          height: 75,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Text(
                  roosterName,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 20, 0),
                child: Text(
                  tagsText,
                  style:
                      TextStyle(fontSize: 12, color: AppConstants.subTextGrey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
