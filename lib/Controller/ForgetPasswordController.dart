import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';

class ForgetPasswordController extends GetxController {
  var code;
  var message;
  
  Future<bool> updatePassword(
      {required String email, required String password}) async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL +
            AppConstants.rooster_forget_password_update),
        headers: AppConstants.httpHeader,
        body: {"email": email, "password": password});

    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      if (data['status'] == true) {
        return true;
      }
      else {
        return false;
      }
    } else {
      return false;
    }
  }


  Future<bool> forgetpasswordRequest({required String email}) async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rooster_forget_password),
        headers: AppConstants.httpHeader,
        body: {
          "email": email,
        });

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['status'] == true) {
        print(data['message']);
        code = data['data']['code'];
        print(code);
        message = data['message'];
        return true;
      } else {
        print(data['message']);
        return false;
      }
    } else {
      message = data['message'];
      return false;
    }
  }
}
