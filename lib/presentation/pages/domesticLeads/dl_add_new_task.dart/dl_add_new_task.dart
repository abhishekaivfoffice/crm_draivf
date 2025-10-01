import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/add_new_task_provider.dart';
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

class DLAddNewTask extends StatelessWidget {
  const DLAddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    final addnewtaskprovider = Provider.of<AddNewTaskProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: " domestic lead Add New Task"),
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
                    value: addnewtaskprovider.ispublic,
                    onChanged: (bool? value) {
                      addnewtaskprovider.setispublic(value ?? false);
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
                controller: addnewtaskprovider.subjectController,
                hintText: "Enter subject",
                labelText: "Subject",
                isMandatory: true,
              ),
              const SizedBox(height: 6),
                CustomFileChooserField(
                  labelText: "Choose File",
                  isMandatory: true,
                  selectedFile: addnewtaskprovider.selectedFile,
                  allowedExtensions: ["csv","Pdf"], //  pass dynamically
                  onFilePicked: (file) {
                    if (file != null) {
                      addnewtaskprovider.setFile(file);
                    }
                  },
                ),
                const SizedBox(height: 6),
              //start date
              CustomDateField(
                controller: addnewtaskprovider.startDateController,
                hintText: "Select start date",
                labelText: "Start Date",
                isMandatory: false,
              ),
              const SizedBox(height: 6),
              //DUE date
              CustomDateField(
                controller: addnewtaskprovider.dueDateController,
                hintText: "Select due date",
                labelText: "Due Date",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Priority",
                items: addnewtaskprovider.priority,
                selectedValue: addnewtaskprovider.selectedpriority,
                onChanged: addnewtaskprovider.setSelectedpriority,
                hintText: "Priority",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Repeat  every",
                items: addnewtaskprovider.repeateveryoptions,
                selectedValue: addnewtaskprovider.selectedrepeateveryoption,
                onChanged: addnewtaskprovider.setSelectedrepeateveryoption,
                hintText: "Repeat Every",
              ),
              ///////////////////////////////////////////////////////if custom selecetd//////////////////////
              const SizedBox(height: 6),
              if (addnewtaskprovider.isCustomSelected) ...[
                //new integer
                CustomTextField(
                  controller: addnewtaskprovider.repeateverycountController,
                  hintText: "Enter custom value",
                  labelText: "Custom Value",
                  isMandatory: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: true,
                  labelText: "Custom data",
                  items: addnewtaskprovider.repeateverycustomoptions,
                  selectedValue:
                      addnewtaskprovider.selectedrepeateverycustomoption,
                  onChanged:
                      addnewtaskprovider.setSelectedrepeateverycustomoption,
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
                          controller: addnewtaskprovider.totalCyclesController,
                          enabled:
                              !addnewtaskprovider
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
                            value: addnewtaskprovider.isInfinity,
                            onChanged: addnewtaskprovider.toggleInfinity,
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
                items: addnewtaskprovider.leadsoptions,
                selectedValue: addnewtaskprovider.selectedleadsoption,
                onChanged: addnewtaskprovider.setSelectedLeadsOption,
                hintText: "0",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Assignees",
                items: addnewtaskprovider.assigneeoptions,
                selectedValue: addnewtaskprovider.selectedassigneeoption,
                onChanged: addnewtaskprovider.setSelectedAssigneeOption,
                hintText: "Select Assignees",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: false,
                labelText: "Followers",
                items: addnewtaskprovider.followeroptions,
                selectedValue: addnewtaskprovider.selectedfolloweroption,
                onChanged: addnewtaskprovider.setSelectedFollowerOption,
                hintText: "Select followers",
              ),
              const SizedBox(height: 6),
              CustomMultiSelectField(
                labelText: "Tag",
                options: addnewtaskprovider.tags,
                selectedItems: addnewtaskprovider.selectedTags,
                onItemToggle: (val) => addnewtaskprovider.toggleItem(val),
              ),
              const SizedBox(height: 6),
   CustomLargeTextField(
                  controller: addnewtaskprovider.taskDescriptionController,
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
