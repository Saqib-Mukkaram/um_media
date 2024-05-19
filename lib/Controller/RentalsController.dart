import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:um_media/AppConstants.dart';
import 'package:um_media/Models/Rentals.dart';
import 'package:http/http.dart' as http;

class RentalController extends GetxController {
  var rentals = [];
  var isLoading = true.obs;

  //get rentals List
  List get getRentalsList => rentals;

  @override
  void onInit() async {
    super.onInit();
    await fetchAll();
  }

  Future fetchAll() async {
    await getRentals();
    kDebugMode ? print("Rentals Fetched") : null;
  }

  Future<void> getRentals() async {
    try {
      var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.rental_category_by_type),
        headers: AppConstants.httpHeader,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        data.map((e) => Rentals.fromJson(e)).toList();
        rentals = data.map((e) => Rentals.fromJson(e)).toList();
        kDebugMode ?  print("Rentals Fetched ${rentals.length}") : null;
        isLoading(false);
      } else {
        print("Error in fetching Rentals");
      }
    } catch (e) {
      print(e);
    }
  }
}
