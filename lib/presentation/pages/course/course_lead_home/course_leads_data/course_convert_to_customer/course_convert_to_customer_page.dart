import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//course lead  convert to customer page
class CourseConvertToCustomerPage extends StatelessWidget {
  const CourseConvertToCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final converttocustomerprovider = Provider.of<InlConvertToCustomerProvider>(
      context,
    );
    return Scaffold(
      appBar: CustomAppBar(title: " course convert to customer"),
      drawer: TabletMobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),

              //first name
              CustomTextField(
                controller: converttocustomerprovider.firstNameController,
                hintText: "Enter first name",
                labelText: "First Name",
                isMandatory: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),

              //last name
              CustomTextField(
                controller: converttocustomerprovider.lastNameController,
                hintText: "Enter last name",
                labelText: "Last Name",
                isMandatory: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),

              //position
              CustomTextField(
                controller: converttocustomerprovider.positionController,
                hintText: "Enter position",
                labelText: "Position",
                isMandatory: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),
              //email
              CustomTextField(
                controller: converttocustomerprovider.emailController,
                hintText: "Enter email",
                labelText: "Email",
                isMandatory: true,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 6),
              //company
              CustomTextField(
                controller: converttocustomerprovider.companyController,
                hintText: "Enter company",
                labelText: "Company",
                isMandatory: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),
              //phone
              CustomTextField(
                controller: converttocustomerprovider.phoneController,
                hintText: "Enter phone",
                labelText: "Phone",
                isMandatory: false,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 6),
              //phone
              CustomTextField(
                controller: converttocustomerprovider.phoneController,
                hintText: "Enter phone",
                labelText: "Phone",
                isMandatory: false,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 6),

              //website
              CustomTextField(
                controller: converttocustomerprovider.websiteController,
                hintText: "Enter website",
                labelText: "Website",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //address
              CustomLargeTextField(
                controller: converttocustomerprovider.addressController,
                hintText: "Enter address",
                labelText: "Address",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //city
              CustomTextField(
                controller: converttocustomerprovider.cityController,
                hintText: "Enter city",
                labelText: "City",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //state
              CustomTextField(
                controller: converttocustomerprovider.stateController,
                hintText: "Enter state",
                labelText: "State",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //country
              CustomTextField(
                controller: converttocustomerprovider.countryController,
                hintText: "Enter country",
                labelText: "Country",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //zipcode
              CustomTextField(
                controller: converttocustomerprovider.zipcodeController,
                hintText: "Enter zipcode",
                labelText: "Zipcode",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //password
              CustomTextField(
                controller: converttocustomerprovider.passwordController,
                hintText: "Enter password",
                labelText: "Password",
                isMandatory: true,
                obscureText: true,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(
                    value: converttocustomerprovider.sendSetPasswordEmail,
                    onChanged: (bool? value) {
                      converttocustomerprovider.setSendsetPasswordEmail(
                        value ?? false,
                      );
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Send SET password email",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.poppins,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(
                    value: converttocustomerprovider.notSendWelcomeEmailEmail,
                    onChanged: (bool? value) {
                      converttocustomerprovider.setNotsendWelcomeEmail(
                        value ?? false,
                      );
                    },
                    side: const BorderSide(color: Colors.black, width: 2),
                    activeColor: AppColor.primaryColor2,
                    checkColor: Colors.white,
                  ),

                  const Text(
                    "Do not send welcome email",
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
