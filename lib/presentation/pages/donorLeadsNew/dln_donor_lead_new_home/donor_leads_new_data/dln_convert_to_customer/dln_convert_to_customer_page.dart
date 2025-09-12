import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNConvertToCustomerPage extends StatelessWidget {
  const DLNConvertToCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dlnconverttocustomerprovider = Provider.of<DLNConvertToCustomerProvider>(
      context,
    );
    return Scaffold(
      appBar: CustomAppBar(title: "DLN convert to customer"),
      drawer: TabletMobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),

              //first name
              CustomTextField(
                controller: dlnconverttocustomerprovider.firstNameController,
                hintText: "Enter first name",
                labelText: "First Name",
                isMandatory: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),

              //last name
              CustomTextField(
                controller: dlnconverttocustomerprovider.lastNameController,
                hintText: "Enter last name",
                labelText: "Last Name",
                isMandatory: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),

              //position
              CustomTextField(
                controller: dlnconverttocustomerprovider.positionController,
                hintText: "Enter position",
                labelText: "Position",
                isMandatory: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),
              //email
              CustomTextField(
                controller: dlnconverttocustomerprovider.emailController,
                hintText: "Enter email",
                labelText: "Email",
                isMandatory: true,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 6),
              //company
              CustomTextField(
                controller: dlnconverttocustomerprovider.companyController,
                hintText: "Enter company",
                labelText: "Company",
                isMandatory: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 6),
              //phone
              CustomTextField(
                controller: dlnconverttocustomerprovider.phoneController,
                hintText: "Enter phone",
                labelText: "Phone",
                isMandatory: false,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 6),
              //phone
              CustomTextField(
                controller: dlnconverttocustomerprovider.phoneController,
                hintText: "Enter phone",
                labelText: "Phone",
                isMandatory: false,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 6),

              //website
              CustomTextField(
                controller: dlnconverttocustomerprovider.websiteController,
                hintText: "Enter website",
                labelText: "Website",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //address
              CustomLargeTextField(
                controller: dlnconverttocustomerprovider.addressController,
                hintText: "Enter address",
                labelText: "Address",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //city
              CustomTextField(
                controller: dlnconverttocustomerprovider.cityController,
                hintText: "Enter city",
                labelText: "City",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //state
              CustomTextField(
                controller: dlnconverttocustomerprovider.stateController,
                hintText: "Enter state",
                labelText: "State",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //country
              CustomTextField(
                controller: dlnconverttocustomerprovider.countryController,
                hintText: "Enter country",
                labelText: "Country",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //zipcode
              CustomTextField(
                controller: dlnconverttocustomerprovider.zipcodeController,
                hintText: "Enter zipcode",
                labelText: "Zipcode",
                isMandatory: false,
              ),
              const SizedBox(height: 6),

              //password
              CustomTextField(
                controller: dlnconverttocustomerprovider.passwordController,
                hintText: "Enter password",
                labelText: "Password",
                isMandatory: true,
                obscureText: true,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(
                    value: dlnconverttocustomerprovider.sendSetPasswordEmail,
                    onChanged: (bool? value) {
                      dlnconverttocustomerprovider.setSendsetPasswordEmail(
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
                    value: dlnconverttocustomerprovider.notSendWelcomeEmailEmail,
                    onChanged: (bool? value) {
                      dlnconverttocustomerprovider.setNotsendWelcomeEmail(
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
