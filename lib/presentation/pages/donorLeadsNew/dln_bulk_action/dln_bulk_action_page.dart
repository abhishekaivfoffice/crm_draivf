import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_datefield_with_time.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNBulkActionPage extends StatelessWidget {
  const DLNBulkActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dlndomestileaddataprovider =
        Provider.of<DLNDomesticLeadsDataProvider>(context);

    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Bulk Action"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            children: [
              //mark as delete
              Row(
                children: [
                  Checkbox(
                    value: dlndomestileaddataprovider.isMassDeleteChecked,
                    onChanged: (bool? value) {
                      dlndomestileaddataprovider.setIsMassDeleteChecked(
                        value ?? false,
                      );
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Mass Delete",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.poppins,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Divider(),
              //mark as lost
              Row(
                children: [
                  Checkbox(
                    value: dlndomestileaddataprovider.isMarkAsLostChecked,
                    onChanged: (bool? value) {
                      dlndomestileaddataprovider.setMarkAsLostChecked(
                        value ?? false,
                      );
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Mark As Lost",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.poppins,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              //////////SELECT CHANGE STATUS/////////
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Change Status",
                items: dlndomestileaddataprovider.status,
                selectedValue: dlndomestileaddataprovider.selectedstatus,
                onChanged: dlndomestileaddataprovider.setSelectedstatus,
                hintText: "Change status",
              ),
              const SizedBox(height: 6),

              //////////SELECT change SOURCE/////////
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Lead Source",
                items: dlndomestileaddataprovider.sources,
                selectedValue: dlndomestileaddataprovider.selectedsources,
                onChanged: dlndomestileaddataprovider.setSelectedsources,
                hintText: "Select Lead Source",
              ),
              const SizedBox(height: 6),
              //Last Contact  date and time
              CustomDateFieldWithTime(
                controller:
                    dlndomestileaddataprovider.lastcontactdatetimeController,
                hintText: "Select last contact date",
                labelText: "Last Contact",
                isMandatory: false,
              ),
              const SizedBox(height: 6),
              //////////SELECT ASSIGNED/////////
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Assigned",
                items: dlndomestileaddataprovider.assignedPerson,
                selectedValue:
                    dlndomestileaddataprovider.selectedassignedperson,
                onChanged: dlndomestileaddataprovider.setSelectedassignedPerson,
                hintText: "Select Assigned",
              ),
              const SizedBox(height: 6),

              ///tags
              CustomMultiSelectField(
                labelText: "Tag",
                options: dlndomestileaddataprovider.tags,
                selectedItems: dlndomestileaddataprovider.selectedTags,
                onItemToggle:
                    (val) => dlndomestileaddataprovider.toggleItem(val),
              ),
              const SizedBox(height: 6),
              Divider(),
              //public   private //
              Row(
                children: [
                  Checkbox(
                    value: dlndomestileaddataprovider.isPublic,
                    onChanged: (bool? value) {
                      dlndomestileaddataprovider.setIsPublic(value ?? false);
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Public",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.poppins,
                      color: AppColor.blackColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Checkbox(
                    value: dlndomestileaddataprovider.isPrivate,
                    onChanged: (bool? value) {
                      dlndomestileaddataprovider.setIsPrivate(value ?? false);
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Private",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.poppins,
                      color: AppColor.blackColor,
                    ),
                  ),
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
                  const SizedBox(width: 12), // space between buttons
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
      ),
    );
  }
}
