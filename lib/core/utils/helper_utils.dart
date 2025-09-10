import 'package:crm_draivfmobileapp/core/routes/routes.dart';

class HelperUtil {
  // Static Routes
  static bool isValidStaticRoute(String route) {
    final validRoutes = [
      AppRoutes.splashScreen,
      AppRoutes.splashScreen,

      AppRoutes.loginScreen,

      AppRoutes.domesticLeadHome,

      AppRoutes.addLeadScreen,

      AppRoutes.importLeadScreen,
      AppRoutes.bulkActionScreen,
      AppRoutes.dashboardScreen,
      AppRoutes.teledashboardScreen,
      AppRoutes.enquiryHome,
      AppRoutes.assignedMemberProfileedithome,

      AppRoutes.internationalLeadHome,
      AppRoutes.importInternationalLeadScreen,
      AppRoutes.internationalLeadBulkActionScreen,
      AppRoutes.addInternationalLeadScreen,
      AppRoutes.convertToCustomerScreen,
      AppRoutes.addNewTaskScreen,
      AppRoutes.setLeadReminderScreen,
      AppRoutes.campHome,

      AppRoutes.notFoundScreen,
    ];

    return validRoutes.contains(route);
  }

  static String normalizeUrl(String url) {
    String path = Uri.parse(url).path.replaceAll(RegExp(r'/+'), '/');
    return path.startsWith('/') ? path : '/$path';
  }
}
