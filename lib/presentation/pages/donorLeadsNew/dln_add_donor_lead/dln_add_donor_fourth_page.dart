import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_add_donor_fifth_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_date_field_with_age.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNAddDonorDetailsFourthScreen extends StatelessWidget {
  DLNAddDonorDetailsFourthScreen({super.key});
  final _addleadformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addleadprovider = Provider.of<DLNAddLeadsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "DLN Add Donor Lead 4th page"),

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
                    Text(
                      "4 Medical Reports",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: AppColor.primaryColor2),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        //TV SCAN
                        CustomFileChooserField(
                          labelText: "TV Scan (Female)",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedTvScan,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setTvScan(file);
                            }
                          },
                        ),
                        //SEMEN TEST MALE
                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Semen Test (Male)",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedSemenTest,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setSemenTest(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),
                        //SEROLOGY
                        CustomFileChooserField(
                          labelText: "Serology",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedSerology,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setSerology(file);
                            }
                          },
                        ),

                        const SizedBox(height: 6),
                          //BBT
                        CustomFileChooserField(
                          labelText: "BBT",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedbbt,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setBbt(file);
                            }
                          },
                        ),

                        const SizedBox(height: 6),
                             //TFT
                        CustomFileChooserField(
                          labelText: "TFT",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedtft,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setTft(file);
                            }
                          },
                        ),

                        const SizedBox(height: 6),
                         //Cardiac Fitness
                        CustomFileChooserField(
                          labelText: "Cardiac Fitness",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedcardiacfitness,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setCardiacFitness(file);
                            }
                          },
                        ),

                        const SizedBox(height: 6),
                          //Cardiac Fitness
                        CustomFileChooserField(
                          labelText: "ECG",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedecg,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setEcg(file);
                            }
                          },
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
                                          DLNAddDonorDetailsFifthScreen(),
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
