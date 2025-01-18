import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sprints_data_handling_project/core/services/services.dart';
import 'package:sprints_data_handling_project/data/constants/constants.dart';
import 'package:sprints_data_handling_project/features/home/models/user_model.dart';
import 'package:sprints_data_handling_project/features/home/views/user_details.dart';
import 'package:sprints_data_handling_project/features/team_members/views/team_members_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  bool isLoading = false;

  Future<void> getUsers() async {
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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getUsers,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Constants.mainColor,
          title: const Text("All Users"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const TeamMembersView();
                },
              ));
            },
            icon: const Icon(Icons.card_membership),
          ),
        ),
        body: isLoading
            ? _userLoadingItem()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return UserDetails(
                              index: index,
                            );
                          },
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 10,
                        ),
                        child: ListTile(
                          title: Text(users[index].username),
                          leading: Hero(
                            tag: users[index].id,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: Constants.userProfilePicture,
                                placeholder: (context, url) => Center(
                                  child: const CircularProgressIndicator(),
                                ),
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.width * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Constants.emailController.text =
                                  users[index].email;
                              Constants.nameController.text = users[index].name;
                              Constants.phoneController.text =
                                  users[index].phone;
                              Constants.addressController.text =
                                  users[index].address.street;
                              Constants.companyController.text =
                                  users[index].company.name;
                              Constants.websiteController.text =
                                  users[index].website;
                              Constants.userNameController.text =
                                  users[index].username;

                              showBottomSheet("Edit User");
                            },
                            icon: const Icon(Icons.edit),
                            color: Constants.mainColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Constants.userNameController.text = "";
            Constants.nameController.text = "";
            Constants.phoneController.text = "";
            Constants.addressController.text = "";
            Constants.companyController.text = "";
            Constants.websiteController.text = "";
            Constants.emailController.text = "";

            showBottomSheet("Add User");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _userLoadingItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 10,
              ),
              child: ListTile(
                title: Container(
                  width: double.infinity,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                ),
                trailing: Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showBottomSheet(String buttonText) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
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
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Constants.mainColor,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: Constants.emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    prefixIconColor: Constants.mainColor,
                    hintText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Constants.nameController,
                  decoration: InputDecoration(
                    prefixIconColor: Constants.mainColor,
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Constants.phoneController,
                  decoration: InputDecoration(
                    prefixIconColor: Constants.mainColor,
                    prefixIcon: const Icon(Icons.phone),
                    hintText: "phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Constants.addressController,
                  decoration: InputDecoration(
                    prefixIconColor: Constants.mainColor,
                    prefixIcon: const Icon(Icons.streetview_outlined),
                    hintText: "address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Constants.companyController,
                  decoration: InputDecoration(
                    prefixIconColor: Constants.mainColor,
                    prefixIcon: const Icon(Icons.apartment),
                    hintText: "company",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Constants.websiteController,
                  decoration: InputDecoration(
                    prefixIconColor: Constants.mainColor,
                    prefixIcon: const Icon(Icons.web),
                    hintText: "website",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  height: MediaQuery.of(context).size.height * 0.06,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: double.infinity,
                  color: Constants.mainColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (buttonText == "Add User") {
                      addUser(context);
                    } else {
                      updateUser(context);
                    }
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void addUser(BuildContext context) {
    UserServices().postUserData(User(
      id: 1,
      name: Constants.nameController.text,
      username: Constants.userNameController.text,
      email: Constants.emailController.text,
      address: Address(
        street: Constants.addressController.text,
        suite: '',
        city: 'city',
        zipcode: "zipcode",
        geo: Geo(lat: 'lat', lng: 'lng'),
      ),
      phone: Constants.phoneController.text,
      website: Constants.websiteController.text,
      company: Company(
        name: Constants.companyController.text,
        catchPhrase: 'catchPhrase',
        bs: 'bs',
      ),
    ));
    Navigator.pop(context);
    SnackBar snackBar = SnackBar(
      content: Text('${Constants.nameController.text} added successfully'),
      action: SnackBarAction(
        onPressed: () {},
        label: 'OK',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void updateUser(BuildContext context) {
    UserServices().updateUser(
      User(
        id: 1,
        name: Constants.nameController.text,
        username: Constants.userNameController.text,
        email: Constants.emailController.text,
        address: Address(
          street: Constants.addressController.text,
          suite: '',
          city: 'city',
          zipcode: "zipcode",
          geo: Geo(lat: 'lat', lng: 'lng'),
        ),
        phone: Constants.phoneController.text,
        website: Constants.websiteController.text,
        company: Company(
          name: Constants.companyController.text,
          catchPhrase: 'catchPhrase',
          bs: 'bs',
        ),
      ),
    );
    Navigator.pop(context);
    SnackBar snackBar = SnackBar(
      content: Text('${Constants.nameController.text} updated successfully'),
      action: SnackBarAction(
        onPressed: () {},
        label: 'OK',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
