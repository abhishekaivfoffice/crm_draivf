
import 'package:flutter/material.dart';


//course lead activity log tabs
class AssignedTabs extends StatelessWidget {
  const AssignedTabs({super.key});
  final List<Map<String, String>> users = const [
    {"name": "ALEX Assigned", "username": "@username"},
    {"name": "Bijo Assigned", "username": "@username"},
    {"name": "Gouri Assigned", "username": "@username"},
    {"name": "DESMOND Assigned", "username": "@username"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: users.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final user = users[index];
            return GestureDetector(
              onTap: () {
                //            Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => JLNAssignedMemberDetails(member: user,),
                //   ),
                // );
              },
              child: Container(
                padding: const EdgeInsets.all(8), // container padding
                color: Colors.white, // background color
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60, // same as 2 * radius (40 * 2)
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // square with rounded corners
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),

                    Column(
                      children: [
                        Text(
                          user["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          user["username"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
