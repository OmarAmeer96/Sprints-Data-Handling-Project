import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:sprints_data_handling_project/data/constants/constants.dart';

class TeamMembersItem extends StatefulWidget {
  const TeamMembersItem({
    super.key,
    required this.name,
  });

  final String name;

  @override
  // ignore: library_private_types_in_public_api
  _TeamMembersItemState createState() => _TeamMembersItemState();
}

class _TeamMembersItemState extends State<TeamMembersItem> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        _confettiController.play();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Constants.mainColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              colors: const [
                Colors.deepOrange,
                Colors.teal,
              ],
              blastDirection: pi / 2,
              gravity: 0,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 20,
              confettiController: _confettiController,
            ),
          ),
        ],
      ),
    );
  }
}
