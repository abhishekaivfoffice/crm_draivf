import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/job_leads_data.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobLeadsNewHome extends StatelessWidget {
  const JobLeadsNewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "JOB Leads New"),
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
                            Get.toNamed(AppRoutes.jladdLeadScreen);
                          },
                        ),
                      ),
                      const SizedBox(width: 12), // space between buttons
                      Expanded(
                        child: CustomGradientButton(
                          height: 40,
                          text: "Import Leads",
                          icon: Icons.import_export_rounded,

                          onPressed: () {
                            Get.toNamed(AppRoutes.jlimportLeadScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            JobLeadsData (),
          ],
        ),
      ),
    );
  }
}
