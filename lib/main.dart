import 'package:crm_draivfmobileapp/controller/ui_controllers/appbar_controllers.dart';
import 'package:crm_draivfmobileapp/core/routes/app_route_observer.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/core/utils/helper_utils.dart';
import 'package:crm_draivfmobileapp/presentation/page_not_found/page_not_found.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/add_camp_inside_details/addcamp_inside_details_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/addcamp_inside_action_details/addcamp_inside_actionprovider_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/camp_detalis/camp_details_inside_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/camp_management_screens/camp_home_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/camp_zone_userdetails_screen/camp_userdetails_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/camp_management/new_comp_add/new_camp_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/dashborad_chart_provider/chart1_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_home/dashboard_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/new_leads/add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_donor_leads_new_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_new_leads/dln_add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_convert_to_customer/inl_convert_to_customer_page.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/add_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/assigned_member_profile/assigned_member_profile/assigned_member_profile_edithome.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/bulk_action/bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/add_new_task.dart/add_new_task_page.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/add_new_task_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/convert_to_customer/convert_to_customer_page.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/domestic_leads_data.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/domestic_leads_data/set_lead_reminders/set_lead_reminders_page.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/set_lead_reminders_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/domestic_lead_home/edit_leads/edit_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domesticLeads/import_leads/import_leads.dart';
import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/import_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/provider/enquiry_provider/convert_screen_provider.dart';
import 'package:crm_draivfmobileapp/provider/enquiry_provider/edit_enquiry_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/enquiry/enquiry_main_home/enquiry_home.dart';
import 'package:crm_draivfmobileapp/provider/enquiry_provider/add_enquiry_provider.dart';

import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/inl_add_newlead/inl_add_newlead.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_add_lead_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/inl_import_leads/inl_import_leads.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_import_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/inl_bulk_action/inl_bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_home.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/Inl_data_provider.dart';

import 'package:crm_draivfmobileapp/provider/enquiry_provider/home_enquiry_provider.dart';

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
        //login provider
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        //dashboard
        ChangeNotifierProvider(create: (_) => Chart1Provider()),

        //domesticlead provider
                ChangeNotifierProvider(create: (_) => DomesticLeadsDataProvider()),

        ChangeNotifierProvider(create: (_) => AddLeadsProvider()),
        ChangeNotifierProvider(create: (_) => ImportLeadsProvider()),

        ChangeNotifierProvider(create: (_) => AssignedMemberProfileProvider()),
        ChangeNotifierProvider(create: (_) => ConvertToCustomerProvider()),
        ChangeNotifierProvider(create: (_) => AddNewTaskProvider()),
        ChangeNotifierProvider(create: (_) => SetLeadRemindersProvider()),
              ChangeNotifierProvider(create: (_) => AssignedMemberProfileProvider()),
        ChangeNotifierProvider(
          create: (_) => AssignedMemberProfileEditProvider(),
        ),
        //////////////international leads provider
        ChangeNotifierProvider(create: (_) => InlAddLeadProvider()),
        ChangeNotifierProvider(
          create: (_) => InlImportLeadsProvider(),
        ),
        ChangeNotifierProvider(create: (_) => InlDataProvider()),  
        ChangeNotifierProvider(create: (_) => EditEnquiryProvider()),
        ChangeNotifierProvider(create: (_) => ConvertScreenProvider()),
         ChangeNotifierProvider(create: (_) => InlConvertToCustomerProvider()),


        //donor leads provider
        ChangeNotifierProvider(create: (_) => DLNDonorLeadsNewDataProvider()),
        ChangeNotifierProvider(create: (_) => DLNAddLeadsProvider()),
 
        //enquiry provider
        ChangeNotifierProvider(create: (_) => AddEnquiryProvider()),
        ChangeNotifierProvider(create: (_) => HomeEnquiryProvider()),
        //camp provider
        ChangeNotifierProvider(create: (_) => NewCampProvider()),
        ChangeNotifierProvider(create: (_) => CampUserDetailsProvider()),
        ChangeNotifierProvider(create: (_) => CampDetailsInsidePageProvider()),
        ChangeNotifierProvider(create: (_) => AddCampInsideProvider()),
        ChangeNotifierProvider(create: (_) => AddCampInsideActionProvider()),

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
      //splash screen
      case AppRoutes.splashScreen:
        return SplashScreen();
      //loginscreen
      case AppRoutes.loginScreen:
        return LoginScreen();

      case AppRoutes.dashboardScreen:
        return const DashboardScreen();
      case AppRoutes.teledashboardScreen:
        return const TeleDashboradScreen();

      case AppRoutes.enquiryHome:
        return EnquiryHome();


      case AppRoutes.campHome:
        return const CampHomeScreen();
      case AppRoutes.convertToCustomerScreen:
        return const ConvertToCustomerPage();

      //domestic lead screen
      case AppRoutes.domesticLeadHome:
        return DomesticLeadsHome();
      case AppRoutes.addLeadScreen:
        return AddLeadScreen();
      case AppRoutes.importLeadScreen:
        return ImportLeads();
      case AppRoutes.domesticleaddata:
        return const DomesticLeadsData();
      case AppRoutes.bulkActionScreen:
        return const BulkActionPage();
      case AppRoutes.assignedMemberProfileedithome:
        return const AssignedMemberProfileEditHome();
      case AppRoutes.addNewTaskScreen:
        return const AddNewTaskPage();
      case AppRoutes.setLeadReminderScreen:
        return const SetLeadRemindersPage();
      case AppRoutes.editLeadScreen:
        return const EditLeadScreen();
      //donor lead new screen
      case AppRoutes.donorLeadNewHome:
        return DLNDonorLeadsNewHome();
        case AppRoutes.adddonorLeadNewScreen:
        return DLNAddLeadScreen();
        //international lead screen
   


      case AppRoutes.internationalLeadHome:
        return InternationalLeadsHome();
      case AppRoutes.addInternationalLeadScreen:
        return InlAddNewlead();
      case AppRoutes.internationalLeadBulkActionScreen:
        return InlBulkActionPage();
      case AppRoutes.importInternationalLeadScreen:
        return InlImportLeads();
        case AppRoutes.inlConvertToCustomerScreen:
        return INLConvertToCustomerPage();
      //not found screen
      case AppRoutes.notFoundScreen:
        return const NotFoundPage();

      default:
        return const NotFoundPage();
    }
  }
}
