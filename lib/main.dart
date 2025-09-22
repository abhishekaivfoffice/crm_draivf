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
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_bulk_action/dln_bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_assigned_member_profile/dln_assigned_member_profile_edithome.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_donor_leads_new_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/dln_edit_leads/dln_edit_donor_details.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/donor_leads_new_data/dln_convert_to_customer/dln_convert_to_customer_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_donor_lead_new_home/donor_leads_new_data/dln_donor_lead_new_data_profile.dart';
import 'package:crm_draivfmobileapp/presentation/pages/donorLeadsNew/dln_add_donor_lead/dln_add_donor_details.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/inl_assigned_member_profile/inl_assigned_member_profile/inl_assigned_member_profile_edithome.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/inl_edit_leads/inl_edit_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_add_new_task.dart/inl_add_new_task_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_convert_to_customer/inl_convert_to_customer_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_set_lead_reminders/inl_set_lead_reminders_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/JL_bulk_action/jl_bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/jl_import_leads/jl_import_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/jl_new_leads/jl_add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/jl_assigned_member_profile/jl_assigned_member_profile_edithome.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/jl_edit_leads/jl_edit_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_add_new_task.dart/jl_add_new_task_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_convert_to_customer/jl_convert_to_customer_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/jl_set_lead_reminders/jl_set_lead_reminders_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_data/job_leads_data.dart';
import 'package:crm_draivfmobileapp/presentation/pages/jobLeads/job_lead_home/job_leads_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/Jln_bulk_action/jln_bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/jln_import_leads/jln_import_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/jln_new_leads/jln_add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/jln_assigned_member_profile/jln_assigned_member_profile_edithome.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/jln_edit_leads/jln_edit_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/job_leads_new_data/jln_add_new_task.dart/jln_add_new_task_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/job_leads_new_data/jln_convert_to_customer/jln_convert_to_customer_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/job_leads_new_data/jln_set_lead_reminders/jln_set_lead_reminders_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/job_leads_new_data/job_leads_new_data.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/job_leads_new_home.dart';
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
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/provider/donor_lead_new_provider/dln_data_provider.dart';
import 'package:crm_draivfmobileapp/provider/enquiry_provider/convert_screen_provider.dart';
import 'package:crm_draivfmobileapp/provider/enquiry_provider/edit_enquiry_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/enquiry/enquiry_main_home/enquiry_home.dart';
import 'package:crm_draivfmobileapp/provider/enquiry_provider/add_enquiry_provider.dart';

import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/inl_add_newlead/inl_add_newlead.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/Inl_assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_add_lead_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/inl_import_leads/inl_import_leads.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_add_new_task_provider.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_assigned_member_profile_provider.dart';
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
import 'package:crm_draivfmobileapp/provider/internationallead_provider/inl_setlead_reminders_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_add_new_task_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_import_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_set_lead_reminders_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_add_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_add_new_task_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_assigned_member_profile_edit_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_assigned_member_profile_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_convert_to_customer_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_import_leads_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_set_lead_reminders_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

