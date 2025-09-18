import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_add_donor_sixth_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_edit_leads/dln_edit_donor_sixth_page.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DLNEditDonorDetailsFifthScreen extends StatefulWidget {
  DLNEditDonorDetailsFifthScreen({super.key});

  @override
  State<DLNEditDonorDetailsFifthScreen> createState() => _DLNEditDonorDetailsFifthScreenState();
}

class _DLNEditDonorDetailsFifthScreenState extends State<DLNEditDonorDetailsFifthScreen> {
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

      appBar: CustomAppBar(title: "DLN Edit Donor Lead 5th page"),

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
                      "5 Legal & Consent",
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
                        //Informed Consent
                        CustomFileChooserField(
                          labelText: "Informed Consent",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedInformedConcent,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setInformedConcent(file);
                            }
                          },
                        ),
                          const SizedBox(height: 6),
                        //ART Donor Consent
                        CustomFileChooserField(
                          labelText: "ART Donor Consent",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedArtDonorConcent,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setARTDonorConcent(file);
                            }
                          },
                        ),
                          const SizedBox(height: 6),
                        //ART Donor Bond
                        CustomFileChooserField(
                          labelText: "ART Donor Bond",
                          isMandatory: false,
                          selectedFile: addleadprovider.selectedArtDonorBond,
                          allowedExtensions: ["png", "jpg", "jpeg", "pdf"],
                          onFilePicked: (file) {
                            if (file != null) {
                              addleadprovider.setARTDonorBond(file);
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
                              Color(0xFF64B5F6),
                              Color(0xFF2196F3), 
                            ],
                            onPressed: () {
                                    Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          DLNEditDonorDetailsSixthScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),

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
