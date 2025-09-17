
import 'dart:io';

import 'package:crm_draivfmobileapp/data/models/donor_lead_new/dln_assigned_member_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DLNDonorLeadsNewDataProvider extends ChangeNotifier {
    int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  int currentPage = 0;
  int pageSize = 10;
  bool get hasNextPage => (currentPage + 1) * pageSize < users.length;
  bool get hasPreviousPage => currentPage > 0;
  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  final List<String> _items = ["5", "10", "15", "20"];

  List<String> get items => _items;

  String? _selectedExportTypeValue;

  String? get selectedExportTypeValue => _selectedExportTypeValue;
  String? _selectedAction;
  String? get selectedAction => _selectedAction;
  final List<String> _actionItems = ["Excel", "CSV", "Pdf", "Print"];
  List<String> get actionItems => _actionItems;

  ////////////bulk action page data
  final lastcontactdatetimeController = TextEditingController();

  bool _isMassDeleteChecked = false;
  bool get isMassDeleteChecked => _isMassDeleteChecked;
  bool _isMarkAsLostChecked = false;
  bool get isMarkAsLostChecked => _isMarkAsLostChecked;
  String? _selectedstatus;
  String? get selectedstatus => _selectedstatus;
  String? _selectedsources;
  String? get selectedsources => _selectedsources;
  String? _selectedassignedperson;
  String? get selectedassignedperson => _selectedassignedperson;
  final List<String> _selectedTags = [];
  List<String> get selectedTags => _selectedTags;
  bool _isPublic = false;
  bool get isPublic => _isPublic;
  bool _isPrivate = false;
  bool get isPrivate => _isPrivate;

    bool _showFilters = false;
  bool get showFilters => _showFilters;
  void toggleFilters() {
    _showFilters = !_showFilters;
    notifyListeners();
  }
  bool _isProfileExpanded = false;

  bool get isProfileExpanded => _isProfileExpanded;
    void toggle() {
    _isProfileExpanded = !_isProfileExpanded;
    notifyListeners();
  }
  ///////SEE MORE TAB 
    int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  ///////////////////////////see more upload file section
   List<PlatformFile> _selectedFiles = [];

  List<PlatformFile> get selectedFiles => _selectedFiles;

  void setFiles(List<PlatformFile> files) {
    _selectedFiles = files;
    notifyListeners();
  }

  void clearFiles() {
    _selectedFiles = [];
    notifyListeners();
  }
  //////see more textfields
  final totalAmountController = TextEditingController();
    final descriptionController = TextEditingController();
 final notesController = TextEditingController();
    final dateContactedController = TextEditingController();
     final activityLogController = TextEditingController();
 File? _selectedCallRecordingFile;

  File? get selectedCallRecordingFile => _selectedCallRecordingFile;
  //choose file
  void setCallRecordingFileFile(File file) {
    _selectedCallRecordingFile = file;
    notifyListeners();
  }
 final List<String> _language = [
    "Tamil",
    "English",
    "Malayalam",
  
  ];
  List<String> get language => _language;
  
  String? _selectedLanguage;
  String? get selectedLanguage => _selectedLanguage;
  
  void setSelectedLanguage(String? language) {
    _selectedLanguage = language;
    notifyListeners();
  }
   final List<String> _template = [
    "Tamil",
    "English",
    "Malayalam",
  
  ];
  List<String> get template => _template;
  
  String? _selectedTemplate;
  String? get selectedTemplate => _selectedTemplate;
  
  void setSelectedTemplate(String? template) {
    _selectedTemplate = template;
    notifyListeners();
  }
  /////status option
  final List<String> _status = [
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
  List<String> get status => _status;

  /////sources options
  final List<String> _sources = [
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
  List<String> get sources => _sources;
  /////Assigned options
  final List<String> _assignedPerson = [
    "Yamini 12767",
    "vishali TPR",
    "vignesh CRM",
    "Veera Pandi",
    "Vanitha 12383",
    "Super Admin",
    "Sudhakar L",
    "SREE HARISH RG",
    "sorna TPR",
    "Siva S",
    "Saranya S",
    "Santhiya 12679",
  ];
  List<String> get assignedPerson => _assignedPerson;
  //Tags
  final List<String> _tags = ["Tag1", "Tag2", "Tag3", "Tag4", "Tag5"];
  List<String> get tags => _tags;

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////filter values
  final List<String> _filterzones = [
    "CHENNAI",
    "KARNATAKA",
    "CENTRAL TN",
    "KERALA",
    "SOUTH TN",
    "WEST 1 TN",
    "AP & VELLORE",
    "WEST 2 TN",
    "Not Specified",
  ];
  List<String> get filterzones => _filterzones;

    //branches
  final List<String> _branches = [
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
  List<String> get branches => _branches;
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

  final List<String> _filteragentName = [
    "Yamini 12767",
    "vishali TPR",
    "vignesh CRM",
    "Veera Pandi",
    "Vanitha 12383",
    "Super Admin",
    "Sudhakar L",
    "SREE HARISH RG",
    "sorna TPR",
    "Siva S",
    "Saranya S",
    "Santhiya 12679",
  ];
  List<String> get filteragentName => _filteragentName;
  /////socialmedia options
  final List<String> _filtersocialMedia = [
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
  List<String> get filtersocialMedia => _filtersocialMedia;
  ////digital media options
  final List<String> _filterdigitalMedia = [
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
  List<String> get filterdigitalmedia => _filterdigitalMedia;
  ////date filter
  final List<String> _filterdateFilter = [
    "Walked In Date",
    "Camp",
    "Dropout",
    "Ebook",
    "Facebook",
  ];
    List<String> get filterdateFilter => _filterdateFilter;

  final TextEditingController dateRangeController = TextEditingController();

  List<String> _selectedFilterZones = [];
  List<String> get selectedFilterZones => _selectedFilterZones;

  List<String> _selectedFilterBranches = [];
  List<String> get selectedFilterBranches => _selectedFilterBranches;

  List<String> _selectedFilterStatus = [];
  List<String> get selectedFilterStatus => _selectedFilterStatus;

  String? _selectedFilterAgentName;
  String? get selectedFilterAgentName => _selectedFilterAgentName;
  String? _selectedFilterSocialMedia;
  String? get selectedFilterSocialMedia => _selectedFilterSocialMedia;
  String? _selectedFilterDigitalMedia;
  String? get selectedFilterDigitalMedia => _selectedFilterDigitalMedia;
  String? _selectedFilterDateFilter;
  String? get selectedFilterDateFilter => _selectedFilterDateFilter;

  //setzones
  void setFilterZones(List<String> zones) {
    _selectedFilterZones = zones;
    notifyListeners();
  }

  void setFilterBranches(List<String> branches) {
    _selectedFilterBranches = branches;
    notifyListeners();
  }

  void setFilterStatus(List<String> status) {
    _selectedFilterStatus = status;
    notifyListeners();
  }

  void setFilterAgentNames(String? agentnames) {
    _selectedFilterAgentName = agentnames;
    notifyListeners();
  }

  void setFilterSocialMedia(String? socialmedia) {
    _selectedFilterSocialMedia = socialmedia;
    notifyListeners();
  }

  void setFilterDigitalMedia(String? digitalMedia) {
    _selectedFilterDigitalMedia = digitalMedia;
    notifyListeners();
  }

  void setFilterDateFilter(String? datefilter) {
    _selectedFilterDateFilter = datefilter;
    notifyListeners();
  }



final List<PatientRecord> _users = [
  PatientRecord(
    id: 1001,
    wifeName: "Aarti Singh",
    location: "Delhi",
    wifePhone: "98******12",
    dupe: 0,
    assignedMembers: [
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
        name: "Dr. Meera Kapoor",
        lastActiveDate: "2025-08-01",
        email: "meera.kapoor@example.com",
      ),
       DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
        name: "Dr. Meera Kapoor",
        lastActiveDate: "2025-08-01",
        email: "meera.kapoor@example.com",
      ),
    ],
    status: "Egg Donor",
    source: "Online",
    walkInDate: "2025-08-12",
    lastContact: "2025-09-01",
    created: "2025-08-01",
    action: "Follow-up Pending",
    donorName: "Donor A",
    age: 28,
    wifePhoto: "https://randomuser.me/api/portraits/women/10.jpg",
    husbandPhoto: "https://randomuser.me/api/portraits/men/15.jpg",
    aadharWife: "xxxx-xxxx-1234",
    aadharHusband: "xxxx-xxxx-5678",
    marriageCertificate: "marriage_cert_1001.pdf",
    divorceDocument: "",
    childrenDetails: "No Children",
    birthCertificate: "birth_cert_1001.pdf",
    panCard: "ABCDE1234F",
    mrdNumber: "MRD1001",
    artEnrolment: "ART2025-001",
    tvScan: "tvscan_1001.png",
    semenTest: "semen_1001.pdf",
    serology: "sero_1001.pdf",
    bbt: "bbt_1001.pdf",
    tft: "tft_1001.pdf",
    cardiacFitness: "cardiac_1001.pdf",
    ecg: "ecg_1001.pdf",
    informedConsent: "consent_1001.pdf",
    donorConsent: "donor_consent_1001.pdf",
    donorBond: "donor_bond_1001.pdf",
    recipientName: "Recipient A",
    recipientMrd: "REC1001",
    consultationDates: ["2025-08-15", "2025-09-01"],
    testDates: ["2025-08-18", "2025-09-03"],
    pharmacyTimeline: "pharmacy_1001.pdf",
    ivfDashboard: "ivf_dashboard_1001.pdf",
    opuSummary: "opu_1001.pdf",
    intraOp: "intraop_1001.pdf",
    postOp: "postop_1001.pdf",
    prescriptions: ["Rx_1001_1.pdf", "Rx_1001_2.pdf"],
    reports: ["report_1001.pdf"],
  ),

  PatientRecord(
    id: 1002,
    wifeName: "Neha Verma",
    location: "Mumbai",
    wifePhone: "97******56",
    dupe: 0,
    assignedMembers: [
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/men/46.jpg",
        name: "Dr. Arjun Patel",
        lastActiveDate: "2025-08-05",
        email: "arjun.patel@example.com",
      ),
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/women/33.jpg",
        name: "Nisha Rao",
        lastActiveDate: "2025-08-03",
        email: "nisha.rao@example.com",
      ),
    ],
    status: "Egg Donor",
    source: "Referral",
    walkInDate: "2025-08-20",
    lastContact: "2025-09-02",
    created: "2025-08-05",
    action: "Scheduled Appointment",
    donorName: "Donor B",
    age: 30,
    wifePhoto: "https://randomuser.me/api/portraits/women/20.jpg",
    husbandPhoto: "https://randomuser.me/api/portraits/men/25.jpg",
    aadharWife: "xxxx-xxxx-2234",
    aadharHusband: "xxxx-xxxx-6678",
    marriageCertificate: "marriage_cert_1002.pdf",
    divorceDocument: "",
    childrenDetails: "1 Child",
    birthCertificate: "birth_cert_1002.pdf",
    panCard: "BCDEF2345G",
    mrdNumber: "MRD1002",
    artEnrolment: "ART2025-002",
    tvScan: "tvscan_1002.png",
    semenTest: "semen_1002.pdf",
    serology: "sero_1002.pdf",
    bbt: "bbt_1002.pdf",
    tft: "tft_1002.pdf",
    cardiacFitness: "cardiac_1002.pdf",
    ecg: "ecg_1002.pdf",
    informedConsent: "consent_1002.pdf",
    donorConsent: "donor_consent_1002.pdf",
    donorBond: "donor_bond_1002.pdf",
    recipientName: "Recipient B",
    recipientMrd: "REC1002",
    consultationDates: ["2025-08-22"],
    testDates: ["2025-08-25"],
    pharmacyTimeline: "pharmacy_1002.pdf",
    ivfDashboard: "ivf_dashboard_1002.pdf",
    opuSummary: "opu_1002.pdf",
    intraOp: "intraop_1002.pdf",
    postOp: "postop_1002.pdf",
    prescriptions: ["Rx_1002.pdf"],
    reports: ["report_1002.pdf"],
  ),
    PatientRecord(
    id: 1002,
    wifeName: "Neha Verma",
    location: "Mumbai",
    wifePhone: "97******56",
    dupe: 0,
    assignedMembers: [
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/men/46.jpg",
        name: "Dr. Arjun Patel",
        lastActiveDate: "2025-08-05",
        email: "arjun.patel@example.com",
      ),
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/women/33.jpg",
        name: "Nisha Rao",
        lastActiveDate: "2025-08-03",
        email: "nisha.rao@example.com",
      ),
    ],
    status: "Egg Donor",
    source: "Referral",
    walkInDate: "2025-08-20",
    lastContact: "2025-09-02",
    created: "2025-08-05",
    action: "Scheduled Appointment",
    donorName: "Donor B",
    age: 30,
    wifePhoto: "https://randomuser.me/api/portraits/women/20.jpg",
    husbandPhoto: "https://randomuser.me/api/portraits/men/25.jpg",
    aadharWife: "xxxx-xxxx-2234",
    aadharHusband: "xxxx-xxxx-6678",
    marriageCertificate: "marriage_cert_1002.pdf",
    divorceDocument: "",
    childrenDetails: "1 Child",
    birthCertificate: "birth_cert_1002.pdf",
    panCard: "BCDEF2345G",
    mrdNumber: "MRD1002",
    artEnrolment: "ART2025-002",
    tvScan: "tvscan_1002.png",
    semenTest: "semen_1002.pdf",
    serology: "sero_1002.pdf",
    bbt: "bbt_1002.pdf",
    tft: "tft_1002.pdf",
    cardiacFitness: "cardiac_1002.pdf",
    ecg: "ecg_1002.pdf",
    informedConsent: "consent_1002.pdf",
    donorConsent: "donor_consent_1002.pdf",
    donorBond: "donor_bond_1002.pdf",
    recipientName: "Recipient B",
    recipientMrd: "REC1002",
    consultationDates: ["2025-08-22"],
    testDates: ["2025-08-25"],
    pharmacyTimeline: "pharmacy_1002.pdf",
    ivfDashboard: "ivf_dashboard_1002.pdf",
    opuSummary: "opu_1002.pdf",
    intraOp: "intraop_1002.pdf",
    postOp: "postop_1002.pdf",
    prescriptions: ["Rx_1002.pdf"],
    reports: ["report_1002.pdf"],
  ),

  PatientRecord(
    id: 1003,
    wifeName: "Pooja Nair",
    location: "Bangalore",
    wifePhone: "95******88",
    dupe: 1,
    assignedMembers: [
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/men/55.jpg",
        name: "Dr. Sameer Khan",
        lastActiveDate: "2025-08-10",
        email: "sameer.khan@example.com",
      ),
    ],
    status: "Egg Donor",
    source: "Camp",
    walkInDate: "2025-09-10",
    lastContact: "2025-09-12",
    created: "2025-08-10",
    action: "Tests Ordered",
    donorName: "Donor C",
    age: 27,
    wifePhoto: "https://randomuser.me/api/portraits/women/35.jpg",
    husbandPhoto: "https://randomuser.me/api/portraits/men/36.jpg",
    aadharWife: "xxxx-xxxx-3344",
    aadharHusband: "xxxx-xxxx-7788",
    marriageCertificate: "marriage_cert_1003.pdf",
    divorceDocument: "",
    childrenDetails: "No Children",
    birthCertificate: "birth_cert_1003.pdf",
    panCard: "CDEFG3456H",
    mrdNumber: "MRD1003",
    artEnrolment: "ART2025-003",
    tvScan: "tvscan_1003.png",
    semenTest: "semen_1003.pdf",
    serology: "sero_1003.pdf",
    bbt: "bbt_1003.pdf",
    tft: "tft_1003.pdf",
    cardiacFitness: "cardiac_1003.pdf",
    ecg: "ecg_1003.pdf",
    informedConsent: "consent_1003.pdf",
    donorConsent: "donor_consent_1003.pdf",
    donorBond: "donor_bond_1003.pdf",
    recipientName: "Recipient C",
    recipientMrd: "REC1003",
    consultationDates: ["2025-09-11"],
    testDates: ["2025-09-12"],
    pharmacyTimeline: "pharmacy_1003.pdf",
    ivfDashboard: "ivf_dashboard_1003.pdf",
    opuSummary: "opu_1003.pdf",
    intraOp: "intraop_1003.pdf",
    postOp: "postop_1003.pdf",
    prescriptions: ["Rx_1003.pdf"],
    reports: ["report_1003.pdf"],
  ),

  PatientRecord(
    id: 1004,
    wifeName: "Kavita Joshi",
    location: "Chennai",
    wifePhone: "96******44",
    dupe: 0,
    assignedMembers: [
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/women/48.jpg",
        name: "Dr. Shalini Menon",
        lastActiveDate: "2025-08-15",
        email: "shalini.menon@example.com",
      ),
    ],
    status: "Egg Donor",
    source: "Hospital Website",
    walkInDate: "2025-08-18",
    lastContact: "2025-09-05",
    created: "2025-08-15",
    action: "IVF Cycle Ongoing",
    donorName: "Donor D",
    age: 32,
    wifePhoto: "https://randomuser.me/api/portraits/women/50.jpg",
    husbandPhoto: "https://randomuser.me/api/portraits/men/50.jpg",
    aadharWife: "xxxx-xxxx-4455",
    aadharHusband: "xxxx-xxxx-8899",
    marriageCertificate: "marriage_cert_1004.pdf",
    divorceDocument: "",
    childrenDetails: "2 Children",
    birthCertificate: "birth_cert_1004.pdf",
    panCard: "DEFGH4567I",
    mrdNumber: "MRD1004",
    artEnrolment: "ART2025-004",
    tvScan: "tvscan_1004.png",
    semenTest: "semen_1004.pdf",
    serology: "sero_1004.pdf",
    bbt: "bbt_1004.pdf",
    tft: "tft_1004.pdf",
    cardiacFitness: "cardiac_1004.pdf",
    ecg: "ecg_1004.pdf",
    informedConsent: "consent_1004.pdf",
    donorConsent: "donor_consent_1004.pdf",
    donorBond: "donor_bond_1004.pdf",
    recipientName: "Recipient D",
    recipientMrd: "REC1004",
    consultationDates: ["2025-08-20", "2025-09-05"],
    testDates: ["2025-08-22"],
    pharmacyTimeline: "pharmacy_1004.pdf",
    ivfDashboard: "ivf_dashboard_1004.pdf",
    opuSummary: "opu_1004.pdf",
    intraOp: "intraop_1004.pdf",
    postOp: "postop_1004.pdf",
    prescriptions: ["Rx_1004.pdf"],
    reports: ["report_1004.pdf"],
  ),

  PatientRecord(
    id: 1005,
    wifeName: "Sunita Gupta",
    location: "Kolkata",
    wifePhone: "94******22",
    dupe: 1,
    assignedMembers: [
      DLNAssignedMember(
        profileImage: "https://randomuser.me/api/portraits/men/60.jpg",
        name: "Dr. Rajeev Sharma",
        lastActiveDate: "2025-08-18",
        email: "rajeev.sharma@example.com",
      ),
    ],
    status: "Egg Donor",
    source: "Referral",
    walkInDate: "2025-08-25",
    lastContact: "2025-09-08",
    created: "2025-08-18",
    action: "Case Closed",
    donorName: "Donor E",
    age: 34,
    wifePhoto: "https://randomuser.me/api/portraits/women/60.jpg",
    husbandPhoto: "https://randomuser.me/api/portraits/men/65.jpg",
    aadharWife: "xxxx-xxxx-5566",
    aadharHusband: "xxxx-xxxx-9900",
    marriageCertificate: "marriage_cert_1005.pdf",
    divorceDocument: "",
    childrenDetails: "1 Child",
    birthCertificate: "birth_cert_1005.pdf",
    panCard: "EFGHI5678J",
    mrdNumber: "MRD1005",
    artEnrolment: "ART2025-005",
    tvScan: "tvscan_1005.png",
    semenTest: "semen_1005.pdf",
    serology: "sero_1005.pdf",
    bbt: "bbt_1005.pdf",
    tft: "tft_1005.pdf",
    cardiacFitness: "cardiac_1005.pdf",
    ecg: "ecg_1005.pdf",
    informedConsent: "consent_1005.pdf",
    donorConsent: "donor_consent_1005.pdf",
    donorBond: "donor_bond_1005.pdf",
    recipientName: "Recipient E",
    recipientMrd: "REC1005",
    consultationDates: ["2025-08-28"],
    testDates: ["2025-09-02"],
    pharmacyTimeline: "pharmacy_1005.pdf",
    ivfDashboard: "ivf_dashboard_1005.pdf",
    opuSummary: "opu_1005.pdf",
    intraOp: "intraop_1005.pdf",
    postOp: "postop_1005.pdf",
    prescriptions: ["Rx_1005.pdf"],
    reports: ["report_1005.pdf"],
  ),

];

    List<PatientRecord> get users => _users;
   List<PatientRecord> get currentPageUsers {
    final start = currentPage * pageSize;
    final end = (start + pageSize > _users.length)
        ? _users.length
        : start + pageSize;
    return _users.sublist(start, end);
  }

  void setPageSize(int newSize) {
    pageSize = newSize;
    currentPage = 0; // reset when changed
    notifyListeners();
  }

  // ✅ Pagination controls
  void nextPage() {
    if ((currentPage + 1) * pageSize < users.length) {
      currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
      notifyListeners();
    }
  }

  void setSelectedValue(String? value) {
    _selectedValue = value;
    notifyListeners(); // updates UI
  }

  void setSelectedExportTypeValue(String? value) {
    _selectedValue = value;
    notifyListeners();
  }

  void setSelectedAction(String? action) {
    _selectedAction = action;
    if (action != null) {
      _performAction(action);
    }
    notifyListeners();
  }

  void _performAction(String action) {
    // Dummy onPressed actions
    switch (action) {
      case "Action 1":
        debugPrint("Action 1 executed ✅");
        break;
      case "Action 2":
        debugPrint("Action 2 executed ✅");
        break;
      case "Action 3":
        debugPrint("Action 3 executed ✅");
        break;
      case "Action 4":
        debugPrint("Action 4 executed ✅");
        break;
    }
  }
  /////////////////////////////////////////bulk action page data///////////////////////////////
  // is mass delete checked//

  void setIsMassDeleteChecked(bool value) {
    _isMassDeleteChecked = value;
    notifyListeners();
  }
  // is mark as lost checked//

  void setMarkAsLostChecked(bool value) {
    _isMarkAsLostChecked = value;
    notifyListeners();
  }

  //selected status//
  void setSelectedstatus(String? value) {
    _selectedstatus = value;
    print(_selectedstatus);

    notifyListeners();
  }

  //selected source//
  void setSelectedsources(String? value) {
    _selectedsources = value;
    print(_selectedsources);
    notifyListeners();
  }

  //selected Assigned//
  void setSelectedassignedPerson(String? value) {
    _selectedassignedperson = value;
    print(_selectedassignedperson);
  }

  ///selected tags
  void toggleItem(String item) {
    if (_selectedTags.contains(item)) {
      _selectedTags.remove(item);
    } else {
      _selectedTags.add(item);
    }
    notifyListeners();
  }

  ///is public   is private
  // ispublic//

  void setIsPublic(bool value) {
    _isPublic = value;
    notifyListeners();
  }
  // iscontactedtoday//

  void setIsPrivate(bool value) {
    _isPrivate = value;
    notifyListeners();
  }
}
