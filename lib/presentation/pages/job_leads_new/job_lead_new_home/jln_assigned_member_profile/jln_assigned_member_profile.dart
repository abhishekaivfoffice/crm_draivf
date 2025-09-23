import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_containers/custom_time_container.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class JLNAssignedMemberDetails extends StatelessWidget {
  // final AssignedMember member;

  const JLNAssignedMemberDetails({
    super.key,
    //  required this.member
  });
  final List<Map<String, String>> users = const [
    {"name": "ALEX GREY", "username": "@username"},
    {"name": "ALEX SMITH", "username": "@username"},
    {"name": "BEN GREEN", "username": "@username"},
    {"name": "DESMOND WHITE", "username": "@username"},
  ];

  @override
  Widget build(BuildContext context) {
    final assignedmemberprofileprovider =
        Provider.of<JLNAssignedMemberProfileProvider>(context);
    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "Job lead new Assigned Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 212, 78, 177),
                        Color.fromARGB(255, 252, 115, 165),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -60, // push outside the container
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Placeholder_Person.jpg/500px-Placeholder_Person.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // Name
            Text(
              "Laxmi Sharma",
              // member.name,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: AppFonts.poppins,
                color: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              "DRAIVF23245",
              // member.name,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.poppins,
                color: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            ////////////////////////////
            const SizedBox(height: 10),
            const Divider(thickness: 1),

            // Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  //
                  InfoRow(
                    iconPath: AppImages.idicon,
                    label: "Job Id",
                    value: 'DRAIVF56563',
                  ),
                  InfoRow(
                    iconPath: AppImages.nameicon,
                    label: "Name",
                    value: 'Laxmi Sharma',
                  ),
                  InfoRow(
                    iconPath: AppImages.phoneicon,
                    label: "Job Title",
                    value: "Staff Nurse",
                  ),
                  InfoRow(
                    iconPath: AppImages.branchicon,
                    label: "Location",
                    value: "Chennai",
                  ),
                  InfoRow(
                    iconPath: AppImages.phoneicon,
                    label: "Phone",
                    value: "+91 8787 54653",
                  ),
                  InfoRow(
                    iconPath: AppImages.dupeicon,
                    label: "Total No. of Experience",
                    value: "03",
                  ),
                  InfoRow(
                    iconPath: AppImages.walkindateicon,
                    label: "Applied on",
                    value: "25-07-2025",
                  ),
                  InfoRow(
                    iconPath: AppImages.walkindateicon,
                    label: "Interview Date",
                    value: "25-07-2025",
                  ),
                  InfoRow(
                    iconPath: AppImages.walkindateicon,
                    label: "Joining Date",
                    value: "25-07-2025",
                  ),
                  GestureDetector(
                    onTap: () {
                      assignedmemberprofileprovider.toggleFilters();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 35,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                " Assigned / Access ",
                                style: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  color: Color.fromARGB(171, 0, 0, 0),
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// SHOW FILTERS ONLY IF ENABLED
                  if (assignedmemberprofileprovider.showFilters) ...[
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: users.length,
                      separatorBuilder:
                          (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Container(
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
                                    user["name"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),

                              // ListTile(
                              //   contentPadding:
                              //       EdgeInsets.zero, // remove default tile padding
                              //   leading:
                              //   title: Text(
                              //     user["name"]!,
                              //     style: const TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black87,
                              //     ),
                              //   ),
                              //   subtitle: Text(
                              //     user["username"]!,
                              //     style: const TextStyle(color: Colors.grey),
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
