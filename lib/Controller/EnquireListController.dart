import 'package:get/get.dart';
import 'package:um_media/Models/Rooster.dart';
import 'package:um_media/Models/Studio.dart';

class EnquireRooster {
  final Rooster rooster;

  EnquireRooster({required this.rooster});
}
class EnquireStudio {
  final Studio studio;

  EnquireStudio({required this.studio});
}
class EnquireListController extends GetxController {
   var roosterEnquireList = <EnquireRooster>[].obs;
   var studioList = <EnquireStudio>[].obs;
   
   //add these two in a single list



  
  Future<void> fetchAll() async {

    print("EnquireRooster List Fetched ${roosterEnquireList.length}}");
    print("Enquire List Fetched ${studioList.length}}");
  }
}
