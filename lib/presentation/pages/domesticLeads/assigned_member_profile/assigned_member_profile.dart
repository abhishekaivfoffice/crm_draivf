import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:flutter/material.dart';

class AssignedMemberDetails extends StatelessWidget {
  final AssignedMember member;

  const AssignedMemberDetails({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(member.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(member.profileImage),
            ),
            const SizedBox(height: 16),
            Text(member.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Email: ${member.email}"),
            Text("Last Active: ${member.lastActiveDate}"),
          ],
        ),
      ),
    );
  }
}
