import 'package:get/get.dart';
import 'package:um_media/API/APIClient.dart';
import 'package:um_media/Controller/RegisterController.dart';
import 'package:um_media/Controller/RentalsController.dart';
import 'package:um_media/Controller/SharedPreferences.dart';

import 'Controller/EnquireListController.dart';
import 'Controller/LoginController.dart';
import 'Controller/RoosterController.dart';
import 'Controller/StudioController.dart';
import 'Controller/TalentController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RentalController());
    Get.put(RoosterController());
    Get.put(TalentController());
    Get.put(StudioController());
    Get.put(EnquireListController());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(SharedPreferencesController());
  }
}
