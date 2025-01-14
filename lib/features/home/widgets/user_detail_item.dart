import 'package:flutter/material.dart';

import '../../../data/constants/constants.dart';

class UserDetailItem extends StatelessWidget {
  final String title;
  final String data;
  const UserDetailItem({required this.title, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF767676).withValues(alpha: 0.2),
                blurRadius: 7,
                offset: const Offset(0, 6),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Constants.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              data,
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w500,
                // color: const Color.fromARGB(255, 93, 91, 91)
              ),
            )
          ],
        ),
      ),
    );
  }
}
