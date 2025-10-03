import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';

import 'package:crm_draivfmobileapp/provider/internationallead_provider/Inl_assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/provider/setup_staff_provider/setup_staff_addnew_staff_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/segment_swipe_button.dart.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class STPStaffAddNewStaffMember extends StatefulWidget {
  const STPStaffAddNewStaffMember({super.key});

  @override
  State<STPStaffAddNewStaffMember> createState() =>
      _STPStaffAddNewStaffMemberState();
}

class _STPStaffAddNewStaffMemberState extends State<STPStaffAddNewStaffMember> {
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
    final stpstaffaddnewstaffprovider =
        Provider.of<SetupStaffAddNewStaffProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: " STP Staff Profile Edit"),
      drawer: TabletMobileDrawer(),
      body: Column(
        children: [
          // Persistent button on top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SegmentedSwipeButton(
              page1: "Permission",
              page2: "Profile",
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
                    ? SingleChildScrollView(
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
                                  stpstaffaddnewstaffprovider
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
                                  stpstaffaddnewstaffprovider
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
                                  stpstaffaddnewstaffprovider.emailController,
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
                                  stpstaffaddnewstaffprovider
                                      .phoneNumberController,
                              hintText: "enter call number",
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "enter call number"
                                          : null,
                            ),
                            const SizedBox(height: 6),
                            CustomFileChooserField(
                              labelText: "Choose File",
                              isMandatory: true,
                              selectedFile:
                                  stpstaffaddnewstaffprovider.selectedFile,
                              allowedExtensions: [
                                "csv",
                                "Pdf",
                              ], //  pass dynamically
                              onFilePicked: (file) {
                                if (file != null) {
                                  stpstaffaddnewstaffprovider.setFile(file);
                                }
                              },
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
                                  value: stpstaffaddnewstaffprovider.isExotel,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider.setIsExotel(
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
                                      stpstaffaddnewstaffprovider
                                          .isCallDisabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                                  value: stpstaffaddnewstaffprovider.isAdministrator,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider.setIsAdministrator(
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
                                  "Administrator",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.poppins,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                const SizedBox(width: 12,), Checkbox(
                                  value: stpstaffaddnewstaffprovider.isSendWelcomeMail,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider.setIsSendWelcomeMail(
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
                                  "Send Welcome Mail",
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
                                  stpstaffaddnewstaffprovider
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
                              labelText: "Role",
                              items: stpstaffaddnewstaffprovider.role,
                              selectedValue:
                                  stpstaffaddnewstaffprovider.selectedRole,
                              onChanged:
                                  stpstaffaddnewstaffprovider.setSelectedRole,
                              hintText: "Select Role",
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
                                      stpstaffaddnewstaffprovider
                                          .isReportsEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                                      stpstaffaddnewstaffprovider
                                          .isPaymentLinkEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                                      stpstaffaddnewstaffprovider
                                          .isCallDataEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                                      stpstaffaddnewstaffprovider.isCampEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                              options: stpstaffaddnewstaffprovider.enquiryLists,
                              selectedItems:
                                  stpstaffaddnewstaffprovider
                                      .selectedEnquiryList,
                              onItemToggle:
                                  (val) => stpstaffaddnewstaffprovider
                                      .setSelectedEnquiryList(val),
                            ),

                            const SizedBox(height: 6),

                            ///
                            CustomMultiSelectField(
                              labelText: "Leads",
                              options: stpstaffaddnewstaffprovider.leadsList,
                              selectedItems:
                                  stpstaffaddnewstaffprovider.selectedLeadList,
                              onItemToggle:
                                  (val) => stpstaffaddnewstaffprovider
                                      .setSelectedLeadsList(val),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Expanded(
                                  child:
                                  //from date
                                  CustomDateField(
                                    controller:
                                        stpstaffaddnewstaffprovider
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
                                        stpstaffaddnewstaffprovider
                                            .toDateController,
                                    hintText: "To Date",
                                    labelText: "To date",
                                    isMandatory: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            Divider(color: AppColor.primaryColor2),
                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Status",
                              hintText: "Select Status",
                              items: stpstaffaddnewstaffprovider.assignedstatus,
                              selectedValues:
                                  stpstaffaddnewstaffprovider
                                      .selectedassignedStatus,
                              onChanged:
                                  (vals) => stpstaffaddnewstaffprovider
                                      .setAssignedStatus(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Source",
                              hintText: "Select source",
                              items:
                                  stpstaffaddnewstaffprovider
                                      .assigneddigitalmedia,
                              selectedValues:
                                  stpstaffaddnewstaffprovider
                                      .selectedDigitalMedia,
                              onChanged:
                                  (vals) => stpstaffaddnewstaffprovider
                                      .setSelectedDigitalMedia(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),
                            SelectAllMultiSelectTextfield(
                              labelText: "Branches",
                              hintText: "Select Branches",
                              items:
                                  stpstaffaddnewstaffprovider.assignedbranches,
                              selectedValues:
                                  stpstaffaddnewstaffprovider
                                      .selectedAssignedBranches,
                              onChanged:
                                  (vals) => stpstaffaddnewstaffprovider
                                      .setAssignedBranches(vals),
                              isMandatory: false,
                            ),

                            Divider(color: AppColor.primaryColor2),

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
                                      stpstaffaddnewstaffprovider
                                          .isInternationalLeadEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                                      stpstaffaddnewstaffprovider
                                          .isJobLeadsLeadEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                                      stpstaffaddnewstaffprovider
                                          .isDonorLeadsLeadEnabled,
                                  onChanged: (bool? value) {
                                    stpstaffaddnewstaffprovider
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
                            Divider(color: AppColor.primaryColor2),

                            const SizedBox(height: 6),
                            CustomMultiSelectField(
                              labelText: "Academy Leads",
                              options:
                                  stpstaffaddnewstaffprovider.academyLeadsLists,
                              selectedItems:
                                  stpstaffaddnewstaffprovider
                                      .selectedAcademyLeadsList,
                              onItemToggle:
                                  (val) => stpstaffaddnewstaffprovider
                                      .setAcademyLeadsList(val),
                            ),
                            const SizedBox(height: 6),

                            SelectAllMultiSelectTextfield(
                              labelText: "Status",
                              hintText: "Select Status",
                              items:
                                  stpstaffaddnewstaffprovider
                                      .academyleadsassignedstatus,
                              selectedValues:
                                  stpstaffaddnewstaffprovider
                                      .selectedacademyleadsassignedStatus,
                              onChanged:
                                  (vals) => stpstaffaddnewstaffprovider
                                      .setAcademyLeadsAssignedStatus(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),

                            SelectAllMultiSelectTextfield(
                              labelText: "Source",
                              hintText: "Select Source",
                              items:
                                  stpstaffaddnewstaffprovider
                                      .academyLeadsSourceOption,
                              selectedValues:
                                  stpstaffaddnewstaffprovider
                                      .selectedacademyLeadsSource,
                              onChanged:
                                  (vals) => stpstaffaddnewstaffprovider
                                      .setSelectedAcademyLeadSource(vals),
                              isMandatory: false,
                            ),
                            const SizedBox(height: 6),

                            SelectAllMultiSelectTextfield(
                              labelText: "Cource",
                              hintText: "Select Cource",
                              items:
                                  stpstaffaddnewstaffprovider
                                      .academyLeadsCourceOption,
                              selectedValues:
                                  stpstaffaddnewstaffprovider
                                      .selectedacademyLeadsCource,
                              onChanged:
                                  (vals) => stpstaffaddnewstaffprovider
                                      .setSelectedAcademyLeadCource(vals),
                              isMandatory: false,
                            ),
                            Divider(color: AppColor.primaryColor2),
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
