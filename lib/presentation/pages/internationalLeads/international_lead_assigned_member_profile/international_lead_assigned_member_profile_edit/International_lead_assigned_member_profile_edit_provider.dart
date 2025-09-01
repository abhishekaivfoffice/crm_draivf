import 'package:flutter/cupertino.dart';

class InternationalLeadAssignedMemberProfileEditProvider extends ChangeNotifier {
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

  ////////////////////////////////////////permission page//////////////////////////////////////////////////////////////////

  /////status option
  final List<String> _assignedstatus = [
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

  List<String> get assignedstatus => _assignedstatus;


  List<String> _selectedassignedStatus = [];
  List<String> get selectedassignedStatus => _selectedassignedStatus;
  void setAssignedStatus(List<String> status) {
    _selectedassignedStatus = status;
    notifyListeners();
  }
  ///// academy leads status option
  final List<String> _academyleadsassignedstatus = [
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

  List<String> get academyleadsassignedstatus => _academyleadsassignedstatus;
  
  List<String> _selectedacademyleadsassignedStatus = [];
  List<String> get selectedacademyleadsassignedStatus => _selectedacademyleadsassignedStatus;
  void setAcademyLeadsAssignedStatus(List<String> status) {
    _selectedacademyleadsassignedStatus = status;
    notifyListeners();
  }
  ////digital media options
  final List<String> _assigneddigitalMedia = [
    "Affiliate Portals",
    "Camp",
    "Dropout",
    "Ebook",
    "Facebook",
    "Google",
    "Hotstar",
    "Inbound Call",
    "Justdial",
    "Oneindia",
    "Practo",
    "Quora",
  ];
  List<String> get assigneddigitalmedia => _assigneddigitalMedia;
  List<String> _selectedDigitalMedia = [];
  List<String> get selectedDigitalMedia => _selectedDigitalMedia;

  void setSelectedDigitalMedia(List<String> media) {
    _selectedDigitalMedia = media;
    notifyListeners();
  }

  ////academy leads source options
  final List<String> _academyleadssourceoption = [
    "Affiliate Portals",
    "Camp",
    "Dropout",
    "Ebook",
    "Facebook",
    "Google",
    "Hotstar",
    "Inbound Call",
    "Justdial",
    "Oneindia",
    "Practo",
    "Quora",
  ];
  List<String> get academyLeadsSourceOption => _academyleadssourceoption;
  List<String> _selectedacademyLeadsSource = [];
  List<String> get selectedacademyLeadsSource => _selectedacademyLeadsSource;

  void setSelectedAcademyLeadSource(List<String> source) {
    _selectedacademyLeadsSource = source;
    notifyListeners();
  }




  ////academy leads source options
  final List<String> _academyleadscourceoption = [
    "Fellowship in Reproductive Medicine",
    "M.Sc Clinical Embryology",
    "Training Program in Embryology",
    "Training Program in Andrology",
    "Institute of Paramedical Science",
   
  ];
  List<String> get academyLeadsCourceOption => _academyleadscourceoption;
  List<String> _selectedacademyLeadsCource = [];
  List<String> get selectedacademyLeadsCource => _selectedacademyLeadsCource;

  void setSelectedAcademyLeadCource(List<String> source) {
    _selectedacademyLeadsCource = source;
    notifyListeners();
  }




  //branches
  final List<String> _assignedbranches = [
    "Aathur",
    "Bengaluru - Electronic City",
    "Bengaluru - Hebbal",
    "Bengaluru - T Dasarahalli",
    "Bengaluru - Konanakunte",
    "Chengalpattu",
    "Chennai - Madipakkam",
    "Chennai - Sholinganallur",
    "Chennai - Tambaram",
    "Chennai - Thiruvallur",
    "Chennai - Urapakkam",
    "Chennai - Vadapalani",
    "Coimbatore - Ganapathy",
  ];
  List<String> get assignedbranches => _assignedbranches;

  List<String> _selectedAssignedBranches = [];
  List<String> get selectedAssignedBranches => _selectedAssignedBranches;
  void setAssignedBranches(List<String> branches) {
    _selectedAssignedBranches = branches;
    notifyListeners();
  }
  final fromDateController = TextEditingController();
    final toDateController = TextEditingController();


  bool _isReportsEnabled = false;
  bool get isReportsEnabled => _isReportsEnabled;
  bool _isPaymentLinkEnabled = false;
  bool get isPaymentLinkEnabled => _isPaymentLinkEnabled;
  bool _isCallDataEnabled = false;
  bool get isCallDataEnabled => _isCallDataEnabled;
  bool _isCampEnabled = false;
  bool get isCampEnabled => _isCampEnabled;
  bool _isInternationalLeadEnabled = false;
  bool get isInternationalLeadEnabled => _isInternationalLeadEnabled;
  bool _isJobLeadsLeadEnabled = false;
  bool get isJobLeadsLeadEnabled => _isJobLeadsLeadEnabled;
  bool _isDonorLeadsLeadEnabled = false;
  bool get isDonorLeadsLeadEnabled => _isDonorLeadsLeadEnabled;
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
  //Academy leads
  final List<String> _academyleadsLists = ["Enabled", "New Lead", "Call Audit"];
  List<String> get academyLeadsLists => _academyleadsLists;
  final List<String> _selectedAcademyLeadsList = [];
  List<String> get selectedAcademyLeadsList => _selectedAcademyLeadsList;

  List<String> get leadsList => _leadsLists;
  final List<String> _selectedLeadList = [];
  List<String> get selectedLeadList => _selectedLeadList;
  final List<String> _role = ["TeleCaller"];
  List<String> get role => _role;
  String? _selectedrole;
  String? get selectedRole => _selectedrole;

  ///selected tags
  void setSelectedEnquiryList(String item) {
    if (_selectedEnquiryList.contains(item)) {
      _selectedEnquiryList.remove(item);
    } else {
      _selectedEnquiryList.add(item);
    }
    notifyListeners();
  }

  ///selected Leads

  void setSelectedLeadsList(String item) {
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

  ///selected academy leads
  void setAcademyLeadsList(String item) {
    if (_selectedAcademyLeadsList.contains(item)) {
      _selectedAcademyLeadsList.remove(item);
    } else {
      _selectedAcademyLeadsList.add(item);
    }
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

  void setIsInternationalLeadEnabled(bool value) {
    _isInternationalLeadEnabled = value;
    notifyListeners();
  }

  void setIsJobLeadEnabled(bool value) {
    _isJobLeadsLeadEnabled = value;
    notifyListeners();
  }

  void setIsDonorLeadEnabled(bool value) {
    _isDonorLeadsLeadEnabled = value;
    notifyListeners();
  }
}
