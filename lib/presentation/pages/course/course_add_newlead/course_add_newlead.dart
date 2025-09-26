import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/course_provider/course_add_lead_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//course lead -add lead screen
class CourseAddNewlead extends StatelessWidget {
  CourseAddNewlead({super.key});
  final _addleadformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final courseaddleadprovider = Provider.of<CourseAddLeadProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Add Course Leads"),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _addleadformKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        CustomTextField(
                          controller: courseaddleadprovider.nameController,
                          hintText: "Enter name",
                          labelText: "Name",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),
                        //email
                        CustomTextField(
                          controller: courseaddleadprovider.emailController,
                          hintText: "Enter email",
                          labelText: "Email",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),
                        //phone
                        CustomTextField(
                          controller: courseaddleadprovider.phoneController,
                          hintText: "Enter phone",
                          labelText: "Phone",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),

                        //qualification
                        CustomTextField(
                          controller:
                              courseaddleadprovider.qualificationController,
                          hintText: "Enter qualification",
                          labelText: "Qualification",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),
                        //employee id
                        CustomTextField(
                          controller:
                              courseaddleadprovider.employeeidController,
                          hintText: "Enter employee id",
                          labelText: "Employee ID",
                          isMandatory: true,
                        ),
                        const SizedBox(height: 6),
                        // location
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Location",
                          items: courseaddleadprovider.locations,
                          selectedValue: courseaddleadprovider.selectedlocation,
                          onChanged: courseaddleadprovider.setSelectedLocation,
                          hintText: "Select location",
                        ),

                        const SizedBox(height: 6),
                        //profile image
                        CustomFileChooserField(
                          labelText: "Choose Profile Image",
                          isMandatory: true,
                          selectedFile: courseaddleadprovider.selectedFile,
                          allowedExtensions: ["png,jpg,jpeg"], //  pass dynamically
                          onFilePicked: (file) {
                            if (file != null) {
                              courseaddleadprovider.setFile(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),
                        // course
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Course",
                          items: courseaddleadprovider.course,
                          selectedValue: courseaddleadprovider.selectedCourse,
                          onChanged: courseaddleadprovider.setSelectedCourse,
                          hintText: "Select course",
                        ),
                        const SizedBox(height: 6),
                        // sourse
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Source",
                          items: courseaddleadprovider.sources,
                          selectedValue: courseaddleadprovider.selectedsources,
                          onChanged: courseaddleadprovider.setSelectedsources,
                          hintText: "Select Source",
                        ),
                        const SizedBox(height: 6),
                        // Registration fees
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Registration Fee",
                          items: courseaddleadprovider.registrationFee,
                          selectedValue: courseaddleadprovider.selectedregfee,
                          onChanged: courseaddleadprovider.setSelectedregfee,
                          hintText: "Select Option",
                        ),
                        const SizedBox(height: 6),
                        // Select status
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Status",
                          items: courseaddleadprovider.status,
                          selectedValue: courseaddleadprovider.selectedstatus,
                          onChanged: courseaddleadprovider.setSelectedstat,
                          hintText: "Select Status",
                        ),
                        const SizedBox(height: 6),
                        //assisgned
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Assigned",
                          items: courseaddleadprovider.assigned,
                          selectedValue: courseaddleadprovider.selectedassigned,
                          onChanged: courseaddleadprovider.setSelectedassigned,
                          hintText: "Select Assigned",
                        ),
                        const SizedBox(height: 6),
                        //inrest status
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Interest Status",
                          items: courseaddleadprovider.interestStatus,
                          selectedValue:
                              courseaddleadprovider.selectedintereststatus,
                          onChanged:
                              courseaddleadprovider.setSelectedintereststatus,
                          hintText: "Select interest status",
                        ),
                        const SizedBox(height: 6),
                        //Loan required status
                        CustomSearchDropdownWithSearch(
                          isMandatory: false,
                          labelText: "Loan Required ",
                          items: courseaddleadprovider.loanrequired,
                          selectedValue:
                              courseaddleadprovider.selectedloanrequiredstatus,
                          onChanged:
                              courseaddleadprovider
                                  .setSelectedLoanrequiredstatus,
                          hintText: "Select option",
                        ),
                        const SizedBox(height: 6),
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
                        const SizedBox(width: 12), 
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
            ],
          ),
        ),
      ),
    );
  }
}
