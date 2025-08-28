import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/domestic_leads_data/domestic_leads_data.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/domestic_lead_home/domestic_leads_homeprovider.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_daterange_field.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/presentation/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class DomesticLeadsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final domesticleadhomeprovider = Provider.of<DropdownProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("DomesticLeadsHome")),
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
                  const SizedBox(height: 6),
                  SelectAllMultiSelectTextfield(
                    labelText: "Zone",
                    hintText: "Select zone",

                    items: domesticleadhomeprovider.zones,
                    selectedValues: domesticleadhomeprovider.selectedZones,
                    onChanged:
                        (vals) => domesticleadhomeprovider.setZones(vals),
                    isMandatory: false,
                  ),
                  const SizedBox(height: 6),
                  SelectAllMultiSelectTextfield(
                    labelText: "Branches",
                    hintText: "Select branches",
                    items: domesticleadhomeprovider.branches,
                    selectedValues: domesticleadhomeprovider.selectedBranches,
                    onChanged:
                        (vals) => domesticleadhomeprovider.setBranches(vals),
                    isMandatory: false,
                  ),
                  const SizedBox(height: 6),
                  SelectAllMultiSelectTextfield(
                    labelText: "Status",
                    hintText: "Select Status",
                    items: domesticleadhomeprovider.status,
                    selectedValues: domesticleadhomeprovider.selectedStatus,
                    onChanged:
                        (vals) => domesticleadhomeprovider.setStatus(vals),
                    isMandatory: false,
                  ),
                  const SizedBox(height: 6),

                  //////////SELECT ASSIGNED/////////
                  CustomSearchDropdownWithSearch(
                    isMandatory: false,
                    labelText: "Assigned",
                    items: domesticleadhomeprovider.agentName,
                    selectedValue: domesticleadhomeprovider.selectedAgentName,
                    onChanged: domesticleadhomeprovider.setAgentNames,
                    hintText: "Select Assigned",
                  ),
                  const SizedBox(height: 6),
                  //////////SELECT SOCIALMEDIA/////////
                  CustomSearchDropdownWithSearch(
                    isMandatory: false,
                    labelText: "Social media",
                    items: domesticleadhomeprovider.socialMedia,
                    selectedValue: domesticleadhomeprovider.selectedSocialMedia,
                    onChanged: domesticleadhomeprovider.setSocialMedia,
                    hintText: "Select social media",
                  ),
                  const SizedBox(height: 6),
                  //////////SELECT DIGITALMEDIA/////////
                  CustomSearchDropdownWithSearch(
                    isMandatory: false,
                    labelText: "Digital media",
                    items: domesticleadhomeprovider.digitalmedia,
                    selectedValue:
                        domesticleadhomeprovider.selectedDigitalMedia,
                    onChanged: domesticleadhomeprovider.setDigitalMedia,
                    hintText: "Select digital media",
                  ),
                  const SizedBox(height: 6),

                  //////////SELECT DATEFILTER/////////
                  CustomSearchDropdownWithSearch(
                    isMandatory: false,
                    labelText: "Date filter",
                    items: domesticleadhomeprovider.dateFilter,
                    selectedValue: domesticleadhomeprovider.selectedDateFilter,
                    onChanged: domesticleadhomeprovider.setDateFilter,
                    hintText: "Select date filter",
                  ),
                  const SizedBox(height: 6),

                  CustomDateRangeField(
                    controller: domesticleadhomeprovider.dateRangeController,
                    hintText: "Select Date Range",
                    labelText: "Date Range",
                    isMandatory: false,
                  ),
                  const SizedBox(height: 6),
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