//regionalithead@draravindsivf.in
// 9363488086
//Thank you for submitting your details Our concerned team will get in touch with you shortly Use this number for future reference: DR091920251935771518
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
        ChangeNotifierProvider(create: (_) => InlImportLeadsProvider()),
        ChangeNotifierProvider(create: (_) => InlDataProvider()),
        ChangeNotifierProvider(create: (_) => EditEnquiryProvider()),
        ChangeNotifierProvider(create: (_) => ConvertScreenProvider()),
        ChangeNotifierProvider(create: (_) => InlConvertToCustomerProvider()),
        ChangeNotifierProvider(create: (_) => InlAddNewTaskProvider()),
        ChangeNotifierProvider(create: (_) => INLSetLeadRemindersProvider()),
        ChangeNotifierProvider(
          create: (_) => InlAssignedMemberProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => InlAssignedMemberProfileEditProvider(),
        ),

        //donor leads provider
        ChangeNotifierProvider(create: (_) => DLNDonorLeadsNewDataProvider()),
        ChangeNotifierProvider(create: (_) => DLNAddLeadsProvider()),
        ChangeNotifierProvider(
          create: (_) => DLNAssignedMemberProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DLNAssignedMemberProfileEditProvider(),
        ),
        ChangeNotifierProvider(create: (_) => DLNConvertToCustomerProvider()),
        //job lead provider
        ChangeNotifierProvider(create: (_) => JLAddLeadsProvider()),

        ChangeNotifierProvider(create: (_) => JLAddNewTaskProvider()),
        ChangeNotifierProvider(
          create: (_) => JLAssignedMemberProfileEditProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => JLAssignedMemberProfileProvider(),
        ),
        ChangeNotifierProvider(create: (_) => JlConvertToCustomerProvider()),
        ChangeNotifierProvider(create: (_) => JlImportLeadsProvider()),
        ChangeNotifierProvider(create: (_) => JlJobLeadsDataProvider()),
        ChangeNotifierProvider(create: (_) => JLSetLeadRemindersProvider()),
 //job lead new provider
        ChangeNotifierProvider(create: (_) => JLNAddLeadsProvider()),

        ChangeNotifierProvider(create: (_) => JLNAddNewTaskProvider()),
        ChangeNotifierProvider(
          create: (_) => JLNAssignedMemberProfileEditProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => JLNAssignedMemberProfileProvider(),
        ),
        ChangeNotifierProvider(create: (_) => JlNConvertToCustomerProvider()),
        ChangeNotifierProvider(create: (_) => JlNImportLeadsProvider()),
        ChangeNotifierProvider(create: (_) => JlNJobLeadsDataProvider()),
        ChangeNotifierProvider(create: (_) => JLNSetLeadRemindersProvider()),
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
        return DLNAddDonorDetailsScreen();
      case AppRoutes.donorLeadNewBulkActionScreen:
        return DLNBulkActionPage();
      case AppRoutes.dlnassignedMemberProfileedithome:
        return const DLNAssignedMemberProfileEdit();
      case AppRoutes.dlnConvertToCustomerScreen:
        return const DLNConvertToCustomerPage();
      case AppRoutes.dlneditDonorLeadNewScreen:
        return DLNEditLeadScreen();
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
      case AppRoutes.inlAddNewTaskScreen:
        return INLAddNewTaskPage();
      case AppRoutes.inlSetLeadReminderScreen:
        return INLSetLeadRemindersPage();
      case AppRoutes.inleditLeadScreen:
        return INLEditLeadScreen();
      case AppRoutes.inleditAssignedMember:
        return INLAssignedMemberProfileEditHome();
      //JOB LEAD SCREEN
      case AppRoutes.jobLeadHome:
        return JLDomesticLeadsHome();
      case AppRoutes.jladdLeadScreen:
        return JLAddLeadScreen();
      case AppRoutes.jlimportLeadScreen:
        return JLImportLeads();

      case AppRoutes.jobleaddata:
        return JobLeadsData();
      case AppRoutes.jlbulkActionScreen:
        return JLBulkActionPage();
      case AppRoutes.jlassignedMemberProfileedithome:
        return JLAssignedMemberProfileEditHome();
      case AppRoutes.jlconvertToCustomerScreen:
        return JLConvertToCustomerPage();
      case AppRoutes.jladdNewTaskScreen:
        return JLAddNewTaskPage();
      case AppRoutes.jlsetLeadReminderScreen:
        return JLSetLeadRemindersPage();
      case AppRoutes.jleditLeadScreen:
        return JLEditLeadScreen();
    //JOB LEAD NEW SCREEN
      case AppRoutes.jobLeadNewHome:
        return JobLeadsNewHome();
      case AppRoutes.jlnaddLeadScreen:
        return JLNAddLeadScreen();
      case AppRoutes.jlnimportLeadScreen:
        return JLNImportLeads();

      case AppRoutes.jobleadnewdata:
        return JobLeadsNewData();
      case AppRoutes.jlnbulkActionScreen:
        return JLNBulkActionPage();
      case AppRoutes.jlnassignedMemberProfileedithome:
        return JLNAssignedMemberProfileEditHome();
      case AppRoutes.jlnconvertToCustomerScreen:
        return JLNConvertToCustomerPage();
      case AppRoutes.jlnaddNewTaskScreen:
        return JLNAddNewTaskPage();
      case AppRoutes.jlnsetLeadReminderScreen:
        return JLNSetLeadRemindersPage();
      case AppRoutes.jlneditLeadScreen:
        return JLNEditLeadScreen();

        
      //not found screen
      case AppRoutes.notFoundScreen:
        return const NotFoundPage();

      default:
        return const NotFoundPage();
    }
  }
}
