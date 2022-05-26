import 'package:core/constants/url_constants.dart';
import 'package:core/model/login_model.dart';
import 'package:core/model/module_model.dart';
import 'package:core/utils/network_handler.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Uri loginUri() {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: loginUrl,
    );
  }

  static Uri moduleUri(int roleId) {
    return Uri(
      scheme: scheme,
      host: baseUrl,
      path: modulsUrl,
      queryParameters: {
        'role': '$roleId',
      },
    );
  }

  static Map<String, String> headers(String token) {
    return {
      'Authorization': 'Bearer $token',
    };
  }

  static Map<String, dynamic> body(String email, String password) {
    return {
      "email": email,
      "password": password,
    };
  }
}

class LoginClient {
  Future<LoginModel> login(
      {required String email, required String password}) async {
    final response = await http.post(LoginApi.loginUri(),
        body: LoginApi.body("test@coba.com", "testing123"));
    return LoginModel.fromJson(NetworkHandler.apiResponse(response));
  }

  Future<ModuleResponse> getModules(
      {required String token, required int roleId}) async {
    final response = await http.get(
      LoginApi.moduleUri(roleId),
      headers: LoginApi.headers(token),
    );
    return ModuleResponse.fromJson(NetworkHandler.apiResponse(response));
  }
}
