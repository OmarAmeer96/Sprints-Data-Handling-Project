import 'package:flutter/material.dart';
import 'package:sprints_data_handling_project/core/services/services.dart';

Future<void> deleteConfirmDialog(BuildContext context, int id) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      // Display the dialog
      return AlertDialog(
        title: Text('Delete'),
        content: Text('Are you sure you want to delete this profile?'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Confirm',
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () {
              UserServices().deleteUserData(id);
              const snackBar = SnackBar(
                content: Text('User has been deleted successfully'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(
              'Back',
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
