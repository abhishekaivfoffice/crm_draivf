import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/AppImages.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/data/models/donor_lead_new/dln_assigned_member_model.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_assigned_member_profile/dln_assigned_member_profile.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/donor_leads_new_data/dln_profile_tabs/dln_profile_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/donor_leads_new_data/dln_profile_tabs/dln_downloads_tabs.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_segment_button.dart';

import 'package:crm_draivfmobileapp/widgets/custom_popup/custom_confirm_dialogue.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//////////////////////////////////////donor lead  new profile detailed page///////////////

class DLNDonorLeadNewDataProfile extends StatelessWidget {
  final PatientRecord user;
  DLNDonorLeadNewDataProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final domestileaddataprovider = Provider.of<DLNDonorLeadsNewDataProvider>(
      context,
    );
    double avatarRadius = 30;
    double borderWidth = 2;
    double overlap = 40;
    int count = user.assignedMembers.length;
    final List<Widget> pages = [DLNProfileTabs(user: user), DlnDownloadsTabs()];
    double totalWidth =
        (avatarRadius * 2 + borderWidth * 2) + (overlap * (count - 1));
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "DLN Data detailed page"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(44, 0, 0, 0)),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder:
                                        (context) => CustomConfirmDialog(
                                          title:
                                              "Do you really want to delete the file?",
                                          message:
                                              "This action cannot be undone.",
                                          confirmText: "delete",
                                          cancelText: "Cancel",
                                          svgAsset: AppImages.binicon,
                                          onConfirm: () {
                                            Navigator.of(context).pop();
                                            // delete logic
                                          },
                                          onCancel: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(
                                    AppRoutes.dlneditDonorLeadNewScreen,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blueAccent,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Center(
                      child: SizedBox(
                        height: avatarRadius * 2 + borderWidth * 2,
                        width: totalWidth,
                        child: Stack(
                          children:
                              user.assignedMembers.asMap().entries.map((entry) {
                                int index = entry.key;
                                var m = entry.value;
                                return Positioned(
                                  left: index * overlap,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => DLNAssignedMemberDetails(
                                                member: m,
                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                            255,
                                            230,
                                            133,
                                            194,
                                          ),
                                          width: borderWidth,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: avatarRadius,
                                        backgroundImage: NetworkImage(
                                          m.profileImage,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Access / Assigned",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 14,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    Divider(color: const Color.fromARGB(44, 0, 0, 0)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${user.wifeName}",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                            fontFamily: AppFonts.poppins,
                          ),
                        ),
                        Text(
                          "ID : ${user.id}",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 16,
                            fontFamily: AppFonts.poppins,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomSegmentButton(
                          text: "Basic Details",
                          isSelected:
                              domestileaddataprovider.selectedIndex == 0,
                          onTap: () => domestileaddataprovider.setIndex(0),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomSegmentButton(
                          text: "Documents",
                          isSelected:
                              domestileaddataprovider.selectedIndex == 1,
                          onTap: () => domestileaddataprovider.setIndex(1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Display corresponding class
                  Center(child: pages[domestileaddataprovider.selectedIndex]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
