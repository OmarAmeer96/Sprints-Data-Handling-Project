import 'package:flutter/material.dart';
import 'package:sprints_data_handling_project/data/constants/constants.dart';
import 'package:sprints_data_handling_project/features/team_members/views/widgets/team_members_column.dart';

class TeamMembersView extends StatelessWidget {
  const TeamMembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Constants.mainColor,
        title: const Text("Team Members"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const TeamMemberList(),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Made With 🧡',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
