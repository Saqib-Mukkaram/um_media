import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:um_media/AppConstants.dart';

class LoginController extends GetxController {
  Future LoginRequest(
      {required Map<String, String> header,
      required Map<String, String> body}) async {
    var respone = await http.post(
        Uri.parse(AppConstants.base_URL + AppConstants.login),
        headers: header,
        body: body);
    return respone.statusCode;
  }
}
