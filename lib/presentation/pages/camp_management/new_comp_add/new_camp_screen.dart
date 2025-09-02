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
import '../../domesticLeads/add_leads/date_field_with_age.dart';
import 'new_camp_provider.dart';

class NewCampScreen extends StatelessWidget {
  const NewCampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newcampprovider = Provider.of<NewCampProvider>(context);

    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "New Camp"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Branch",
                items: newcampprovider.preferredlocations,
                selectedValue: newcampprovider.selectedpreferredlocation,
                onChanged: newcampprovider.setSelectedPreferredLocation,
                hintText: "Select Status",
              ),
              SizedBox(height: 6),
              DateFieldWithAge(
                controller: newcampprovider.marriageDateController,
                hintText: "Select Camp date",
                labelText: "Camp Date",
                isMandatory: true,
              ),
              SizedBox(height: 6),

              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Camp Type",
                items: newcampprovider.campType,
                selectedValue: newcampprovider.selectedCampType,
                onChanged: newcampprovider.setSelectedcampType,
                hintText: "Select",
              ),
              SizedBox(height: 6),
              CustomTextField(
                controller: newcampprovider.campLocationController,
                hintText: " Provide Camp Location",
                labelText: "Camp Location",
                isMandatory: true,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 6),
              CustomTextField(
                controller: newcampprovider.drnNameController,
                hintText: " Provide dr.Name",
                labelText: "Dr Name",
                isMandatory: true,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 6),
              CustomTextField(
                controller: newcampprovider.campInChargeController,
                hintText: " Provide Camp Incharge",
                labelText: "Camp Incharge",
                isMandatory: true,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 6),
              CustomTextField(
                controller: newcampprovider.mapLocationController,
                hintText: " Serach for a Location",
                labelText: "G.Map Location",
                isMandatory: true,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20,),
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

            ],
          ),
        ),
      ),
    );
  }
}
