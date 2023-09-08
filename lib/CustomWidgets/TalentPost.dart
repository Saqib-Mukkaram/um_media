import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/CustomWidgets/TalentProfile.dart';

class TalentPost extends StatefulWidget {
  const TalentPost({super.key});

  @override
  State<TalentPost> createState() => _TalentPostState();
}

class _TalentPostState extends State<TalentPost> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      "assets/imgs/People/Sana-1.png",
                      width: size.width,
                    ),
                  ),
                ),
                // Divider(
                //   indent: 16,
                //   endIndent: 16,
                //   color: AppConstants.siteSubColor,
                // ),
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
                        Get.to(TalentProfile());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Text(
                  "Sana Mirza",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 20, 0),
                child: Text(
                  "#actor, #model",
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
