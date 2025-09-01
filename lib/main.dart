import 'package:crm_draivfmobileapp/controller/ui_controllers/appbar_controllers.dart';
import 'package:crm_draivfmobileapp/core/routes/app_route_observer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/core/utils/helper_utils.dart';
import 'package:crm_draivfmobileapp/presentation/page_not_found/page_not_found.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/camp_management_screens/camp_home_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/camp_zone_userdetails_screen/camp_userdetails_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/new_comp_add/new_camp_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/dashborad_chart_provider/chart1_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_home/dashboard_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/add_leads/add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/add_leads/add_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/assigned_member_profile/assigned_member_profile/assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/assigned_member_profile/assigned_member_profile_edit/assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/assigned_member_profile/assigned_member_profile_edit/assigned_member_profile_edithome.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/bulk_action/bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/domestic_leads_data.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_leads_data/domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/import_leads/import_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/import_leads/import_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/enquiry/convert_screen/convert_screen_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/enquiry/edit_enquiry/edit_enquiry_provider_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/enquiry/enquiry_main_home/enquiry_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/enquiry/enquiry_home/add_new_enquiry/add_enquiry_provider.dart';

import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/add_international_leads/add_international_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/add_international_leads/add_international_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/import_international_leads/import_international_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/import_international_leads/import_international_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_bulk_action/international_leads_bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_leads_data/International_leads_data_provider.dart';

import 'package:crm_draivfmobileapp/presentation/pages/enquiry/enquiry_main_home/home_enquiry_provider.dart';

import 'package:crm_draivfmobileapp/presentation/pages/login/login_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/login/login_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/splash_screen/splash_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/teleDashboard/teledashboard_home/teledashboard_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
  Get.lazyPut<AppBarController>(() => AppBarController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AddLeadsProvider()),
        ChangeNotifierProvider(create: (_) => ImportLeadsProvider()),
        // ChangeNotifierProvider(create: (_) => DomesticLeadsHomeprovider()),
        ChangeNotifierProvider(create: (_) => DomesticLeadsDataProvider()),

        ChangeNotifierProvider(create: (_) => Chart1Provider()),
        ChangeNotifierProvider(create: (_) => AddEnquiryProvider()),
        ChangeNotifierProvider(create: (_) => HomeEnquiryProvider()),
        ChangeNotifierProvider(create: (_) => AssignedMemberProfileProvider()),

        //////////////international leads provider
        ChangeNotifierProvider(create: (_) => AddInternationalLeadsProvider()),
        ChangeNotifierProvider(
          create: (_) => ImportInternationalLeadsProvider(),
        ),
        ChangeNotifierProvider(create: (_) => InternationalLeadsDataProvider()),


        ChangeNotifierProvider(create: (_) => AssignedMemberProfileProvider()),

        ChangeNotifierProvider(
          create: (_) => AssignedMemberProfileEditProvider(),
        ),
        ChangeNotifierProvider(create: (_) => EditEnquiryProvider()),
        ChangeNotifierProvider(create: (_) => ConvertScreenProvider()),
        ChangeNotifierProvider(create: (_) => NewCampProvider()),
        ChangeNotifierProvider(create: (_) => CampUserDetailsProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRM DraivF',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFFF2F2F2),
          ),
        ),

        navigatorObservers: [AppRouteObserver()],
        initialRoute: "/splashscreen",
        onGenerateRoute: (settings) {
          String routeName = settings.name ?? '';
          routeName = HelperUtil.normalizeUrl(routeName);

          if (HelperUtil.isValidStaticRoute(routeName)) {
            return GetPageRoute(
              settings: settings,
              page: () => _getStaticPage(routeName),
            );
          }

          return GetPageRoute(
            settings: settings,
            page: () => const NotFoundPage(),
          );
        },
      ),
    );
  }

  Widget _getStaticPage(String routeName) {
    switch (routeName) {
      case AppRoutes.splashScreen:
        return SplashScreen();
      case AppRoutes.loginScreen:
        return LoginScreen();
      case AppRoutes.domesticLeadHome:
        return DomesticLeadsHome();
      case AppRoutes.addLeadScreen:
        return AddLeadScreen();
      case AppRoutes.importLeadScreen:
        return ImportLeads();
      case AppRoutes.testScreen:
        return const DomesticLeadsData();
      case AppRoutes.bulkActionScreen:
        return const BulkActionPage();
      case AppRoutes.dashboardScreen:
        return const DashboardScreen();
      case AppRoutes.teledashboardScreen:
        return const TeleDashboradScreen();

      case AppRoutes.enquiryHome:
        return EnquiryHome();


      case AppRoutes.assignedMemberProfileedithome:
        return const AssignedMemberProfileEditHome();
      case AppRoutes.internationalLeadHome:
        return InternationalLeadsHome();
         case AppRoutes.addInternationalLeadScreen:
        return AddInternationalLeads();
         case AppRoutes.internationalLeadBulkActionScreen:
        return InternationalLeadsBulkActionPage();
                case AppRoutes.importInternationalLeadScreen:
        return ImportInternationalLeads();

    
      case AppRoutes.assignedMemberProfileedithome:
        return const AssignedMemberProfileEditHome();
      case AppRoutes.campHome:
        return const CampHomeScreen();


      case AppRoutes.notFoundScreen:
        return const NotFoundPage();

      default:
        return const NotFoundPage();
    }
  }
}
