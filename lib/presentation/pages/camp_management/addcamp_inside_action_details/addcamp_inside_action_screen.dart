import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../../../../widgets/custom_textfield/Custom_date_field.dart';
import '../../../../widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'addcamp_inside_actionprovider_screen.dart';

class AddCampInsideActionScreen extends StatelessWidget {
  const AddCampInsideActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addCampInsideActionProvider =
        Provider.of<AddCampInsideActionProvider>(context);

    return Scaffold(
      drawer: const TabletMobileDrawer(),
      appBar: const CustomAppBar(title: "Camp Edit"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            CustomSearchDropdownWithSearch(
              isMandatory: true,
              labelText: "Branch",
              items: addCampInsideActionProvider.branch,
              selectedValue: addCampInsideActionProvider.selectedbranch,
              onChanged: addCampInsideActionProvider.setSelectedbranch,
              hintText: "Select Status",
            ),
            SizedBox(height: 6),
            CustomDateField(
              controller: addCampInsideActionProvider.calenderDateController,
              hintText: "Select Camp date",
              labelText: "Camp Date",
              isMandatory: true,
            ),
            SizedBox(height: 6),
            CustomSearchDropdownWithSearch(
              isMandatory: true,
              labelText: "Camp Type",
              items: addCampInsideActionProvider.campeType,
              selectedValue: addCampInsideActionProvider.selectedcampeType,
              onChanged: addCampInsideActionProvider.setSelectedcampeType,
              hintText: "Select Camp Type",
            ),
            const SizedBox(height: 6),
            CustomSearchDropdownWithSearch(
              isMandatory: true,
              labelText: "Camp Location",
              items: addCampInsideActionProvider.location,
              selectedValue: addCampInsideActionProvider.selectedlocation,
              onChanged: addCampInsideActionProvider.setSelectedlocation,
              hintText: "Select Location",
            ),
            SizedBox(height: 6),
            CustomTextField(
              controller: addCampInsideActionProvider.drNameController,
              hintText: "Enter Dr name",
              labelText: "Dr Name",
              isMandatory: true,
            ),
            SizedBox(height: 6),
            CustomTextField(
              controller:
                  addCampInsideActionProvider.campInChargeNameController,
              hintText: "Enter Camp Incharge name",
              labelText: "Camp Incharge",
              isMandatory: true,
            ),
            SizedBox(height: 6),
            CustomTextField(
              controller:
                  addCampInsideActionProvider.gMapLocationNameController,
              hintText: "Enter Camp location name",
              labelText: "G.Map Location",
              isMandatory: true,
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ],
        ),
      ),
    );
  }
}
