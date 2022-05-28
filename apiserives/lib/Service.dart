import 'dart:developer';

import 'package:http/http.dart' as http;

import 'Users.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User>?> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<User> users = UserFromJson(response.body);
        return users;
      } else {
         return throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
