// import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
// import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
// import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
// import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
// import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
// import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_assigned_member_profile_provider.dart';
// import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class JLNAssignedMemberDetails extends StatelessWidget {
//   // final AssignedMember member;

//   const JLNAssignedMemberDetails({
//     super.key,
//     //  required this.member
//   });
//   final List<Map<String, String>> users = const [
//     {"name": "ALEX GREY", "username": "@username"},
//     {"name": "ALEX SMITH", "username": "@username"},
//     {"name": "BEN GREEN", "username": "@username"},
//     {"name": "DESMOND WHITE", "username": "@username"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final assignedmemberprofileprovider =
//         Provider.of<JLNAssignedMemberProfileProvider>(context);
//     return Scaffold(
//       drawer: TabletMobileDrawer(),
//       appBar: CustomAppBar(title: "Job lead new Assigned Profile"),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   height: 140,
//                   decoration: const BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color.fromARGB(255, 212, 78, 177),
//                         Color.fromARGB(255, 252, 115, 165),
//                       ],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -60, // push outside the container
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 56,
//                       backgroundImage: NetworkImage(
//                         "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Placeholder_Person.jpg/500px-Placeholder_Person.jpg",
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 70),

//             // Name
//             Text(
//               "Laxmi Sharma",
//               // member.name,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontFamily: AppFonts.poppins,
//                 color: AppColor.blackColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4),

//             Text(
//               "DRAIVF23245",
//               // member.name,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontFamily: AppFonts.poppins,
//                 color: AppColor.blackColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),

//             ////////////////////////////
//             const SizedBox(height: 10),
//             const Divider(thickness: 1),

