import 'package:crm_draivfmobileapp/core/constatnts/AppImages.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/assigned_member_profile/assigned_member_profile.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/edit_delete_view_buttons.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//////////////////////////////////////domestic lead profile detailed page///////////////

class DomesticLeadDataProfile extends StatelessWidget {
  final User user;
  const DomesticLeadDataProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 30;
    double borderWidth = 2;
    double overlap = 40; // space between avatars
    int count = user.assignedMembers.length;

    // total width = first avatar full + (overlap for remaining avatars)
    double totalWidth =
        (avatarRadius * 2 + borderWidth * 2) + (overlap * (count - 1));
    return Scaffold(
      appBar: AppBar(title: Text("Data detailed page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(44, 0, 0, 0)),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "${user.id}",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 16,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    Text(
                      "${user.name}",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 22,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        height: avatarRadius * 2 + borderWidth * 2,
                        width: totalWidth,
                        child: Stack(
                          children:
                              user.assignedMembers.asMap().entries.map((entry) {
                                int index = entry.key;
                                var m = entry.value;
                                return Positioned(
                                  left: index * overlap,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          230,
                                          133,
                                          194,
                                        ),
                                        width: borderWidth,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: avatarRadius,
                                      backgroundImage: NetworkImage(
                                        m.profileImage,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Access / Assigned",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 14,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // View Button
                        CustomMenuButton(
                          icon: Icons.visibility,
                          label: "View",
                          onTap: () {},
                          containerColor: Colors.green.shade100,
                          borderColor: Colors.green.shade300,
                          iconColor: Colors.green.shade800,
                          textColor: Colors.green.shade800,
                        ),
                        const SizedBox(width: 8),
                        CustomMenuButton(
                          icon: Icons.edit,
                          label: "Edit",
                          onTap: () {},
                          containerColor: Colors.blue.shade100,
                          borderColor: Colors.blue.shade300,
                          iconColor: Colors.blue.shade800,
                          textColor: Colors.blue.shade800,
                        ),
                        const SizedBox(width: 8),

                        // Delete Button
                        CustomMenuButton(
                          icon: Icons.delete,
                          label: "Delete",
                          onTap: () {},
                          containerColor: Colors.red.shade100,
                          borderColor: Colors.red.shade300,
                          iconColor: Colors.red.shade800,
                          textColor: Colors.red.shade800,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(44, 0, 0, 0)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${user.created}",
                            style: const TextStyle(color: Colors.grey),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  user.status == "Query"
                                      ? Colors.green.shade100
                                      : user.status == "Pending"
                                      ? Colors.orange.shade100
                                      : user.status == "Closed"
                                      ? Colors.red.shade100
                                      : Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              user.status,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InfoRow(
                        iconPath: AppImages.idicon,
                        label: "Id",
                        value: user.id.toString(),
                      ),
                      InfoRow(
                        iconPath: AppImages.nameicon,
                        label: "Wife Name",
                        value: user.name,
                      ),
                      InfoRow(
                        iconPath: AppImages.branchicon,
                        label: "Branch",
                        value: user.branch,
                      ),
                      InfoRow(
                        iconPath: AppImages.phoneicon,
                        label: "Wife Phone",
                        value: user.phone,
                      ),
                      InfoRow(
                        iconPath: AppImages.dupeicon,
                        label: "Dupe",
                        value: user.dupe.toString(),
                      ),
                      InfoRow(
                        iconPath: AppImages.sourceicon,
                        label: "Source",
                        value: user.source,
                      ),
                      InfoRow(
                        iconPath: AppImages.walkindateicon,
                        label: "Walkin Date",
                        value: user.walkInDate,
                      ),
                      InfoRow(
                        iconPath: AppImages.lastcontacticon,
                        label: "Last Contact",
                        value: user.lastContact,
                      ),
                      const SizedBox(height: 16),
                      CustomGradientButton(
                        text: ("Make Call"),
                        height: 43,
                        icon: Icons.call,
                        gradientColors: const [
                          Color(0xFF42A5F5), // Sky Blue
                          Color(0xFF1565C0), // Rich Blue
                        ],

                        onPressed: () {
                          // cancel action
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              // Expanded(
              //   child: ListView(
              //     children:
              //         user.entries.map((entry) {
              //           return Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 6),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   "${entry.key}: ",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 15,
              //                   ),
              //                 ),
              //                 Expanded(
              //                   child: Text(
              //                     "${entry.value}",
              //                     style: const TextStyle(fontSize: 15),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           );
              //         }).toList(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
