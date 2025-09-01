import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../../../../widgets/custom_textfield/custom_dropdown_with_search.dart';
import '../../../../widgets/custom_textfield/custom_textfield.dart';
import 'convert_screen_provider.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final convertprovider = Provider.of<ConvertScreenProvider>(context);
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Convert"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: convertprovider.wifeNameController,
                hintText: "Enter wife name",
                labelText: "Wife Name",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              CustomTextField(
                controller: convertprovider.husbandNameController,
                hintText: "Enter Husband name",
                labelText: "Husband Name",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              CustomTextField(
                controller: convertprovider.wifeAgeController,
                hintText: "Enter wife Age",
                labelText: "Wife Age",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              CustomTextField(
                controller: convertprovider.husbandNumberController,
                hintText: "Enter Husband name",
                labelText: "Husband Name",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              CustomTextField(
                controller: convertprovider.wifeNumberController,
                hintText: "Enter Wife Number",
                labelText: "Wife Number",
                isMandatory: true,
              ),
              const SizedBox(height: 6),

              CustomTextField(
                controller: convertprovider.husbandAgeController,
                hintText: "Enter Husband Age",
                labelText: "Husband Age",
                isMandatory: false,
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "preferred Location",
                items: convertprovider.preferredlocations,
                selectedValue: convertprovider.selectedpreferredlocation,
                onChanged: convertprovider.setSelectedPreferredLocation,
                hintText: "Select preferred location",

              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Treatment",
                items: convertprovider.treatment,
                selectedValue: convertprovider.selectedtreatment,
                onChanged: convertprovider.setSelectedtreatment,
                hintText: "Select Treatment",
              ),
              const SizedBox(height: 6),

              //////////SELECT STATUS/////////
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Status",
                items: convertprovider.status,
                selectedValue: convertprovider.selectedstatus,
                onChanged: convertprovider.setSelectedstatus,
                hintText: "Select Status",
              ),
              const SizedBox(height: 6),

              CustomTextField(
                readOnly: false, // ✅ Make it uneditable
                controller: convertprovider.sourceController,
                hintText: "whatsapp",
                labelText: "Source",
                isMandatory: true,
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
