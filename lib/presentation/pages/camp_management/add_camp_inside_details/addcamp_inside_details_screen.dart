import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../../../../widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import '../../../../widgets/custom_textfield/Custom_date_field.dart';
import '../../../../widgets/custom_textfield/custom_large_textfield.dart';
import '../../../../widgets/custom_textfield/custom_textfield.dart';
import '../../domesticLeads/new_leads/date_field_with_age.dart';
import 'addcamp_inside_details_provider.dart';

class AddCampInsideDetailsScreen extends StatelessWidget {
  const AddCampInsideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addcampinsidedetailsprovider = Provider.of<AddCampInsideProvider>(
      context,
    );
    return Scaffold(
      drawer: const TabletMobileDrawer(),
      appBar: const CustomAppBar(title: "New Activity Data"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            CustomDateField(
              controller: addcampinsidedetailsprovider.calenderDateController,
              hintText: "Select Camp date",
              labelText: "Camp Date",
              isMandatory: true,
            ),
            SizedBox(height: 6),
            CustomTextField(
              readOnly: false, // ✅ Make it uneditable
              controller: addcampinsidedetailsprovider.campActivityController,
              hintText: "Provide Activity",
              labelText: "Activity",
              isMandatory: true,
            ),
            SizedBox(height: 6),

            CustomLargeTextField(
              readOnly: false, // ✅ Make it uneditable
              controller:
                  addcampinsidedetailsprovider.areaCoveredDetailsController,
              hintText: "Provide area covered details",
              labelText: "Area Covered",
              isMandatory: true,
            ),
            SizedBox(height: 6),

            CustomFileChooserField(
              labelText: "Upload Photos",
              isMandatory: true,
              selectedFile: addcampinsidedetailsprovider.selectedFile,
              allowedExtensions: ["csv"], //  pass dynamically
              onFilePicked: (file) {
                if (file != null) {
                  addcampinsidedetailsprovider.setFile(file);
                }
              },
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
