import 'dart:io';

import 'package:dota/models/heros.dart';
import 'package:dota/repo/api_status.dart';
import 'package:dota/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<Object> getHeros() async {
    try {
      var url = Uri.parse(HEROS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(response: herosFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
