import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_new_task_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/multiselect_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNAddNewTaskPage extends StatelessWidget {
  const DLNAddNewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dlnaddnewtaskprovider = Provider.of<DLNAddNewTaskProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: "DLN Add New Task"),
      drawer: TabletMobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: dlnaddnewtaskprovider.ispublic,
                    onChanged: (bool? value) {
                      dlnaddnewtaskprovider.setispublic(value ?? false);
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
                ],
              ),
              const SizedBox(height: 6),

              //subject
              CustomTextField(
                controller: dlnaddnewtaskprovider.subjectController,
                hintText: "Enter subject",
                labelText: "Subject",
                isMandatory: true,
              ),
              const SizedBox(height: 6),
                CustomFileChooserField(
                  labelText: "Choose File",
                  isMandatory: true,
                  selectedFile: dlnaddnewtaskprovider.selectedFile,
                  allowedExtensions: ["csv","Pdf"], //  pass dynamically
                  onFilePicked: (file) {
                    if (file != null) {
                      dlnaddnewtaskprovider.setFile(file);
                    }
                  },
                ),
                const SizedBox(height: 6),
              //start date
              CustomDateField(
                controller: dlnaddnewtaskprovider.startDateController,
                hintText: "Select start date",
                labelText: "Start Date",
                isMandatory: false,
              ),
              const SizedBox(height: 6),
              //DUE date
              CustomDateField(
                controller: dlnaddnewtaskprovider.dueDateController,
                hintText: "Select due date",
                labelText: "Due Date",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Priority",
                items: dlnaddnewtaskprovider.priority,
                selectedValue: dlnaddnewtaskprovider.selectedpriority,
                onChanged: dlnaddnewtaskprovider.setSelectedpriority,
                hintText: "Priority",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Repeat  every",
                items: dlnaddnewtaskprovider.repeateveryoptions,
                selectedValue: dlnaddnewtaskprovider.selectedrepeateveryoption,
                onChanged: dlnaddnewtaskprovider.setSelectedrepeateveryoption,
                hintText: "Repeat Every",
              ),
              ///////////////////////////////////////////////////////if custom selecetd//////////////////////
              const SizedBox(height: 6),
              if (dlnaddnewtaskprovider.isCustomSelected) ...[
                //new integer
                CustomTextField(
                  controller: dlnaddnewtaskprovider.repeateverycountController,
                  hintText: "Enter custom value",
                  labelText: "Custom Value",
                  isMandatory: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: true,
                  labelText: "Custom data",
                  items: dlnaddnewtaskprovider.repeateverycustomoptions,
                  selectedValue:
                      dlnaddnewtaskprovider.selectedrepeateverycustomoption,
                  onChanged:
                      dlnaddnewtaskprovider.setSelectedrepeateverycustomoption,
                  hintText: "Custom data",
                ),
              ],
              const SizedBox(height: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total Cycles",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      // TextField
                      Expanded(
                        child: TextField(
                          controller: dlnaddnewtaskprovider.totalCyclesController,
                          enabled:
                              !dlnaddnewtaskprovider
                                  .isInfinity, // disable if Infinity is checked
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.poppins,
                              color: AppColor.hinttextblackColor,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColor.blackColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColor.blackColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColor.primaryColor2,
                                width: 1.5,
                              ),
                            ),

                            // 👁 Add eye icon if it's a password field
                          ),

                          keyboardType: TextInputType.number,
                        ),
                      ),

                      // Checkbox
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: dlnaddnewtaskprovider.isInfinity,
                            onChanged: dlnaddnewtaskprovider.toggleInfinity,
                          ),
                          const Text("Infinity"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Lead",
                items: dlnaddnewtaskprovider.leadsoptions,
                selectedValue: dlnaddnewtaskprovider.selectedleadsoption,
                onChanged: dlnaddnewtaskprovider.setSelectedLeadsOption,
                hintText: "0",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Assignees",
                items: dlnaddnewtaskprovider.assigneeoptions,
                selectedValue: dlnaddnewtaskprovider.selectedassigneeoption,
                onChanged: dlnaddnewtaskprovider.setSelectedAssigneeOption,
                hintText: "Select Assignees",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Followers",
                items: dlnaddnewtaskprovider.followeroptions,
                selectedValue: dlnaddnewtaskprovider.selectedfolloweroption,
                onChanged: dlnaddnewtaskprovider.setSelectedFollowerOption,
                hintText: "Select followers",
              ),
              const SizedBox(height: 6),
              CustomMultiSelectField(
                labelText: "Tag",
                options: dlnaddnewtaskprovider.tags,
                selectedItems: dlnaddnewtaskprovider.selectedTags,
                onItemToggle: (val) => dlnaddnewtaskprovider.toggleItem(val),
              ),
              const SizedBox(height: 6),
   CustomLargeTextField(
                  controller: dlnaddnewtaskprovider.taskDescriptionController,
                  hintText: "Add Description",
                  labelText: "Task Description",
                  isMandatory: false,
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
