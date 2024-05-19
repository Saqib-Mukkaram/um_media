import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/LoginRequest.dart';
import 'package:um_media/Models/LoginRequest.dart';
import 'package:um_media/Models/Rooster.dart';

class LoginController extends GetxController {

  //Ctor
  @override
  void onInit() {
    super.onInit();
  }


  var isLoggedin = false.obs;
  // var RoosterId;
  Rooster? rooster;
  Future<bool> Login(LoginRequest loginrequest) async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.login),
        headers: AppConstants.httpHeader,
        body: {
          "email": loginrequest.email,
          "password": loginrequest.password,
        });
    // return respone.statusCode;
    var x = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (x['status'] == true) {
        print(x);
        var jsonData = jsonDecode(response.body)['data'];
        rooster = Rooster.fromJson(jsonData);
        isLoggedin = true.obs;
        return true;
      } else {
        print(x);
        return false;
      }
    } else {
      print("Invalid Credientials");
      return false;
    }
  }
  // Future<void> LoginData(){

  // }
}
