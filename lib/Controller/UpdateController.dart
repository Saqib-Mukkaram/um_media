import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Register.dart';
import 'package:um_media/Models/Update.dart';

class UpdateController extends GetxController {
  Future<bool> updateRooster({
    required Update updated,
    bool isProfile = false,
  }) async {
    //FIXME : this SHit SOMETIMES GIVES THE ERROR
    // THAT WE ARE USING POST WHEN CLEARLY IT IS MENTIONED THAT IT IS POST.
    //FIXME: SHIT NEEDS TO BE LOOKED AT AGAIN DUE TO SOME SHITTY BACKEND BUG
    var response;
    final Dio dio = Dio();
    if (isProfile) {
      print(
          ",${updated.firstname},${updated.lastName},${updated.gender},${updated.city},${updated.state}, ${updated.country}, ${updated.email},${updated.phone},${updated.dob}");
      var indexedInterests = Map.fromIterable(
        List.generate(updated.interests!.length, (index) => index),
        key: (index) => '${index.toString()}',
        value: (index) => updated.interests![index],
      );
      var x = jsonEncode(indexedInterests);
      print(
          ",${updated.firstname},${updated.lastName},${updated.gender},${updated.city},${updated.state}, ${updated.country}, ${updated.email},${updated.phone},${updated.dob}");

      try {
        response = await dio.post(
            AppConstants.base_URL + AppConstants.rooster_details_update,
            options: Options(headers: AppConstants.httpHeader),
            data: {
              "roster_id": updated.id.toString(),
              "first_name": updated.firstname ?? '',
              "last_name": updated.lastName ?? '',
              "gender": updated.gender ?? 'male',
              "city": updated.city,
              "state": updated.state,
              "country": updated.country,
              "email": updated.email,
              "weight": updated.weight,
              "height": updated.height,
              "interests": x,
              "phone": updated.phone ?? '1234567890',
              "date_of_birth": updated.dob,
              "profile_image":
                  base64Encode(updated.profileImage!.readAsBytesSync()),
            });
      } catch (e) {
        print(e);
      }

      // response = await http.post(
      //     Uri.parse(
      //         AppConstants.base_URL + AppConstants.rooster_details_update),
      //     headers: AppConstants.httpHeader,
      //     body: {
      //       "roster_id": updated.id.toString(),
      //       "first_name": updated.firstname ?? '',
      //       "last_name": updated.lastName ?? '',
      //       "gender": updated.gender ?? 'male',
      //       "city": updated.city,
      //       "state": updated.state,
      //       "country": updated.country,
      //       "email": updated.email,
      //       "weight": updated.weight,
      //       "height": updated.height,
      //       "interests": x,
      //       "phone": updated.phone ?? '1234567890',
      //       "date_of_birth": updated.dob,
      //       "profile_image":
      //           base64Encode(updated.profileImage!.readAsBytesSync()),
      //     });
    } else {
      var indexedImages = Map.fromIterable(
        List.generate(updated.galleryImage!.length, (index) => index),
        key: (index) => '${index.toString()}',
        value: (index) {
          var filePath = updated.galleryImage![index];
          var file = File(filePath);

          return base64Encode(file.readAsBytesSync());
        },
      );
      var y = jsonEncode(indexedImages);

      print("the Value of y is $y");
      print(
          "${updated.galleryImage!.length},${updated.firstname},${updated.lastName},${updated.gender},${updated.city},${updated.state}, ${updated.country}, ${updated.email},${updated.phone},${updated.dob}");

      try {
        response = await dio.post(
            AppConstants.base_URL + AppConstants.rooster_details_update,
            options: Options(headers: AppConstants.httpHeader),
            data: {
              "roster_id": updated.id.toString(),
              "first_name": updated.firstname ?? '',
              "last_name": updated.lastName ?? '',
              "gender": updated.gender ?? 'male',
              "city": updated.city,
              "state": updated.state,
              "country": updated.country ?? 'Pakistan',
              "email": updated.email,
              "phone": updated.phone ?? '1234567890',
              "date_of_birth": updated.dob,
              "images": jsonEncode(indexedImages),
            });
      } catch (e) {
        print(e);
      }

      // response = await http.post(
      //     Uri.parse(
      //         AppConstants.base_URL + AppConstants.rooster_details_update),
      //     headers: AppConstants.httpHeader,
      //     body: {
      //       "roster_id": updated.id.toString(),
      //       "first_name": updated.firstname,
      //       "last_name": updated.lastName,
      //       "gender": updated.gender ?? 'male',
      //       "city": updated.city,
      //       "state": updated.state,
      //       "country": updated.country,
      //       "email": updated.email,
      //       "phone": updated.phone ?? '1234567890',
      //       "date_of_birth": updated.dob,
      //       "images": y,
      //     });
    }

    // var data = jsonDecode(response.body);
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data['status'] == true) {
        print(response.data);
        print(response.data['message']);
        return true;
      } else {
        print(response.data['message']);
        return false;
      }
      // print(response.headers);
    } else {
      print(response.headers);
      print(response.statusCode);
      print(response.data);
      return false;
    }
  }
}
