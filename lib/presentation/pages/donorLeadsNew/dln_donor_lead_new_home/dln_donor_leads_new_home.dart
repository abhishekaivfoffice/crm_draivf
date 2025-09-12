import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/donor_leads_new_data/dln_donor_leads_new_data.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DLNDonorLeadsNewHome extends StatelessWidget {
  const DLNDonorLeadsNewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Donor Leads New"),
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
                          text: "Add Donor Details",
                          icon: Icons.add,

                          onPressed: () {
                            Get.toNamed(AppRoutes.adddonorLeadNewScreen);
                          },
                        ),
                      ),
                 
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            DLNDonorLeadsNewData(),
          ],
        ),
      ),
    );
  }
}
