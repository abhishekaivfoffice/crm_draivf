import 'package:crm_draivfmobileapp/core/components/drawer/drawer_button.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../presentation/pages/enquiry/enquiry_main_home/enquiry_home.dart';

class TabletMobileDrawer extends StatelessWidget {
  const TabletMobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double navItemFontSize = 18;

    return Drawer(
      // This makes the drawer full width
      child: SizedBox(
        width: screenWidth,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [AppColor.primaryColor1, AppColor.primaryColor2],

            // ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Social Media Icons
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle tap here
                          Scaffold.of(context).closeEndDrawer();
                        },
                        child: Image.network(
                          AppImages.logo,
                          height: 28,
                          width: 28,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder:
                              (context, error, stackTrace) => Image.asset(
                                AppImages.logo,
                                fit: BoxFit.cover,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabletAppbarNavigationBtn(
                          leadingicon: Icons.dashboard,
                          title: 'DashBoard',
                          targetPage: AppRoutes.dashboardScreen,
                          fontSize: navItemFontSize,
                        ),
                        TabletAppbarNavigationBtn(
                          leadingicon: Icons.call,
                          title: 'Tele Dashboard',
                          targetPage: AppRoutes.teledashboardScreen,
                          fontSize: navItemFontSize,
                        ),
                        // TabletAppbarNavigationBtn(
                        //   leadingicon: Icons.api,

                        //   title: 'Tele Api Dashboard',
                        //   targetPage: AppRoutes.notFoundScreen,
                        //   fontSize: navItemFontSize,
                        // ),
                        TabletAppbarNavigationBtn(
                          leadingicon: Icons.home_work,
                          title: 'Domestic Leads',
                          targetPage: AppRoutes.domesticLeadHome,
                          fontSize: navItemFontSize,
                        ),
                          TabletAppbarNavigationBtn(
                          leadingicon: Icons.done_outline_rounded,
                          title: 'Donor Leads New',
                          targetPage: AppRoutes.donorLeadNewHome,
                          fontSize: navItemFontSize,
                        ),
                         TabletAppbarNavigationBtn(
                          leadingicon: Icons.flight,
                          title: 'International Leads',
                          targetPage: AppRoutes.internationalLeadHome,
                          fontSize: navItemFontSize,
                        ),
                           TabletAppbarNavigationBtn(
                          leadingicon: Icons.nat_outlined,
                          title: 'Job Leads',
                          targetPage: AppRoutes.jobLeadHome ,
                          fontSize: navItemFontSize,
                        ),
                          TabletAppbarNavigationBtn(
                          leadingicon: Icons.nat_outlined,
                          title: 'Job Leads New',
                          targetPage: AppRoutes.jobLeadNewHome ,
                          fontSize: navItemFontSize,
                        ),
                          TabletAppbarNavigationBtn(
                          leadingicon: Icons.nat_outlined,
                          title: 'Course',
                          targetPage: AppRoutes.courseLeadHome ,
                          fontSize: navItemFontSize,
                        ),
                        TabletAppbarNavigationBtn(
                          leadingicon: Icons.home_work,
                          title: 'Enquiry',
                          targetPage: AppRoutes.enquiryHome,
                          fontSize: navItemFontSize,
                        ),
                        TabletAppbarNavigationBtn(
                          leadingicon: Icons.campaign,
                          title: 'Camp Management',
                          targetPage: AppRoutes.campHome,
                          fontSize: navItemFontSize,
                        ),
                       
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
