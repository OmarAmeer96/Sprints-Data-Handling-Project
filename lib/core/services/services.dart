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

  postUserData(User user) async {
    final dio = Dio();
    try {
      var response = await dio.post("https://jsonplaceholder.typicode.com/users",
          data: User(id: user.id,
          name: user.name,
          phone: user.phone,
          address: user.address,
          company: user.company,
          email: user.email,
          username: user.username,
          website: user.website).toJson());
      print("user created successfully");
    } catch (e) {
      print('Error occurred while posting user: $e');
    }
  }

}
