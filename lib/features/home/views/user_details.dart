import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprints_data_handling_project/features/home/models/user_model.dart';
import 'package:sprints_data_handling_project/features/home/widgets/delete_confirm_dialog.dart';
import 'package:sprints_data_handling_project/features/home/widgets/user_detail_item.dart';

import '../../../data/constants/constants.dart';

class UserDetails extends StatefulWidget {
  final int index;
  const UserDetails({required this.index, super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<User> users = [];
  bool isLoading = false;
  getUsers() async {
    isLoading = true;
    setState(() {});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usersData = prefs.getString("usersData");
    var cachedData = jsonDecode(usersData!);
    for (var data in cachedData) {
      users.add(User.fromJson(data));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Constants.mainColor,
        title: Text(
          "User Details",
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/556669/pexels-photo-556669.jpeg?auto=compress&cs=tinysrgb&w=600'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                    child: Text(
                      users[widget.index].name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    users[widget.index].email,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Column(
                    children: [
                      UserDetailItem(
                          title: "Id", data: users[widget.index].id.toString()),
                      UserDetailItem(
                          title: "Address",
                          data: users[widget.index].address.street),
                      UserDetailItem(
                          title: "Phone", data: users[widget.index].phone),
                      UserDetailItem(
                          title: "Website", data: users[widget.index].website),
                      UserDetailItem(
                          title: "Company",
                          data: users[widget.index].company.name),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        onPressed: () {
          deleteConfirmDialog(context, users[widget.index].id);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
