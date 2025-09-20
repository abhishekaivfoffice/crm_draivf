import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';

import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/segment_swipe_button.dart.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class JLAssignedMemberProfileEditHome extends StatefulWidget {
  const JLAssignedMemberProfileEditHome({super.key});

  @override
  State<JLAssignedMemberProfileEditHome> createState() =>
      _JLAssignedMemberProfileEditHomeState();
}

class _JLAssignedMemberProfileEditHomeState
    extends State<JLAssignedMemberProfileEditHome> {
  bool _isPage1Active = true;

  void _onPage1() {
    setState(() {
      _isPage1Active = true;
    });
  }

  void _onPage2() {
    setState(() {
      _isPage1Active = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final assignedmemberprofileeditprovider =
        Provider.of<JLAssignedMemberProfileEditProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: "Job leads Profile Edit"),
      drawer: TabletMobileDrawer(),
      body: Column(
        children: [
          // Persistent button on top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SegmentedSwipeButton(
              page1: "Permission",
              page2: "Edit",
              gradientColors: [Color(0xFF8E0E6B), Color(0xFFD4145A)],
              textStyle: const TextStyle(color: Colors.white, fontSize: 16),
              onPage1: _onPage1,
              onPage2: _onPage2,
            ),
          ),

          // Dynamic content below
          Expanded(
            child:
                _isPage1Active
                    ?
                    //////////////////////////////////////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////////////////////////////////////////
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            CustomTextField(
                              isMandatory: true,

                              labelText: "First Name",
                              controller:
                                  assignedmemberprofileeditprovider
                                      .firstNameController,
                              hintText: "enter first name",
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "enter first name"
                                          : null,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              isMandatory: true,

                              labelText: "Last Name",
                              controller:
                                  assignedmemberprofileeditprovider
                                      .lastNameController,
                              hintText: "enter Last name",
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "enter last name"
                                          : null,
                            ),
                            const SizedBox(height: 8),

                            CustomTextField(
                              isMandatory: true,

                              labelText: "Email",
                              controller:
                                  assignedmemberprofileeditprovider
                                      .emailController,
                              hintText: "enter email id",
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "enter email id"
                                          : null,
                            ),
                            const SizedBox(height: 8),

                            CustomTextField(
                              isMandatory: true,

                              labelText: "Call Number",
                              controller:
                                  assignedmemberprofileeditprovider
                                      .phoneNumberController,
                              hintText: "enter call number",
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "enter call number"
                                          : null,
                            ),

                            const SizedBox(height: 6),

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  Call Type",
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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isExotel,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsExotel(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  activeColor: AppColor.primaryColor2,
                                  checkColor: Colors.white,
                                ),

                                const Text(
                                  "Exotel",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.poppins,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Checkbox(
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isCallDisabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsCallDisabled(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  activeColor: AppColor.primaryColor2,
                                  checkColor: Colors.white,
                                ),

                                const Text(
                                  "Call disabled",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.poppins,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  Administrator",
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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isExotel,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsExotel(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  activeColor: AppColor.primaryColor2,
                                  checkColor: Colors.white,
                                ),

                                const Text(
                                  "Administrator",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.poppins,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            CustomTextField(
                              isMandatory: true,
                              obscureText: true,
                              labelText: "Password",
                              controller:
                                  assignedmemberprofileeditprovider
                                      .phoneNumberController,
                              hintText: "enter password",
                            ),

                            const SizedBox(height: 6),
                            const Text(
                              "Note: if you populate this field, password will be changed on this member.",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins,
                                color: AppColor.blueaccent,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomGradientButton(
                                    text: "Cancel",
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppFonts.poppins,
                                      color: AppColor.blackColor,
                                    ),
                                    gradientColors: const [
                                      const Color.fromARGB(255, 200, 200, 200),
                                      const Color.fromARGB(255, 224, 224, 224),
                                    ],
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ), // space between buttons
                                Expanded(
                                  child: CustomGradientButton(
                                    text: "Submit",
                                    onPressed: () {
                                      // submit action
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    )
                    :
                    ///////////////////////////////////////////////////////////////////////////////////////////////////
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            CustomSearchDropdownWithSearch(
                              isMandatory: false,
                              labelText: "Attribute",
                              items: assignedmemberprofileeditprovider.role,
                              selectedValue:
                                  assignedmemberprofileeditprovider
                                      .selectedRole,
                              onChanged:
                                  assignedmemberprofileeditprovider
                                      .setSelectedRole,
                              hintText: "Select Attribute",
                            ),
                            Divider(),
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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isReportsEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsReportEnabled(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(),

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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isPaymentLinkEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsPaymentLinkEnabled(
                                          value ?? false,
                                        );
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(),

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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isCallDataEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsCallDataEnabled(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(),

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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isCampEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsCampEnabled(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(),

                            const SizedBox(height: 6),
                            CustomMultiSelectField(
                              labelText: "Enquiry",
                              options:
                                  assignedmemberprofileeditprovider
                                      .enquiryLists,
                              selectedItems:
                                  assignedmemberprofileeditprovider
                                      .selectedEnquiryList,
                              onItemToggle:
                                  (val) => assignedmemberprofileeditprovider
                                      .setSelectedEnquiryList(val),
                            ),
                            Divider(color: AppColor.primaryColor2,),

                            const SizedBox(height: 6),

                            ///
                            CustomMultiSelectField(
                              labelText: "Leads",
                              options:
                                  assignedmemberprofileeditprovider.leadsList,
                              selectedItems:
                                  assignedmemberprofileeditprovider
                                      .selectedLeadList,
                              onItemToggle:
                                  (val) => assignedmemberprofileeditprovider
                                      .setSelectedLeadsList(val),
                            ),
                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Status",
                              hintText: "Select Status",
                              items:
                                  assignedmemberprofileeditprovider
                                      .assignedstatus,
                              selectedValues:
                                  assignedmemberprofileeditprovider
                                      .selectedassignedStatus,
                              onChanged:
                                  (vals) => assignedmemberprofileeditprovider
                                      .setAssignedStatus(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Source",
                              hintText: "Select source",
                              items:
                                  assignedmemberprofileeditprovider
                                      .assigneddigitalmedia,
                              selectedValues:
                                  assignedmemberprofileeditprovider
                                      .selectedDigitalMedia,
                              onChanged:
                                  (vals) => assignedmemberprofileeditprovider
                                      .setSelectedDigitalMedia(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Branches",
                              hintText: "Select Branches",
                              items:
                                  assignedmemberprofileeditprovider
                                      .assignedbranches,
                              selectedValues:
                                  assignedmemberprofileeditprovider
                                      .selectedAssignedBranches,
                              onChanged:
                                  (vals) => assignedmemberprofileeditprovider
                                      .setAssignedBranches(vals),
                              isMandatory: false,
                            ),

                            Divider(color: AppColor.primaryColor2,),

                            const SizedBox(height: 6),
                            /////////////////////////////
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  International Leads",
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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isInternationalLeadEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsInternationalLeadEnabled(
                                          value ?? false,
                                        );
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(),

                            const SizedBox(height: 6),
                            /////////////////////////////
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  Job Leads",
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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isJobLeadsLeadEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsJobLeadEnabled(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(),

                            const SizedBox(height: 6),
                            /////////////////////////////
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  Donor Leads",
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
                                  value:
                                      assignedmemberprofileeditprovider
                                          .isDonorLeadsLeadEnabled,
                                  onChanged: (bool? value) {
                                    assignedmemberprofileeditprovider
                                        .setIsDonorLeadEnabled(value ?? false);
                                  },
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
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
                            Divider(color: AppColor.primaryColor2,),

                            const SizedBox(height: 6),
                            CustomMultiSelectField(
                              labelText: "Academy Leads",
                              options:
                                  assignedmemberprofileeditprovider
                                      .academyLeadsLists,
                              selectedItems:
                                  assignedmemberprofileeditprovider
                                      .selectedAcademyLeadsList,
                              onItemToggle:
                                  (val) => assignedmemberprofileeditprovider
                                      .setAcademyLeadsList(val),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Expanded(
                                  child:
                                  //from date
                                  CustomDateField(
                                    controller:
                                        assignedmemberprofileeditprovider
                                            .fromDateController,
                                    hintText: "From Date",
                                    labelText: "From date",
                                    isMandatory: false,
                                  ),
                                ),
                                SizedBox(width: 6),
                                //to date
                                Expanded(
                                  child: CustomDateField(
                                    controller:
                                        assignedmemberprofileeditprovider
                                            .toDateController,
                                    hintText: "To Date",
                                    labelText: "To date",
                                    isMandatory: false,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Status",
                              hintText: "Select Status",
                              items:
                                  assignedmemberprofileeditprovider
                                      .academyleadsassignedstatus,
                              selectedValues:
                                  assignedmemberprofileeditprovider
                                      .selectedacademyleadsassignedStatus,
                              onChanged:
                                  (vals) => assignedmemberprofileeditprovider
                                      .setAcademyLeadsAssignedStatus(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),

                            SelectAllMultiSelectTextfield(
                              labelText: "Source",
                              hintText: "Select Source",
                              items:
                                  assignedmemberprofileeditprovider
                                      .academyLeadsSourceOption,
                              selectedValues:
                                  assignedmemberprofileeditprovider
                                      .selectedacademyLeadsSource,
                              onChanged:
                                  (vals) => assignedmemberprofileeditprovider
                                      .setSelectedAcademyLeadSource(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),

                            SelectAllMultiSelectTextfield(
                              labelText: "Cource",
                              hintText: "Select Cource",
                              items:
                                  assignedmemberprofileeditprovider
                                      .academyLeadsCourceOption,
                              selectedValues:
                                  assignedmemberprofileeditprovider
                                      .selectedacademyLeadsCource,
                              onChanged:
                                  (vals) => assignedmemberprofileeditprovider
                                      .setSelectedAcademyLeadCource(vals),
                              isMandatory: false,
                            ),
                             Divider(color: AppColor.primaryColor2,),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomGradientButton(
                                    text: "Cancel",
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppFonts.poppins,
                                      color: AppColor.blackColor,
                                    ),
                                    gradientColors: [
                                      const Color.fromARGB(255, 200, 200, 200),
                                      const Color.fromARGB(255, 224, 224, 224),
                                    ],
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ), // space between buttons
                                Expanded(
                                  child: CustomGradientButton(
                                    text: "Submit",
                                    onPressed: () {
                                      // submit action
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            /////////////////////////////
                          ],
                        ),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
