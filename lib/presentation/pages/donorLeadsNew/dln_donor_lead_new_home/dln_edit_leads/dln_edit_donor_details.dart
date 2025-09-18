import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_add_donor_second_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_date_field_with_age.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_edit_leads/dln_edit_donor_second_page.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNEditLeadScreen extends StatefulWidget {
  DLNEditLeadScreen({super.key});

  @override
  State<DLNEditLeadScreen> createState() => _DLNEditLeadScreenState();
}

class _DLNEditLeadScreenState extends State<DLNEditLeadScreen> {
  final _addleadformKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    /// Load dummy lead data into provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DLNAddLeadsProvider>(context, listen: false).loadDummyLead();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addleadprovider = Provider.of<DLNAddLeadsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "DLN Edit Donor Lead"),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _addleadformKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                  Text("1 Personal Details",style: TextStyle(color: AppColor.blackColor,fontSize: 18,fontWeight: FontWeight.bold),),
                        Divider(color: AppColor.primaryColor2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),

                        //////////SELECT STATUS/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: true,
                          labelText: "Status",
                          items: addleadprovider.status,
                          selectedValue: addleadprovider.selectedstatus,
                          onChanged: addleadprovider.setSelectedstatus,
                          hintText: "Select Status",
                        ),
                        const SizedBox(height: 6),

                        //////////SELECT SOURCE/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: true,
                          labelText: "Source",
                          items: addleadprovider.sources,
                          selectedValue: addleadprovider.selectedsources,
                          onChanged: addleadprovider.setSelectedsources,
                          hintText: "Select Source",
                        ),
                        const SizedBox(height: 6),

                        //////////SELECT ASSIGNED/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Assigned",
                          items: addleadprovider.assigned,
                          selectedValue: addleadprovider.selectedassigned,
                          onChanged: addleadprovider.setSelectedassigned,
                          hintText: "Select Assigned",
                        ),
                        const SizedBox(height: 6),

                        //////////SELECT ATTRIBUTE/////////
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Attribute",
                          items: addleadprovider.attribute,
                          selectedValue: addleadprovider.selectedattribute,
                          onChanged: addleadprovider.setSelectedattribute,
                          hintText: "Select Attribute",
                        ),
                        const SizedBox(height: 6),
                        CustomTextField(
                          controller: addleadprovider.wifeNameController,
                          hintText: "Enter wife name",
                          labelText: "Wife Name",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),

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
                              onChanged: (bool? value) {
                                addleadprovider.setWifeWhatsappAvailable(
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
                              "Check this if wife WhatsApp available",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        //agent name
                        CustomTextField(
                          controller: addleadprovider.agentnameController,
                          hintText: "Enter agent name",
                          labelText: "Agent Name",
                          isMandatory: false,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 6),
                        //agent number
                        CustomTextField(
                          controller: addleadprovider.agentnumberController,
                          hintText: "Enter agent number",
                          labelText: "Agent Number",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),

                        //preferred location
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Preferred Location",
                          items: addleadprovider.preferredlocations,
                          selectedValue:
                              addleadprovider.selectedpreferredlocation,
                          onChanged:
                              addleadprovider.setSelectedPreferredLocation,
                          hintText: "Select preferred location",
                        ),
                        const SizedBox(height: 6),
                        //simulation location
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Simulation Location",
                          items: addleadprovider.simulationlocation,
                          selectedValue:
                              addleadprovider.selectedsimulationlocation,
                          onChanged:
                              addleadprovider.setSelectedsimulationLocation,
                          hintText: "Select simulation location",
                        ),
                        const SizedBox(height: 6),
                        //case location
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Case Location",
                          items: addleadprovider.caselocation,
                          selectedValue: addleadprovider.selectedcaselocation,
                          onChanged: addleadprovider.setSelectedcaseLocation,
                          hintText: "Select case location",
                        ),
                        const SizedBox(height: 6),

                        //Address
                        CustomTextField(
                          controller: addleadprovider.addressController,
                          hintText: "Enter address",
                          labelText: "Address",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //Address
                        CustomTextField(
                          controller: addleadprovider.husbandNameController,
                          hintText: "Enter husband name",
                          labelText: "Husband Name",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //marriage Date
                        DLNDateFieldWithAge(
                          controller: addleadprovider.marriageDateController,
                          hintText: "Select marriage date",
                          labelText: "Marriage at",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //married years (autocalculated)
                        CustomTextField(
                          controller: addleadprovider.marriedYearsController,
                          hintText: "Years will be auto-calculated",
                          labelText: "Married Years",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                        ),
                        const SizedBox(height: 6),

                        //wife"s age
                        CustomTextField(
                          controller: addleadprovider.wifeAgeController,
                          hintText: "Enter wife age",
                          labelText: "Wife Age",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        //husband number
                        CustomTextField(
                          controller: addleadprovider.husbandNumberController,
                          hintText: "Enter husband number",
                          labelText: "Husband Number",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Checkbox(
                              value: addleadprovider.isHusbandWhatsappAvailable,
                              onChanged: (bool? value) {
                                addleadprovider.setHusbandWhatsappAvailable(
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
                              "Check this if Husband WhatsApp available",
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        //husband age
                        CustomTextField(
                          controller: addleadprovider.husbandAgeController,
                          hintText: "Enter husband age",
                          labelText: "Husband Age",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        //email Address
                        CustomTextField(
                          controller: addleadprovider.emailController,
                          hintText: "Enter email",
                          labelText: "Email Address",
                          isMandatory: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 6),
                        //City
                        CustomTextField(
                          controller: addleadprovider.cityController,
                          hintText: "Enter city",
                          labelText: "City",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //State
                        CustomTextField(
                          controller: addleadprovider.stateController,
                          hintText: "Enter state",
                          labelText: "State",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //Country
                        CustomTextField(
                          controller: addleadprovider.countryController,
                          hintText: "Enter country",
                          labelText: "Country",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //Zip Code
                        CustomTextField(
                          controller: addleadprovider.zipcodeController,
                          hintText: "Enter zip code",
                          labelText: "Zip code",
                          isMandatory: false,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 6),
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Profile Group",
                          items: addleadprovider.profileGroup,
                          selectedValue: addleadprovider.selectedProfileGroup,
                          onChanged: addleadprovider.setSelectedProfileGroup,
                          hintText: "Select profile group",
                        ),
                        const SizedBox(height: 6),
                        //for fertility treatment
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "For fertility treatment",
                          items: addleadprovider.forFertilityTreatment,
                          selectedValue:
                              addleadprovider.selectedForFertilityTreatment,
                          onChanged:
                              addleadprovider.setSelectedForFertilityTreatment,
                          hintText: "Select for fertility treatment",
                        ),

                        const SizedBox(height: 6),
                        //walkin date
                        CustomDateField(
                          controller: addleadprovider.walkinDateController,
                          hintText: "Select walkin date",
                          labelText: "Walkin Date",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        //prefered time
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Prefered Time",
                          items: addleadprovider.preferedTime,
                          selectedValue: addleadprovider.selectedPreferedTime,
                          onChanged: addleadprovider.setSelectedPreferedTime,
                          hintText: "Select prefered time",
                        ),

                        const SizedBox(height: 6),

                        //prefered language
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Prefered Language",
                          items: addleadprovider.preferedLanguage,
                          selectedValue:
                              addleadprovider.selectedPreferedLanguage,
                          onChanged:
                              addleadprovider.setSelectedPreferedLanguage,
                          hintText: "Select prefered language",
                        ),
                        const SizedBox(height: 6),
                        //description
                        CustomLargeTextField(
                          controller: addleadprovider.descriptionController,
                          hintText: "Enter description...",
                          labelText: "Description",
                          isMandatory: false,
                        ),

                        const SizedBox(height: 6),
                        //walkin date
                        CustomDateField(
                          controller: addleadprovider.lastcontactDateController,
                          hintText: "Select last contact date",
                          labelText: "Last Contact",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),

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
                        const SizedBox(width: 12), 
                        Expanded(
                          child: CustomGradientButton(
                            text: "Next",
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.poppins,
                              color: AppColor.blackColor,
                            ),
                            gradientColors: [
                              Color(0xFF64B5F6), 
                              Color(0xFF2196F3), 
                            ],
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          DLNEditDonorDetailsSecondScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12), 

                        Expanded(
                          child: CustomGradientButton(
                            text: "Save Donor",
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
            ],
          ),
        ),
      ),
    );
  }
}
