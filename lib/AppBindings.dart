import 'package:get/get.dart';

import 'Controller/EnquireListController.dart';
import 'Controller/LoginController.dart';
import 'Controller/RoosterController.dart';
import 'Controller/StudioController.dart';
import 'Controller/TalentController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => RoosterController());
    Get.put(() => TalentController());
    Get.put(() => StudioController());
    Get.put(() => EnquireListController());
    Get.put(() => LoginController());
  }
}
