import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:flutter/cupertino.dart';

class AssignedMemberProfileEditProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isExotel = false;
  bool get isExotel => _isExotel;
  bool _isCallDisabled = false;
  bool get isCallDisabled => _isCallDisabled;
  bool _isAdministrator = false;
  bool get isAdministrator => _isAdministrator;
  void setIsExotel(bool value) {
    _isExotel = value;
    notifyListeners();
  }
  // iscontactedtoday//

  void setIsCallDisabled(bool value) {
    _isCallDisabled = value;
    notifyListeners();
  }

  void setIsAdministrator(bool value) {
    _isAdministrator = value;
    notifyListeners();
  }

  ////////////////////////
  ///permission page
  ///
    /////status option
  final List<String> _filterstatus = [
    "New Lead",
    "Interested",
    "Walk-in/Video Scheduled",
    "Walk-in/Video Done",
    "Treatment Started",
    "Treatment Done",
    "Not Interested",
    "Junk",
    "Not Picked up",
    "Call Later",
    "Walk-in Dropped",
    "Treatment Dropped",
  ];
  
  List<String> get filterstatus => _filterstatus;
  bool _isReportsEnabled = false;
  bool get isReportsEnabled => _isReportsEnabled;
  bool _isPaymentLinkEnabled = false;
  bool get isPaymentLinkEnabled => _isPaymentLinkEnabled;
  bool _isCallDataEnabled = false;
  bool get isCallDataEnabled => _isCallDataEnabled;
  bool _isCampEnabled = false;
  bool get isCampEnabled => _isCampEnabled;
  //Enquiry
  final List<String> _enquiryLists = ["Enabled", "Create", "Delete", "Edit"];
  List<String> get enquiryLists => _enquiryLists;
  final List<String> _selectedEnquiryList = [];
  List<String> get selectedEnquiryList => _selectedEnquiryList;
  //Leads
  final List<String> _leadsLists = [
    "Enabled",
    "Delete",
    "New Lead",
    "Import Lead",
    "Inbound Call",
    "Call Audit",
  ];
  List<String> get leadsList => _leadsLists;
  final List<String> _selectedLeadList = [];
  List<String> get selectedLeadList => _selectedLeadList;
  final List<String> _role = ["TeleCaller"];
  List<String> get role => _role;
  String? _selectedrole;
  String? get selectedRole => _selectedrole;

  ///selected tags
  void SetSelectedEnquiryList(String item) {
    if (_selectedEnquiryList.contains(item)) {
      _selectedEnquiryList.remove(item);
    } else {
      _selectedEnquiryList.add(item);
    }
    notifyListeners();
  }

  ///selected Leads
  
  void SetSelectedLeadsList(String item) {
    if (_selectedLeadList.contains(item)) {
      _selectedLeadList.remove(item);
    } else {
      _selectedLeadList.add(item);
    }
    notifyListeners();
  }

  //selected role//
  void setSelectedRole(String? value) {
    _selectedrole = value;
    print(_selectedrole);

    notifyListeners();
  }

  void setIsReportEnabled(bool value) {
    _isReportsEnabled = value;
    notifyListeners();
  }

  void setIsPaymentLinkEnabled(bool value) {
    _isPaymentLinkEnabled = value;
    notifyListeners();
  }

  void setIsCallDataEnabled(bool value) {
    _isCallDataEnabled = value;
    notifyListeners();
  }

  void setIsCampEnabled(bool value) {
    _isCampEnabled = value;
    notifyListeners();
  }
}
