import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_datefield_with_time.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class JLNBulkActionPage extends StatelessWidget {
  const JLNBulkActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final domestileaddataprovider = Provider.of<JlJobLeadsDataProvider>(
      context,
    );

    return Scaffold(
           drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: " Job Lead New Bulk Action"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            children: [
              //mark as delete
              Row(
                children: [
                  Checkbox(
                    value: domestileaddataprovider.isMassDeleteChecked,
                    onChanged: (bool? value) {
                      domestileaddataprovider.setIsMassDeleteChecked(
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
                    value: domestileaddataprovider.isMarkAsLostChecked,
                    onChanged: (bool? value) {
                      domestileaddataprovider.setMarkAsLostChecked(
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
                items: domestileaddataprovider.status,
                selectedValue: domestileaddataprovider.selectedstatus,
                onChanged: domestileaddataprovider.setSelectedstatus,
                hintText: "Change status",
              ),
              const SizedBox(height: 6),

              //////////SELECT change SOURCE/////////
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Lead Source",
                items: domestileaddataprovider.sources,
                selectedValue: domestileaddataprovider.selectedsources,
                onChanged: domestileaddataprovider.setSelectedsources,
                hintText: "Select Lead Source",
              ),
              const SizedBox(height: 6),
              //Last Contact  date and time
              CustomDateFieldWithTime(
                controller:
                    domestileaddataprovider.lastcontactdatetimeController,
                hintText: "Select last contact date",
                labelText: "Last Contact",
                isMandatory: false,
              ),
              const SizedBox(height: 6),
              //////////SELECT ASSIGNED/////////
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Assigned",
                items: domestileaddataprovider.assignedPerson,
                selectedValue: domestileaddataprovider.selectedassignedperson,
                onChanged: domestileaddataprovider.setSelectedassignedPerson,
                hintText: "Select Assigned",
              ),
              const SizedBox(height: 6),

              ///tags
              CustomMultiSelectField(
                labelText: "Tag",
                options: domestileaddataprovider.tags,
                selectedItems: domestileaddataprovider.selectedTags,
                onItemToggle: (val) => domestileaddataprovider.toggleItem(val),
              ),
              const SizedBox(height: 6),
              Divider(),
              //public   private //
              Row(
                children: [
                  Checkbox(
                    value: domestileaddataprovider.isPublic,
                    onChanged: (bool? value) {
                      domestileaddataprovider.setIsPublic(value ?? false);
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
                    value: domestileaddataprovider.isPrivate,
                    onChanged: (bool? value) {
                      domestileaddataprovider.setIsPrivate(value ?? false);
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
Get.back();                      },
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
