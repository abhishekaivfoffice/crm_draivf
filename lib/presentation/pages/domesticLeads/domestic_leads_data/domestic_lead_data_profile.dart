import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/AppImages.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/assigned_member_profile/assigned_member_profile/assigned_member_profile.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/activity_log_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/attachment_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/call_recordings_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/email_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/marketing_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/notes_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/payment_links_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/profile_tabs.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/reminders_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/sms_tab.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/profile_tabs/task_tabs.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_icon_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/edit_delete_view_buttons.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/upload_box.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row_without_icon.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//////////////////////////////////////domestic lead profile detailed page///////////////

class DomesticLeadDataProfile extends StatelessWidget {
  final User user;
  const DomesticLeadDataProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final domesticleaddataprofileprovider =
        Provider.of<DomesticLeadsDataProvider>(context);
    double avatarRadius = 30;
    double borderWidth = 2;
    double overlap = 40; // space between avatars
    int count = user.assignedMembers.length;

    // total width = first avatar full + (overlap for remaining avatars)
    double totalWidth =
        (avatarRadius * 2 + borderWidth * 2) + (overlap * (count - 1));
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Data detailed page"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // View Button
                        CustomMenuButton(
                          icon: Icons.visibility,
                          label: "View",
                          onTap: () {},
                          containerColor: Colors.green.shade100,
                          borderColor: Colors.green.shade300,
                          iconColor: Colors.green.shade800,
                          textColor: Colors.green.shade800,
                        ),
                        const SizedBox(width: 8),
                        CustomMenuButton(
                          icon: Icons.edit,
                          label: "Edit",
                          onTap: () {},
                          containerColor: Colors.blue.shade100,
                          borderColor: Colors.blue.shade300,
                          iconColor: Colors.blue.shade800,
                          textColor: Colors.blue.shade800,
                        ),
                        const SizedBox(width: 8),

                        // Delete Button
                        CustomMenuButton(
                          icon: Icons.delete,
                          label: "Delete",
                          onTap: () {},
                          containerColor: Colors.red.shade100,
                          borderColor: Colors.red.shade300,
                          iconColor: Colors.red.shade800,
                          textColor: Colors.red.shade800,
                        ),
                      ],
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
                      // 👇 Add custom text styles
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      tabs: [
                        Tab(text: " Overview "),
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

                    // 👇 This listens to TabController changes
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
                                ProfileTabs(user: user),

                                /////////////////////// Tab 2//////////////////////////////
                                TaskTabs(),

                                //////////////////////////// Tab 3////////////////////////////
                                AttachmentTabs(),
                                ///////////////tab 4 ////////////////////////
                                RemindersTab(),
                                ///////////tab 5 ///////////////////////////////////
                                PaymentLinksTab(),

                                ///////////tab 6 ///////////////////////////////////
                                NotesTab(),

                                ///////////tab 7 ///////////////////////////////////
                                ActivityLogTabs(),

                                ///////////tab 8 ///////////////////////////////////
                                MarketingTabs(),
                                ///////////tab 9 ///////////////////////////////////
                                CallRecordingTabs(),
                                ///////////tab 10 ///////////////////////////////////
                                SmsTab(),
                                ///////////tab 11 ///////////////////////////////////
                                EmailTabs(),
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
