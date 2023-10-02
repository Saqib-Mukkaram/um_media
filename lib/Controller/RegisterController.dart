import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';

class RegisterController {
  Future Register(firstname, lastname, email, password) async {
    var response = await http
        .post(Uri.parse(AppConstants.base_URL + AppConstants.register), body: {
      "first_name": "$firstname",
      "last_name": "$lastname",
      "email": "$email",
      "password": "$password",
    });
  }
}
