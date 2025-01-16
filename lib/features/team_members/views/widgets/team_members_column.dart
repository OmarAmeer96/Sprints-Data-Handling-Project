import 'package:flutter/material.dart';
import 'package:sprints_data_handling_project/features/team_members/views/widgets/team_members_item.dart';

class TeamMemberList extends StatelessWidget {
  const TeamMemberList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TeamMembersItem(name: "Ahmed Elnahrawy"),
        SizedBox(
          height: 16,
        ),
        TeamMembersItem(name: "Hanan Ashraf"),
        SizedBox(
          height: 16,
        ),
        TeamMembersItem(name: "Rania Mostafa"),
        SizedBox(
          height: 16,
        ),
        TeamMembersItem(name: "Mazen Mounir"),
        SizedBox(
          height: 16,
        ),
        TeamMembersItem(name: "Mohamed Adel"),
        SizedBox(
          height: 16,
        ),
        TeamMembersItem(name: "Omar Ameer"),
      ],
    );
  }
}
