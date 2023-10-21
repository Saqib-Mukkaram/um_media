
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Register.dart';
import 'package:um_media/Models/Update.dart';
class UpdateController extends GetxController {
  Future<bool> updateRooster({
    required Update register,
  }) async {
    var indexedInterests = Map.fromIterable(
      List.generate(register.interests!.length, (index) => index),
      key: (index) => '${index.toString()}',
      value: (index) => register.interests![index],
    );
    var x =  jsonEncode(indexedInterests);
    // var y = base64Encode(register.profileImage!.readAsBytesSync());
    // print(y);

    // // var indexedInterests = Map.fromIterable(register.interests as Iterable,
    // //     key: (index) => '$index', value: (interest) => interest);
    // var x = jsonEncode(register.interests);
    // print("the Value of Interests is ${register.interests}");
    print("the Value of x is $x");

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
          "interests": x,
          "profile_image":
              base64Encode(register.profileImage!.readAsBytesSync()),
        });

    if (response.statusCode == 200) {
      // print(response.headers);
      print(response.request);
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