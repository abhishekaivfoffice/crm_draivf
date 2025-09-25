import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/course/course_lead_home/course_leads_data/course_data.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_data.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseLeadsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "course Leads"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomGradientButton(
                          height: 40,
                          text: "New Lead",
                          icon: Icons.add,

                          onPressed: () {
                            Get.toNamed(AppRoutes.addCourseLeadScreen);
                          },
                        ),
                      ),
                      // const SizedBox(width: 12), // space between buttons
                      // Expanded(
                      //   child: CustomGradientButton(
                      //     height: 40,
                      //     text: "Import Leads",
                      //     icon: Icons.import_export_rounded,

                      //     onPressed: () {
                      //       Get.toNamed(AppRoutes.importCourseLeadScreen);
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 12),

                ],
              ),
            ),
           CourseData(),
          ],
        ),
      ),
    );
  }
}
