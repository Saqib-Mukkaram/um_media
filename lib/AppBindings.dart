import 'package:get/get.dart';

import 'Controller/EnquireListController.dart';
import 'Controller/LoginController.dart';
import 'Controller/RoosterController.dart';
import 'Controller/StudioController.dart';
import 'Controller/TalentController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoosterController());
    Get.lazyPut(() => TalentController());
    Get.lazyPut(() => StudioController());
    Get.lazyPut(() => EnquireListController());
    Get.lazyPut(() => LoginController());
  }
}
