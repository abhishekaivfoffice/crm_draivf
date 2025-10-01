import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/jl_new_leads/jl_date_field_with_age.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/add_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/dl_new_leads/dl_date_field_with_age.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class JLEditLeadScreen extends StatefulWidget {
  const JLEditLeadScreen({super.key});

  @override
  State<JLEditLeadScreen> createState() => _JLEditLeadScreenState();
}

class _JLEditLeadScreenState extends State<JLEditLeadScreen> {
  final _editLeadFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    /// Load dummy lead data into provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddLeadsProvider>(context, listen: false).loadDummyLead();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addleadprovider = Provider.of<JLAddLeadsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "Job leads Edit Lead"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _editLeadFormKey,
            child: Column(
              children: [
                const SizedBox(height: 24),

                /// 👇 SAME UI AS AddLeadScreen (all fields kept)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Status
                    CustomSearchDropdownWithSearch(
                      isMandatory: true,
                      labelText: "Status",
                      items: addleadprovider.status,
                      selectedValue: addleadprovider.selectedstatus,
                      onChanged: addleadprovider.setSelectedstatus,
                      hintText: "Select Status",
                    ),
                    const SizedBox(height: 6),

                    /// Source
                    CustomSearchDropdownWithSearch(
                      isMandatory: true,
                      labelText: "Source",
                      items: addleadprovider.sources,
                      selectedValue: addleadprovider.selectedsources,
                      onChanged: addleadprovider.setSelectedsources,
                      hintText: "Select Source",
                    ),
                    const SizedBox(height: 6),

                    /// Assigned
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "Assigned",
                      items: addleadprovider.assigned,
                      selectedValue: addleadprovider.selectedassigned,
                      onChanged: addleadprovider.setSelectedassigned,
                      hintText: "Select Assigned",
                    ),
                    const SizedBox(height: 6),

                    /// Attribute
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "Attribute",
                      items: addleadprovider.attribute,
                      selectedValue: addleadprovider.selectedattribute,
                      onChanged: addleadprovider.setSelectedattribute,
                      hintText: "Select Attribute",
                    ),
                    const SizedBox(height: 6),

                    /// Tags
                    CustomMultiSelectField(
                      labelText: "Tag",
                      options: addleadprovider.tags,
                      selectedItems: addleadprovider.selectedTags,
                      onItemToggle: addleadprovider.toggleItem,
                    ),
                    const SizedBox(height: 6),

                    /// Wife name
                    CustomTextField(
                      controller: addleadprovider.wifeNameController,
                      hintText: "Enter wife name",
                      labelText: "Wife Name",
                      isMandatory: true,
                    ),
                    const SizedBox(height: 6),

