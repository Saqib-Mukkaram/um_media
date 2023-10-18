import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Register.dart';

class RegisterController extends GetxController {
  int rooster_id = 0;
  var errors;
  var message;

  Future<bool> registerRooster({
    required Register register,
  }) async {

    var response = await Dio().post(
        AppConstants.base_URL + AppConstants.register,
      options: Options(headers: AppConstants.httpHeader),
      data: {
        "first_name": register.firstname,
          "last_name": register.lastName,
          "gender": register.gender!.toLowerCase(),
          "city": register.city,
          "state": register.state,
          "country": register.country,
          "email": register.email,
          "password": register.password,
          "phone": register.phone,
          "date_of_birth": register.dob,
          "interests": jsonEncode(register.interests),
          "profile_image":
              base64Encode(register.profileImage!.readAsBytesSync()),
        }
    );

    print(response.statusCode);


    var x = jsonDecode(response.data);
    errors =x['errors'];
    message = x['message'];

    if (response.statusCode == 200) {
      if (x['status'] == true) {
        print(x);
        rooster_id = x['data']['roster_id'];
        print(errors);
        print(message);
        return true;
      } else {
        print(errors);
        print(message);
        print(x);

        return false;
      }
    } else {
      print(errors);
      print(message);
      print(response.statusCode);
      print(x);
      // Get.defaultDialog(title: "Error", middleText: x['message']);
      return false;
    }
  }
}
// var response = await http.post(
//     Uri.parse(AppConstants.base_URL + AppConstants.register),
//     headers: AppConstants.httpHeader,
//     body: {
//       "first_name": register.firstname,
//       "last_name": register.lastName,
//       "gender": register.gender!.toLowerCase(),
//       "city": register.city,
//       "state": register.state,
//       "country": register.country,
//       "email": register.email,
//       "password": register.password,
//       "phone": register.phone,
//       "date_of_birth": register.dob,
//       "interests": jsonEncode(register.interests),
//       "profile_image":
//           base64Encode(register.profileImage!.readAsBytesSync()),
//     });