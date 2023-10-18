import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Controller/RegisterController.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';
import 'package:um_media/Models/Register.dart';
import 'package:um_media/Views/Homes/HomeArtisan/HomeArtisanRegistered.dart';
import 'package:um_media/Views/Homes/HomeArtisan/Home_artisan.dart';
import 'package:um_media/Views/Registeration/Register.dart';

class RoosterRegistering extends StatefulWidget {
  Register rooster;
  RoosterRegistering({
    super.key,
    required this.rooster,
  });

  @override
  State<RoosterRegistering> createState() => _RoosterRegisteringState();
}

class _RoosterRegisteringState extends State<RoosterRegistering> {
  RegisterController _registerController = RegisterController();
  
  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Registering Rooster",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 40,
              ),
              FutureBuilder(
                  future: _registerController.registerRooster(
                      register: widget.rooster),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data == true) {
                        return Column(
                          children: [
                            Text(
                              "Rooster Registration Successfull!",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.green),
                            ),
                            ButtonCustom(
                              buttonText: "Continue",
                              onPress: () {
                                Get.offAll(HomeArtisanRegistered(
                                    rooster_id:
                                        _registerController.rooster_id));
                              },
                              backgroundColor: AppConstants.subTextGrey,
                              foregroundColor: AppConstants.siteSubColor,
                            )
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Text(
                              "Rooster Registration Failed",
                              style: TextStyle(fontSize: 24, color: Colors.red),
                            ),
                            // Text(
                            //   "${_registerController.message}",
                            //   style: TextStyle(fontSize: 18, color: Colors.black),
                            // ),
                            ButtonCustom(
                              buttonText: "Retry",
                              onPress: () {

                                setState(() {});
                              },
                              backgroundColor: AppConstants.subTextGrey,
                              foregroundColor: AppConstants.siteSubColor,
                            )
                          ],
                        );
                      }
                    } else {
                      return Column(
                        children: [
                          CircularProgressIndicator(
                            color: AppConstants.siteSubColor,
                            strokeWidth: 8,
                          ),
                        ],
                      );
                    }
                  })
            ]),
          ),
        ));
  }
}
