import 'package:flutter/material.dart';
import 'package:sprints_data_handling_project/core/services/services.dart';
import 'package:sprints_data_handling_project/data/constants/constants.dart';
import 'package:sprints_data_handling_project/features/home/models/user_model.dart';
import 'package:sprints_data_handling_project/features/home/views/user_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  bool isLoading = false;
  getUsers() async {
    isLoading = true;
    setState(() {});
    users = await UserServices().getUsersData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Constants.mainColor,
        title: Text(
          "All Users",
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return UserDetails(
                            index: index,
                          );
                        },
                      ));
                    },
                    child: ListTile(
                        title: Text(users[index].username),
                        leading: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.05,
                          child: Text(
                            users[index].id.toString(),
                            style: TextStyle(
                                color: Constants.mainColor, fontSize: 16),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            emailController.text = users[index].email;
                            nameController.text = users[index].username;
                            showBottomSheet(
                              "Edit User",
                            );
                          },
                          icon: Icon(Icons.edit),
                          color: Constants.mainColor,
                        )),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nameController.text = "";
          emailController.text = "";
          showBottomSheet("Add User");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showBottomSheet(String buttonText) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Constants.mainColor),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Constants.mainColor,
                        hintText: "Email Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIconColor: Constants.mainColor,
                        prefixIcon: Icon(Icons.person),
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    height: MediaQuery.of(context).size.height * 0.06,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: double.infinity,
                    color: Constants.mainColor,
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text(
                      buttonText,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
