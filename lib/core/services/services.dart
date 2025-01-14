import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprints_data_handling_project/features/home/models/user_model.dart';
import 'package:dio/dio.dart';

class UserServices {
  final endPoint = ("https://jsonplaceholder.typicode.com/users");
  List<User> users = [];
  Future<List<User>> getUsersData() async {
    final dio = Dio();
    try {
      var response = await dio.get(endPoint);
      var data = response.data;
      for (var json in data) {
        User user = User.fromJson(json);
        users.add(user);
      }
      var usersData = jsonEncode(data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("usersData", usersData);
    } catch (e) {
      print(e);
    }
    return users;
  }
}