//             // Options
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   //
//                   InfoRow(
//                     iconPath: AppImages.idicon,
//                     label: "Job Id",
//                     value: 'DRAIVF56563',
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.nameicon,
//                     label: "Name",
//                     value: 'Laxmi Sharma',
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.phoneicon,
//                     label: "Job Title",
//                     value: "Staff Nurse",
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.branchicon,
//                     label: "Location",
//                     value: "Chennai",
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.phoneicon,
//                     label: "Phone",
//                     value: "+91 8787 54653",
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.dupeicon,
//                     label: "Total No. of Experience",
//                     value: "03",
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.walkindateicon,
//                     label: "Applied on",
//                     value: "25-07-2025",
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.walkindateicon,
//                     label: "Interview Date",
//                     value: "25-07-2025",
//                   ),
//                   InfoRow(
//                     iconPath: AppImages.walkindateicon,
//                     label: "Joining Date",
//                     value: "25-07-2025",
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       assignedmemberprofileprovider.toggleFilters();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: SizedBox(
//                         height: 35,
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                                Text(
//                                 " Assigned / Access ",
//                                 style: TextStyle(
//                                   fontFamily: AppFonts.poppins,
//                                   color: AppColor.blueaccent,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Icon(Icons.arrow_drop_down,size: 30, color: AppColor.blueaccent,),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   /// SHOW FILTERS ONLY IF ENABLED
//                   if (assignedmemberprofileprovider.showFilters) ...[
//                     ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: users.length,
//                       separatorBuilder:
//                           (context, index) => const Divider(height: 1),
//                       itemBuilder: (context, index) {
//                         final user = users[index];
//                         return Container(
//                           padding: const EdgeInsets.all(8), // container padding
//                           color: Colors.white, // background color
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: 60, // same as 2 * radius (40 * 2)
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(
//                                     12,
//                                   ), // square with rounded corners
//                                 ),
//                                 clipBehavior: Clip.hardEdge,
//                                 child: Image.network(
//                                   "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Placeholder_Person.jpg/500px-Placeholder_Person.jpg",
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),

//                               Column(
//                                 children: [
//                                   Text(
//                                     user["name"]!,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   Text(
//                                     user["username"]!,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               // ListTile(
//                               //   contentPadding:
//                               //       EdgeInsets.zero, // remove default tile padding
//                               //   leading:
//                               //   title: Text(
//                               //     user["name"]!,
//                               //     style: const TextStyle(
//                               //       fontWeight: FontWeight.bold,
//                               //       color: Colors.black87,
//                               //     ),
//                               //   ),
//                               //   subtitle: Text(
//                               //     user["username"]!,
//                               //     style: const TextStyle(color: Colors.grey),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_containers/custom_time_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class JLNAssignedMemberDetails extends StatelessWidget {
  final AssignedMember member;

  const JLNAssignedMemberDetails({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final assignedmemberprofileprovider =
        Provider.of<AssignedMemberProfileProvider>(context);
    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "Assigned Profile"),
      body: Column(
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
                    backgroundImage: NetworkImage(member.profileImage),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 70),

          // Name
          Text(
            member.name,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.poppins,
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Phone & Mail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.poppins,
                        color: AppColor.mediumGrey,
                      ),
                    ),
                    Text(
                      member.email,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.poppins,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Last active",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.poppins,
                        color: AppColor.mediumGrey,
                      ),
                    ),
                    Text(
                      member.lastActiveDate,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.poppins,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomBox(
                        heading: "Total Logged Time",
                        subHeading: "00:00",
                        headingColor: AppColor.green,
                        subHeadingColor: AppColor.blue,
                      ),
                      const SizedBox(width: 12),
                      CustomBox(
                        heading: "Last Month Logged Time",
                        subHeading: "00:00",
                        headingColor: Colors.blue,
                        subHeadingColor: AppColor.blue,
                      ),
                      const SizedBox(width: 12),

                      CustomBox(
                        heading: "This Month Logged Time",
                        subHeading: "00:00",
                        headingColor: AppColor.green,
                        subHeadingColor: AppColor.blue,
                      ),
                      const SizedBox(width: 12),
                      CustomBox(
                        heading: "Last Week Logged Time",
                        subHeading: "00:00",
                        headingColor: Colors.blue,
                        subHeadingColor: AppColor.blue,
                      ),
                      const SizedBox(width: 12),

                      CustomBox(
                        heading: "This Week Logged Time",
                        subHeading: "00:00",
                        headingColor: AppColor.green,
                        subHeadingColor: AppColor.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Divider(thickness: 1),

          // Options
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Edit Profile"),
                  trailing: CustomGradientButton(
                    height: 35,
                    width: 80,
                    text: " Edit  ",
                    icon: Icons.edit,

                    onPressed: () {
                      Get.toNamed(AppRoutes.assignedMemberProfileedithome);
                    },
                  ),
                  onTap: () {},
                ),
                const Divider(),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SizedBox(
                              height: 35,
                              child: DropdownButton<int>(
                                value: assignedmemberprofileprovider.pageSize,
                                underline: const SizedBox(),
                                items:
                                    [5, 10, 15, 20].map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          "   $e",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColor.blackColor,
                                            fontFamily: AppFonts.poppins,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                onChanged: (val) {
                                  if (val != null) {
                                    assignedmemberprofileprovider.setPageSize(
                                      val,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SizedBox(
                              height: 35,
                              child: DropdownButton<String>(
                                value:
                                    assignedmemberprofileprovider
                                        .selectedAction,
                                underline: const SizedBox(),
                                hint: const Text(
                                  " Export",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.blackColor,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                                items:
                                    assignedmemberprofileprovider.actionItems
                                        .map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              "    $e",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.blackColor,
                                                fontFamily: AppFonts.poppins,
                                              ),
                                            ),
                                          );
                                        })
                                        .toList(),
                                onChanged: (val) {
                                  assignedmemberprofileprovider
                                      .setSelectedAction(val);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // allow horizontal scroll if small screen
                      child: DataTable(
                        columnSpacing: 30,
                        headingRowColor: MaterialStateProperty.all(
                          Colors.grey.shade200,
                        ),
                        border: TableBorder.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        columns: const [
                          DataColumn(label: Text("Project Name")),
                          DataColumn(label: Text("Start Date")),
                          DataColumn(label: Text("Deadline")),
                          DataColumn(label: Text("Status")),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text("Sample project 1")),
                              DataCell(Text("2025-01-15")),
                              DataCell(Text("2025-03-30")),
                              DataCell(Text("In Progress")),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Sample project 2")),
                              DataCell(Text("2025-02-01")),
                              DataCell(Text("2025-05-20")),
                              DataCell(Text("Pending")),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Sample project 3")),
                              DataCell(Text("2025-02-10")),
                              DataCell(Text("2025-04-05")),
                              DataCell(Text("Completed")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
