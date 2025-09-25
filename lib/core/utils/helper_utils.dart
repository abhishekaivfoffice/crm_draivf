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
      AppRoutes.inlAddNewTaskScreen,

      AppRoutes.inlSetLeadReminderScreen,
      AppRoutes.inlSetLeadReminderScreen,
      AppRoutes.inleditLeadScreen,
      AppRoutes.inleditAssignedMember,
      //enquiry screen
      AppRoutes.enquiryHome,
      //donor lead new screen
      AppRoutes.donorLeadNewHome,
      AppRoutes.adddonorLeadNewScreen,
      AppRoutes.donorLeadNewBulkActionScreen,
      AppRoutes.dlnassignedMemberProfileedithome,
      AppRoutes.dlnConvertToCustomerScreen,
      AppRoutes.dlneditDonorLeadNewScreen,
      //job lead home
      AppRoutes.jobLeadHome,
      AppRoutes.jladdLeadScreen,
      AppRoutes.jlimportLeadScreen,
      AppRoutes.jobleaddata,
      AppRoutes.jlbulkActionScreen,
      AppRoutes.jlassignedMemberProfileedithome,
      AppRoutes.jlconvertToCustomerScreen,
      AppRoutes.jladdNewTaskScreen,
      AppRoutes.jlsetLeadReminderScreen,
      AppRoutes.jleditLeadScreen,
      //job leads new
      AppRoutes.jobLeadNewHome,
      AppRoutes.jlnaddLeadScreen,
      AppRoutes.jlnimportLeadScreen,
      AppRoutes.jobleadnewdata,
      AppRoutes.jlnbulkActionScreen,
      AppRoutes.jlnassignedMemberProfileedithome,
      AppRoutes.jlnconvertToCustomerScreen,
      AppRoutes.jlnaddNewTaskScreen,
      AppRoutes.jlnsetLeadReminderScreen,
      AppRoutes.jlneditLeadScreen,
      //course lead screen
      AppRoutes.courseLeadHome,
      AppRoutes.importCourseLeadScreen,
      AppRoutes.courseLeadBulkActionScreen,
      AppRoutes.addCourseLeadScreen,
      AppRoutes.courseConvertToCustomerScreen,
      AppRoutes.courseAddNewTaskScreen,
      AppRoutes.courseSetLeadReminderScreen,
      AppRoutes.courseeditLeadScreen,
      AppRoutes.courseeditAssignedMember,

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
