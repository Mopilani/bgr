import 'package:flutter_application_2/models/users_list_model.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'api_status.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(users_list);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(200, usersListModelFromJson(response.body));
      }
      return Failure(100, 'Invalid Response');
    } catch (e) {
      //
      return Failure(100, 'Invalid Response');
    }
  }
}
