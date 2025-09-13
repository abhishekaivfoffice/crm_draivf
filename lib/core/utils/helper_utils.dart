import 'package:crm_draivfmobileapp/core/routes/routes.dart';

class HelperUtil {
  // Static Routes
  static bool isValidStaticRoute(String route) {
    final validRoutes = [
      //splash screen
      AppRoutes.splashScreen,
      //login screen
      AppRoutes.loginScreen,
      //dashboard screen
      AppRoutes.dashboardScreen,
      //teledashboard screen
      AppRoutes.teledashboardScreen,
      //domestic lead home screen
      AppRoutes.domesticLeadHome,
      AppRoutes.addLeadScreen,
      AppRoutes.importLeadScreen,
      AppRoutes.bulkActionScreen,
      AppRoutes.assignedMemberProfileedithome,
      AppRoutes.convertToCustomerScreen,
      AppRoutes.addNewTaskScreen,
      AppRoutes.setLeadReminderScreen,
      AppRoutes.campHome,
      AppRoutes.editLeadScreen,
      //international lead screen
      AppRoutes.internationalLeadHome,
      AppRoutes.importInternationalLeadScreen,
      AppRoutes.internationalLeadBulkActionScreen,
      AppRoutes.addInternationalLeadScreen,
      AppRoutes.inlConvertToCustomerScreen,

      //enquiry screen
      AppRoutes.enquiryHome,
      //donor lead new screen
      AppRoutes.donorLeadNewHome,
      AppRoutes.adddonorLeadNewScreen,
      
      //no found screen
      AppRoutes.notFoundScreen,
    ];

    return validRoutes.contains(route);
  }

  static String normalizeUrl(String url) {
    String path = Uri.parse(url).path.replaceAll(RegExp(r'/+'), '/');
    return path.startsWith('/') ? path : '/$path';
  }
}
