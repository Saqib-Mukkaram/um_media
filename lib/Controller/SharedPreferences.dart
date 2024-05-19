import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  late SharedPreferences _prefs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSharedPreferences();
  }

  initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //get the prefs
  SharedPreferences get getPrefs => _prefs;

  //set a bool value to prefs
  Future<void> setBoolValue(String key, bool value) async {
    await _prefs.setBool(key, value);
    update();
  }

  //set a string value to prefs
  Future<void> setStringValue(String key, String value) async {
    await _prefs.setString(key, value);
    update();
  }

  //get a string value from prefs
  String getStringValue(String key) {
    return _prefs.getString(key) ?? '';
  }

  //get a bool value from prefs
  bool getBoolValue(String key) {
    return _prefs.getBool(key) ?? false;
  }
}
