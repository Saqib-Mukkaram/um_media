import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';

class LoginController extends GetxController {
  var isLoggedin = false.obs;

  Future LoginRequest(
      {required Map<String, String> header,
      required Map<String, String> body}) async {
    var response = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.login),
        headers: header,
        body: body);
    // return respone.statusCode;
    if (response.statusCode == 200) {
      isLoggedin = true.obs;
      return response.body;
    } else {
      return "Invalid Credientials";
    }
  }
}
