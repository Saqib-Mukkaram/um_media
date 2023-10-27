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
  var rooster_id;
  var errors = ''.obs;
  var message = ''.obs;

  Future<bool> registerRooster({
    required Register register,
  }) async {
    final Dio dio = Dio();
    // var response = await dio.post(AppConstants.base_URL + AppConstants.register,
    //     options: Options(headers: AppConstants.httpHeader),
    //     data: {
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
    //       "height": register.height,
    //       "weight": register.weight,
    //       "profile_image":
    //           base64Encode(register.profileImage!.readAsBytesSync()),
    //     });
    //
    var response = await http.post(
    Uri.parse(AppConstants.base_URL + AppConstants.register),
    headers: AppConstants.httpHeader,
    body: {
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
      "height": register.height,
      "weight": register.weight,
      "profile_image":
          base64Encode(register.profileImage!.readAsBytesSync()),
    });


    print(response.body);
    var x = jsonDecode(response.body);
    print(x['message']);
    if (response.statusCode == 200) {
      rooster_id = x['data']['roster_id'];

      print(rooster_id);
      if (x['status'] == true) {
        rooster_id = x['data']['roster_id'];
        print(rooster_id);
        return true;
      } else {
        print(response.body);
        return false;
      }
    } else {
      print("returning false");
      // errors.value = response.body['errors'];
      // message.value = response.body['message'];
      // Get.defaultDialog(title: "Error", middleTeresponse.datat: x['message']);
      return false;
    }
  }
}
