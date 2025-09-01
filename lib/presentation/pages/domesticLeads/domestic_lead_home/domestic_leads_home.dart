import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/domestic_leads_data.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DomesticLeadsHome extends StatelessWidget {
  const DomesticLeadsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Domestic Leads"),
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
                            Get.toNamed(AppRoutes.addLeadScreen);
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
                            Get.toNamed(AppRoutes.importLeadScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            DomesticLeadsData(),
          ],
        ),
      ),
    );
  }
}
