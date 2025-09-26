import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/course/access_assigned_tabs/assigned_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/course/access_assigned_tabs/access_tabs.dart';
import 'package:crm_draivfmobileapp/provider/course_provider/course_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_segment_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//profile sectiob  of course leads
class CourseDataProfile extends StatelessWidget {
     
  const CourseDataProfile({
    super.key,
  });
  final List<Map<String, String>> users = const [
    {"name": "ALEX GREY", "username": "@username"},
    {"name": "ALEX SMITH", "username": "@username"},
    {"name": "BEN GREEN", "username": "@username"},
    {"name": "DESMOND WHITE", "username": "@username"},
  ];

  @override
  Widget build(BuildContext context) {
    final courseleaddataprovider = Provider.of<CourseDataProvider>(context);
    final List<Widget> pages = [AccessTabs(), AssignedTabs()];
    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "course  data Profile"),
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
                  child: Container(
                    width: 120, // 2 * radius
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        0,
                      ), // square (use 12 for rounded corners)
                      border: Border.all(color: Colors.grey.shade300, width: 4),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Placeholder_Person.jpg/500px-Placeholder_Person.jpg",
                        ),
                        fit: BoxFit.cover, // makes image cover the whole square
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
                    iconPath: AppImages.idicon,
                    label: "Emp Id",
                    value: 'DRAIVF56563',
                  ),

                  InfoRow(
                    iconPath: AppImages.phoneicon,
                    label: "Phone",
                    value: "+91 9074 1234",
                  ),
                  InfoRow(
                    iconPath: AppImages.branchicon,
                    label: "Location",
                    value: "Chennai - Vadapalani",
                  ),
                  InfoRow(
                    iconPath: AppImages.phoneicon,
                    label: "Qualification",
                    value: "bsc Nursing",
                  ),
                  InfoRow(
                    iconPath: AppImages.dupeicon,
                    label: "Course ",
                    value:
                        "Affiliate Portals,Affiliate Portals,Affiliate Portals",
                  ),
                  InfoRow(
                    iconPath: AppImages.dupeicon,
                    label: "Source ",
                    value: "Affiliate Portals",
                  ),

                  InfoRow(
                    iconPath: AppImages.walkindateicon,
                    label: "Created Date",
                    value: "25-07-2025",
                  ),
                  const SizedBox(height: 10),

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomSegmentButton(
                              text: "Access",
                              isSelected:
                                  courseleaddataprovider.selectedIndex == 0,
                              onTap: () => courseleaddataprovider.setIndex(0),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomSegmentButton(
                              text: "Assigned",
                              isSelected:
                                  courseleaddataprovider.selectedIndex == 1,
                              onTap: () => courseleaddataprovider.setIndex(1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Display corresponding class
                      Center(
                        child: pages[courseleaddataprovider.selectedIndex],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
