import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_data.dart';
import 'package:crm_draivfmobileapp/presentation/pages/setup/setup_staff/setup_staff_home/stp_staff_data.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class STPStaffHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "SETUP Staff home"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomGradientButton(
                    height: 40,
                    text: "New Staff member",
                    icon: Icons.add,
                                    
                    onPressed: () {
                      Get.toNamed(AppRoutes.setupStaffAddNewStaff);
                    },
                  ),
                  const SizedBox(height: 12),

                ],
              ),
            ),
           STPStaffData(),
          ],
        ),
      ),
    );
  }
}
