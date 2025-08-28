import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/add_lead_page/add_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/bulk_action_page/bulk_action_page.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/domestic_lead_home/domestic_leads_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/import_lead/import_leads.dart';
import 'package:crm_draivfmobileapp/presentation/pages/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const splashScreen = '/splashscreen';

  static const domesticLeadHome = '/domesticleadhome';
  static const addLeadScreen = '/addleadscreen';
  static const importLeadScreen = '/importleadscreen';
  static const testScreen = '/testscreen';
  static const bulkActionScreen = '/bulkactionscreen';

  static final routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),

    GetPage(name: domesticLeadHome, page: () => DomesticLeadsHome()),
    GetPage(name: addLeadScreen, page: () => AddLeadScreen()),
    GetPage(name: importLeadScreen, page: () => ImportLeads()),
    GetPage(name: bulkActionScreen, page: () => BulkActionPage()),

    // GetPage(name: testScreen, page: () => DomesticLeadsData()),
  ];
}
