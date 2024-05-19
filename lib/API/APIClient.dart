import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:um_media/AppConstants.dart';

class ApiClient extends GetxController {
  //onInint
  @override
  void onInit() {
    super.onInit();
  }

  //Private Constructor
  static final ApiClient _instance = ApiClient._internal();

  //factory constructor  for creating a singletons
  factory ApiClient() => _instance;

  //init the private constructor
  ApiClient._internal();

  //the Dio Instance.
  static Dio? _dio;

  //checking for the null
  static Dio? get dio {
    _dio ??= Dio();
    _dio!.options.baseUrl = AppConstants.base_URL;
    _dio!.options.headers = AppConstants.httpHeader;
    _dio!.options.contentType = Headers.jsonContentType;
    _dio!.options.receiveDataWhenStatusError = true;
    _dio!.options.validateStatus = (status) {
      return status! < 500;
    };
    return _dio;
  }

  static Future<Response> get(
    String path,
  ) async {
    return await dio!.get(
      path,
    );
  }

  static Future<Response> post({
    required path,
    required dynamic data,
  }) async {
    return await dio!.post(
      path,
      data: data,
    );
  }
}
