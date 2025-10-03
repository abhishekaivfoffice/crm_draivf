import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/set_lead_reminders_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_datefield_with_time.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class DLSetLeadReminders extends StatelessWidget {
  const DLSetLeadReminders({super.key});

  @override
  Widget build(BuildContext context) {
    final setleadreminderprovider=Provider.of<SetLeadRemindersProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: "set lead reminders"),
      drawer: TabletMobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
                  const SizedBox(height: 16),
              //Last Contact  date and time
              CustomDateFieldWithTime(
                controller:
                    setleadreminderprovider.reminderdatetimeController,
                hintText: "Select date",
                labelText: "Date to be Notified",
                isMandatory: false,
              ),
              const SizedBox(height: 6),
                 CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Set Reminter To",
                items: setleadreminderprovider.remindersto,
                selectedValue: setleadreminderprovider.selectedremindersto,
                onChanged: setleadreminderprovider.setSelecteremindersdo,
                hintText: "Set Reminter To",
              ),
                            const SizedBox(height: 6),

                  CustomLargeTextField(
                  controller: setleadreminderprovider.descriptionController,
                  hintText: "Enter description",
                  labelText: "Description",
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                      Row(
                children: [
                  Checkbox(
                    value: setleadreminderprovider.sendemailforreminder,
                    onChanged: (bool? value) {
                      setleadreminderprovider.setsendemailforreminder(value ?? false);
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Send also an email for this reminder",
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

                    const SizedBox(height: 30),
              
              
            ],
          ),
        ),
      ),
    );
    
  }
}