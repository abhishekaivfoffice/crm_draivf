import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/AppImages.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/assigned_member_profile/assigned_member_profile/assigned_member_profile.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/activity_log_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/attachment_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/call_recordings_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/email_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/marketing_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/notes_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/payment_links_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/profile_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/reminders_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/sms_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/profile_tabs/task_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_activity_log_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_attachment_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_call_recordings_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_email_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_marketing_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_notes_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_payment_links_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_profile_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_reminders_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_sms_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_profile_tabs/jl_task_tabs.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';

import 'package:crm_draivfmobileapp/widgets/custom_popup/custom_confirm_dialogue.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//////////////////////////////////////job lead profile detailed page///////////////

class JOBLeadDataProfile extends StatelessWidget {
  final User user;
  const JOBLeadDataProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 30;
    double borderWidth = 2;
    double overlap = 40;
    int count = user.assignedMembers.length;

    double totalWidth =
        (avatarRadius * 2 + borderWidth * 2) + (overlap * (count - 1));
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "JOB LEAD Data detailed page"),
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
                    Text(
                      "${user.id}",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 16,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    Text(
                      "${user.name}",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 22,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                                              (_) => AssignedMemberDetails(
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

                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomGradientButton(
                              icon: Icons.edit,
                              height: 40,
                              text: "Edit",
                              textStyle: TextStyle(
                                fontFamily: AppFonts.poppins,
                                color: AppColor.whiteColor,
                              ),
                              gradientColors: [
                                Color(0xFF6A85B6), // soft blue
                                Color(0xFFBAC8E0), // light grayish blue
                              ],
                              onPressed: () {
                                Get.toNamed(AppRoutes.jleditLeadScreen);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: CustomGradientButton(
                              icon: Icons.delete,

                              height: 40,
                              text: "Delete",
                              textStyle: TextStyle(
                                fontFamily: AppFonts.poppins,
                                color: AppColor.whiteColor,
                              ),
                              gradientColors: [
                                Color(0xFFEB3349), // bright red
                                Color(0xFFF45C43), // orange-red
                              ],
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 8),

              // TabBar + TabBarView
              DefaultTabController(
                length: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TabBar(
                      isScrollable: true,
                      labelColor: AppColor.primaryColor2,

                      unselectedLabelColor: Colors.grey,
                      indicatorColor: AppColor.primaryColor1,
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      tabs: [
                        Tab(text: " Profile "),
                        Tab(text: "   Task   "),
                        Tab(text: "Attachments"),
                        Tab(text: " Reminders "),
                        Tab(text: "Payment Links"),
                        Tab(text: "  Notes  "),
                        Tab(text: "Activity Log"),
                        Tab(text: "Marketing"),
                        Tab(text: "Call Recordings"),
                        Tab(text: "   Sms   "),
                        Tab(text: "   Email   "),
                      ],
                    ),

                    Builder(
                      builder: (context) {
                        final TabController tabController =
                            DefaultTabController.of(context)!;

                        return AnimatedBuilder(
                          animation: tabController,
                          builder: (context, _) {
                            return IndexedStack(
                              index: tabController.index,
                              children: [
                                // Tab 1
                                JLProfileTabs(user: user),
                                // Tab 2
                                 JLTaskTabs(),
                                // Tab 3
                                 JLAttachmentTabs(),
                                //tab 4
                                 JLRemindersTab(),
                                //tab 5
                                 JLPaymentLinksTab(),
                                //tab 6
                                 JLNotesTab(),
                                //tab 7
                                 JLActivityLogTabs(),
                                //tab 8
                                 JLMarketingTabs(),
                                //tab 9
                                 JLCallRecordingTabs(),
                                //tab 10
                                 JLSmsTab(),
                                //tab 11
                                 JLEmailTabs(),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              // ],
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
