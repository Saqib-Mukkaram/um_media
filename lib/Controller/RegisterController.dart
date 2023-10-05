import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Register.dart';

class RegisterController {
  Future<bool> registerRooster({
    required Register register,
  }) async {
    print(jsonEncode(register.interests));
    print(jsonEncode(register.interests
        ?.map((key, value) => MapEntry(key.toString(), value))));
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
          "profile_image":
              base64Encode(register.profileImage!.readAsBytesSync()),
        });
    if (response.statusCode == 200) {
      print(response.headers);
      print(response.statusCode);
      print(response.body);
      return true;
    } else {
      print(response.headers);
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }
}
