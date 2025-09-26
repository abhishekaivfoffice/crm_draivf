
import 'package:crm_draivfmobileapp/presentation/pages/course/course_assigned_member_profile/course_assigned_member_profile.dart';
import 'package:flutter/material.dart';
//course lead profile tabs
class AccessTabs extends StatelessWidget {

  const AccessTabs({super.key, });
  final List<Map<String, String>> users = const [
    {"name": "ALEX GREY", "username": "@username"},
    {"name": "ALEX SMITH", "username": "@username"},
    {"name": "BEN GREEN", "username": "@username"},
    {"name": "DESMOND WHITE", "username": "@username"},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10,)
,              ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: users.length,
                      separatorBuilder:
                          (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return GestureDetector(
                          onTap: () {
                                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseAssignedMemberProfile(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(
                              8,
                            ), // container padding
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
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Placeholder_Person.jpg/500px-Placeholder_Person.jpg",
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
      
          
       
         

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
