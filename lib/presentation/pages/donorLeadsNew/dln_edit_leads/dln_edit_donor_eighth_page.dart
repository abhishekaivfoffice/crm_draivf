import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_add_donor_fourth_page.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';

import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNEditDonorDetailsEighthhScreen extends StatefulWidget {
  DLNEditDonorDetailsEighthhScreen({super.key});

  @override
  State<DLNEditDonorDetailsEighthhScreen> createState() => _DLNEditDonorDetailsEighthhScreenState();
}

class _DLNEditDonorDetailsEighthhScreenState extends State<DLNEditDonorDetailsEighthhScreen> {
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

      appBar: CustomAppBar(title: "DLN Edit Donor Lead 8th screen"),

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
                      "8 Clinical Details",
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
                        //PAN CARD
                        CustomTextField(
                          controller:
                              addleadprovider.ivfDashboadNotesController,
                          hintText: "Enter IVF Dashboard Notes",
                          labelText: "IVF Dashboard Notes",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "OPU Summary",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedOpuSummary,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setOpuSummary(file);
                            }
                          },
                        ),
                        const SizedBox(height: 6),

                        // Intra-Op Details
                        CustomTextField(
                          controller: addleadprovider.intraOpDetailsController,
                          hintText: "Enter Intra-Op Details",
                          labelText: "Intra-Op Details",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        //Post-Op Details
                        CustomTextField(
                          controller: addleadprovider.postOpDetailsController,
                          hintText: "Enter Post-Op Details",
                          labelText: "Post-Op Details",
                          isMandatory: false,
                        ),
                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Prescriptions",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedPrescriptions,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setPrescriptions(file);
                            }
                          },
                        ),

                        const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Embryo Summary",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedEmbryoSummary,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setEmbryoSummary(file);
                            }
                          },
                        ),
                           const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Reports",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedReports,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setReports(file);
                            }
                          },
                        ),
                         const SizedBox(height: 6),
                        CustomFileChooserField(
                          labelText: "Insurance Claim",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedInsuranceClain,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setInsuranceClaim(file);
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
                                          DLNAddDonorDetailsFourthScreen(),
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
