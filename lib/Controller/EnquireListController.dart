import 'package:get/get.dart';
import 'package:um_media/Models/Rooster.dart';

class Enquire {
  final Rooster rooster;

  Enquire({required this.rooster});
}

class EnquireListController extends GetxController {
  List<Enquire> enquireList = [];

  Future<void> fetchAll() async {

    print("Enquire List Fetched ${enquireList.length}}");
  }
}
