import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/assigned_member_profile/assigned_member_profile_edit/assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignedMemberPermissionPage extends StatelessWidget {
  const AssignedMemberPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final assignedmemberprofileeditprovider =
        Provider.of<AssignedMemberProfileEditProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: "Assigned Member Permission Page"),
      drawer: TabletMobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchDropdownWithSearch(
              isMandatory: false,
              labelText: "Attribute",
              items: assignedmemberprofileeditprovider.role,
              selectedValue: assignedmemberprofileeditprovider.selectedRole,
              onChanged: assignedmemberprofileeditprovider.setSelectedRole,
              hintText: "Select Attribute",
            ),
            const SizedBox(height: 8),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Reports",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.blackColor,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: assignedmemberprofileeditprovider.isReportsEnabled,
                  onChanged: (bool? value) {
                    assignedmemberprofileeditprovider.setIsReportEnabled(
                      value ?? false,
                    );
                  },
                  side: const BorderSide(color: Colors.black, width: 2),
                  activeColor: AppColor.primaryColor2,
                  checkColor: Colors.white,
                ),

                const Text(
                  "Enabled",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            /////////////////////////////
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Reports",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.blackColor,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: assignedmemberprofileeditprovider.isReportsEnabled,
                  onChanged: (bool? value) {
                    assignedmemberprofileeditprovider.setIsReportEnabled(
                      value ?? false,
                    );
                  },
                  side: const BorderSide(color: Colors.black, width: 2),
                  activeColor: AppColor.primaryColor2,
                  checkColor: Colors.white,
                ),

                const Text(
                  "Enabled",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            /////////////////////////////
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Payment Link",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.blackColor,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: assignedmemberprofileeditprovider.isPaymentLinkEnabled,
                  onChanged: (bool? value) {
                    assignedmemberprofileeditprovider.setIsPaymentLinkEnabled(
                      value ?? false,
                    );
                  },
                  side: const BorderSide(color: Colors.black, width: 2),
                  activeColor: AppColor.primaryColor2,
                  checkColor: Colors.white,
                ),

                const Text(
                  "Enabled",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            /////////////////////////////
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Call Data",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.blackColor,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: assignedmemberprofileeditprovider.isCallDataEnabled,
                  onChanged: (bool? value) {
                    assignedmemberprofileeditprovider.setIsCallDataEnabled(
                      value ?? false,
                    );
                  },
                  side: const BorderSide(color: Colors.black, width: 2),
                  activeColor: AppColor.primaryColor2,
                  checkColor: Colors.white,
                ),

                const Text(
                  "Enabled",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            /////////////////////////////
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Camp",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.blackColor,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: assignedmemberprofileeditprovider.isCampEnabled,
                  onChanged: (bool? value) {
                    assignedmemberprofileeditprovider.setIsCampEnabled(
                      value ?? false,
                    );
                  },
                  side: const BorderSide(color: Colors.black, width: 2),
                  activeColor: AppColor.primaryColor2,
                  checkColor: Colors.white,
                ),

                const Text(
                  "Enabled",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            CustomMultiSelectField(
              labelText: "Enquiry",
              options: assignedmemberprofileeditprovider.enquiryLists,
              selectedItems:
                  assignedmemberprofileeditprovider.selectedEnquiryList,
              onItemToggle:
                  (val) =>
                      assignedmemberprofileeditprovider.SetSelectedEnquiryList(
                        val,
                      ),
            ),
            const SizedBox(height: 6),
            ///
            CustomMultiSelectField(
              labelText: "Leads",
              options: assignedmemberprofileeditprovider.leadsList,
              selectedItems:
                  assignedmemberprofileeditprovider.selectedLeadList,
              onItemToggle:
                  (val) =>
                      assignedmemberprofileeditprovider.SetSelectedLeadsList(
                        val,
                      ),
            ),
            const SizedBox(height: 6),
            
            
          ],
        ),
      ),
    );
  }
}
