import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static apiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        print('200: OK');
        return json.decode(response.body.toString());
      case 201:
        print('201: Created');
        return json.decode(response.body.toString());
      case 400:
        print('400: Bad Request');
        return json.decode(response.body.toString());
      case 401:
        print('401: Unauthorized');
        return {'status': 0, 'message': 'Your session has expired, please login again'};
      case 403:
        print('403: Forbidden');
        return json.decode(response.body.toString());
      case 404:
        print('404: Not Found');
        return json.decode(response.body.toString());
      case 500:
        print('500: Internal Server Error');
        return json.decode(response.body.toString());
      case 502:
        print('502: Bad Gateway (CORS)');
        return json.decode(response.body.toString());
    }
  }
}
