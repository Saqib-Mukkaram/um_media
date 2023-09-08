import 'package:flutter/material.dart';
import 'package:um_media/AppConstants.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      child: Icon(
                        Icons.person_outlined,
                        color: AppConstants.subTextGrey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Sana Mirza",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            //Accesibility 1
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("image"),
                    Column(
                      children: [Text("Title"), Text("subTitle")],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        // Location
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                child: Icon(
                  Icons.place_outlined,
                  color: AppConstants.subTextGrey,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Lahore Pakistan",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
              //Next Goes Here
            ],
          ),
        ),
        //Location ends
        // Location
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                child: Icon(
                  Icons.psychology_outlined,
                  color: AppConstants.subTextGrey,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "26",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
              //Next Goes Here
            ],
          ),
        ),
        //Location ends
      ],
    );
  }
}
