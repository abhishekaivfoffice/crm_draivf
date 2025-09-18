import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_add_donor_third_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_edit_leads/dln_edit_donor_third_page.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';

import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNEditDonorDetailsSecondScreen extends StatefulWidget {
  DLNEditDonorDetailsSecondScreen({super.key});

  @override
  State<DLNEditDonorDetailsSecondScreen> createState() => _DLNEditDonorDetailsSecondScreenState();
}

class _DLNEditDonorDetailsSecondScreenState extends State<DLNEditDonorDetailsSecondScreen> {
  final _addleadformKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    /// Load dummy lead data into provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DLNAddLeadsProvider>(context, listen: false).loadDummyLead();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addleadprovider = Provider.of<DLNAddLeadsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "DLN Edit Donor Lead 2nd screen"),

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
                                      Text("2 Donor Basic Details",style: TextStyle(color: AppColor.blackColor,fontSize: 18,fontWeight: FontWeight.bold),),
                        Divider(color: AppColor.primaryColor2,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),

                        CustomTextField(
                          controller: addleadprovider.donornameController,
                          hintText: "Enter donor name",
                          labelText: "Donor Name",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),

                        CustomTextField(
                          controller: addleadprovider.donorageController,
                          hintText: "Enter age",
                          labelText: "Age",
                          isMandatory: false,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: addleadprovider.isEggDonor,
                              onChanged: (bool? value) {
                                addleadprovider.setIsEggDonor(value ?? false);
                              },
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              activeColor: AppColor.primaryColor2,
                              checkColor: Colors.white,
                            ),

                            const Text(
                              "Egg Donor",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins,
                                color: AppColor.blackColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Checkbox(
                              value: addleadprovider.isSpermDonor,
                              onChanged: (bool? value) {
                                addleadprovider.setIsSpermDonor(value ?? false);
                              },
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              activeColor: AppColor.primaryColor2,
                              checkColor: Colors.white,
                            ),

                            const Text(
                              "Sperm Donor",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Wife Photo",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedWifeImage,
                          allowedExtensions: ["png", "jpg", "jpeg"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setWifeImage(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Aadhar(Wife)",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedWifeImage,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setWifeImage(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Husband Photo",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedHusbandImage,
                          allowedExtensions: ["png", "jpg", "jpeg"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setHusbandImage(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        CustomFileChooserField(
                          labelText: "Aadhar(Husband)",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedWifeImage,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setHusbandAadharImage(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        CustomFileChooserField(
                          labelText: "Marriage Certificate",
                          isMandatory: false,
                          selectedFile:
                              addleadprovider.selectedMarriageCertificate,
                          allowedExtensions: ["pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setMarriageCertificate(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        CustomFileChooserField(
                          labelText: "Divorce Certificate(if any)",
                          isMandatory: false,
                          selectedFile:
                              addleadprovider.selectedDivorceCertificate,
                          allowedExtensions: ["pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setDivorceCertificate(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        CustomFileChooserField(
                          labelText: "Birth Certificate",
                          isMandatory: false,
                          selectedFile:
                              addleadprovider.selectedBirthCertificate,
                          allowedExtensions: ["pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setBirthCertificate(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        CustomFileChooserField(
                          labelText: "Insurance Details",
                          isMandatory: false,
                          selectedFile:
                              addleadprovider.selectedInsuranceDetails,
                          allowedExtensions: ["pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setInsuranceDetails(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        CustomLargeTextField(
                          controller:
                              addleadprovider.detailsofPreviousChildController,
                          hintText: "Enter Details of Previous Children",
                          labelText: "Details of Previous Children",
                          isMandatory: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomGradientButton(
                            text: "Previous",
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
                            text: "Next",
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.poppins,
                              color: AppColor.blackColor,
                            ),
                            gradientColors: [
                              Color(0xFF64B5F6), // light blue
                              Color(0xFF2196F3), // bright blue
                            ],
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          DLNEditDonorDetailsThirdScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12), // space between buttons

                        Expanded(
                          child: CustomGradientButton(
                            text: "Save Donor",
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