                    /// Wife number
                    CustomTextField(
                      controller: addleadprovider.wifeNumberController,
                      hintText: "Enter wife number",
                      labelText: "Wife Number",
                      isMandatory: true,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: addleadprovider.isWifeWhatsappAvailable,
                          onChanged: (val) =>
                              addleadprovider.setWifeWhatsappAvailable(val!),
                          side: const BorderSide(color: Colors.black, width: 2),
                          activeColor: AppColor.primaryColor2,
                          checkColor: Colors.white,
                        ),
                        const Text("Check this if wife WhatsApp available"),
                      ],
                    ),
                    const SizedBox(height: 6),

                    /// Preferred location
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "Preferred Location",
                      items: addleadprovider.preferredlocations,
                      selectedValue: addleadprovider.selectedpreferredlocation,
                      onChanged: addleadprovider.setSelectedPreferredLocation,
                      hintText: "Select preferred location",
                    ),
                    const SizedBox(height: 6),

                    /// Address
                    CustomTextField(
                      controller: addleadprovider.addressController,
                      hintText: "Enter address",
                      labelText: "Address",
                      isMandatory: false,
                    ),
                    const SizedBox(height: 6),

                    /// Husband Name
                    CustomTextField(
                      controller: addleadprovider.husbandNameController,
                      hintText: "Enter husband name",
                      labelText: "Husband Name",
                      isMandatory: false,
                    ),
                    const SizedBox(height: 6),

                    /// Marriage Date
                    JLDateFieldWithAge(
                      controller: addleadprovider.marriageDateController,
                      hintText: "Select marriage date",
                      labelText: "Marriage at",
                      isMandatory: false,
                    ),
                    const SizedBox(height: 6),

                    /// Married Years (auto)
                    CustomTextField(
                      controller: addleadprovider.marriedYearsController,
                      hintText: "Years will be auto-calculated",
                      labelText: "Married Years",
                      readOnly: true,
                    ),
                    const SizedBox(height: 6),

                    /// Wife Age
                    CustomTextField(
                      controller: addleadprovider.wifeAgeController,
                      hintText: "Enter wife age",
                      labelText: "Wife Age",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 6),

                    /// Husband Number
                    CustomTextField(
                      controller: addleadprovider.husbandNumberController,
                      hintText: "Enter husband number",
                      labelText: "Husband Number",
                      keyboardType: TextInputType.number,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: addleadprovider.isHusbandWhatsappAvailable,
                          onChanged: (val) =>
                              addleadprovider.setHusbandWhatsappAvailable(val!),
                          side: const BorderSide(color: Colors.black, width: 2),
                          activeColor: AppColor.primaryColor2,
                          checkColor: Colors.white,
                        ),
                        const Text("Check this if Husband WhatsApp available"),
                      ],
                    ),
                    const SizedBox(height: 6),

                    /// Husband Age
                    CustomTextField(
                      controller: addleadprovider.husbandAgeController,
                      hintText: "Enter husband age",
                      labelText: "Husband Age",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 6),

                    /// Email
                    CustomTextField(
                      controller: addleadprovider.emailController,
                      hintText: "Enter email",
                      labelText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 6),

                    /// City
                    CustomTextField(
                      controller: addleadprovider.cityController,
                      hintText: "Enter city",
                      labelText: "City",
                    ),
                    const SizedBox(height: 6),

                    /// State
                    CustomTextField(
                      controller: addleadprovider.stateController,
                      hintText: "Enter state",
                      labelText: "State",
                    ),
                    const SizedBox(height: 6),

                    /// Country
                    CustomTextField(
                      controller: addleadprovider.countryController,
                      hintText: "Enter country",
                      labelText: "Country",
                    ),
                    const SizedBox(height: 6),

                    /// Zip Code
                    CustomTextField(
                      controller: addleadprovider.zipcodeController,
                      hintText: "Enter zip code",
                      labelText: "Zip Code",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 6),

                    /// Wife MDR
                    CustomTextField(
                      controller: addleadprovider.wifemdrnumberController,
                      hintText: "Enter wife MDR number",
                      labelText: "Wife MDR No",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 6),

                    /// Husband MDR
                    CustomTextField(
                      controller: addleadprovider.husbandmdrnumberController,
                      hintText: "Enter husband MDR number",
                      labelText: "Husband MDR No",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 6),

                    /// Walkin Date
                    CustomDateField(
                      controller: addleadprovider.walkinDateController,
                      hintText: "Select walkin date",
                      labelText: "Walkin Date",
                    ),
                    const SizedBox(height: 6),

                    /// Profile Group
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "Profile Group",
                      items: addleadprovider.profileGroup,
                      selectedValue: addleadprovider.selectedProfileGroup,
                      onChanged: addleadprovider.setSelectedProfileGroup,
                      hintText: "Select profile group",
                    ),
                    const SizedBox(height: 6),

                    /// Fertility Treatment
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "For fertility treatment",
                      items: addleadprovider.forFertilityTreatment,
                      selectedValue:
                          addleadprovider.selectedForFertilityTreatment,
                      onChanged:
                          addleadprovider.setSelectedForFertilityTreatment,
                      hintText: "Select fertility treatment",
                    ),
                    const SizedBox(height: 6),

                    /// Time to Call
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "Prefered Time To Call",
                      items: addleadprovider.preferedTimeToCall,
                      selectedValue:
                          addleadprovider.selectedPreferedTimeToCall,
                      onChanged: addleadprovider.setSelectedPreferedTimeToCall,
                      hintText: "Select time",
                    ),
                    const SizedBox(height: 6),

                    /// Language
                    CustomSearchDropdownWithSearch(
                      isMandatory: false,
                      labelText: "Prefered Language",
                      items: addleadprovider.preferedLanguage,
                      selectedValue: addleadprovider.selectedPreferedLanguage,
                      onChanged: addleadprovider.setSelectedPreferedLanguage,
                      hintText: "Select language",
                    ),
                    const SizedBox(height: 6),

                    /// Description
                    CustomLargeTextField(
                      controller: addleadprovider.descriptionController,
                      hintText: "Enter description...",
                      labelText: "Description",
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Checkbox(
                          value: addleadprovider.isPublic,
                          onChanged: (val) =>
                              addleadprovider.setIsPublic(val ?? false),
                        ),
                        const Text("Public"),
                        const SizedBox(width: 16),
                        Checkbox(
                          value: addleadprovider.isContactedToday,
                          onChanged: (val) =>
                              addleadprovider.setIsContactedToday(val ?? false),
                        ),
                        const Text("Contacted Today"),
                      ],
                    ),
                  ],
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
                          Color.fromARGB(255, 200, 200, 200),
                          Color.fromARGB(255, 224, 224, 224),
                        ],
                        onPressed: () => Get.back(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomGradientButton(
                        text: "Update",
                        onPressed: () {
                          if (_editLeadFormKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Lead updated successfully ✅")),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
