
import 'dart:io';

import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart' show AssignedMember, User;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class InlDataProvider extends ChangeNotifier {
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








  
final List<User> _users = [
    User(
      id: 119231,
      name: "Laxmi Sharma",
      branch: "Delhi",
      phone: "73******91",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Query",
      source: "Inbound Call",
      walkInDate: "2025-03-11",
      lastContact: "2025-03-15",
      created: "2 minutes ago",
    ),
    User(
      id: 119232,
      name: "Pooja Verma",
      branch: "Mumbai",
      phone: "88******45",
      dupe: 1,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Pending",
      source: "Website",
      walkInDate: "2025-02-05",
      lastContact: "2025-03-01",
      created: "5 minutes ago",
    ),
    User(
      id: 119233,
      name: "Ravi Patel",
      branch: "Ahmedabad",
      phone: "98******23",
      dupe: 0,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Closed",
      source: "Referral",
      walkInDate: "2025-03-02",
      lastContact: "2025-03-13",
      created: "10 minutes ago",
    ),
    User(
      id: 119234,
      name: "Simran Kaur",
      branch: "Chandigarh",
      phone: "79******11",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Follow-up",
      source: "Event",
      walkInDate: "2025-03-07",
      lastContact: "2025-03-15",
      created: "12 minutes ago",
    ),
    User(
      id: 119235,
      name: "Arjun Reddy",
      branch: "Hyderabad",
      phone: "91******66",
      dupe: 1,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Query",
      source: "Facebook",
      walkInDate: "2025-03-09",
      lastContact: "2025-03-15",
      created: "15 minutes ago",
    ),
    User(
      id: 119236,
      name: "Meera Iyer",
      branch: "Bangalore",
      phone: "95******22",
      dupe: 0,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Pending",
      source: "Google Ads",
      walkInDate: "2025-03-08",
      lastContact: "2025-03-14",
      created: "20 minutes ago",
    ),
    User(
      id: 119237,
      name: "Nikhil Joshi",
      branch: "Pune",
      phone: "99******33",
      dupe: 0,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Closed",
      source: "App",
      walkInDate: "2025-02-28",
      lastContact: "2025-03-10",
      created: "25 minutes ago",
    ),
    User(
      id: 119238,
      name: "Ananya Gupta",
      branch: "Lucknow",
      phone: "94******77",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Follow-up",
      source: "Walk-in",
      walkInDate: "2025-03-14",
      lastContact: "2025-03-15",
      created: "30 minutes ago",
    ),
    User(
      id: 119239,
      name: "Suresh Nair",
      branch: "Kochi",
      phone: "97******88",
      dupe: 1,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Query",
      source: "Referral",
      walkInDate: "2025-03-06",
      lastContact: "2025-03-12",
      created: "35 minutes ago",
    ),
    User(
      id: 119240,
      name: "Kavya Menon",
      branch: "Trivandrum",
      phone: "90******99",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Closed",
      source: "Instagram",
      walkInDate: "2025-03-01",
      lastContact: "2025-03-13",
      created: "40 minutes ago",
    ),
    // ---------- SECOND PAGE (11-20) ----------
    User(
      id: 119241,
      name: "Rajesh Kumar",
      branch: "Delhi",
      phone: "98******55",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Follow-up",
      source: "Event",
      walkInDate: "2025-03-10",
      lastContact: "2025-03-15",
      created: "45 minutes ago",
    ),
    User(
      id: 119242,
      name: "Sneha Desai",
      branch: "Surat",
      phone: "92******66",
      dupe: 0,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Pending",
      source: "Google Ads",
      walkInDate: "2025-03-08",
      lastContact: "2025-03-12",
      created: "50 minutes ago",
    ),
    User(
      id: 119243,
      name: "Varun Malhotra",
      branch: "Delhi",
      phone: "93******44",
      dupe: 1,
     assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Query",
      source: "Facebook",
      walkInDate: "2025-03-11",
      lastContact: "2025-03-14",
      created: "55 minutes ago",
    ),
    User(
      id: 119244,
      name: "Ishita Roy",
      branch: "Kolkata",
      phone: "96******88",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Closed",
      source: "Website",
      walkInDate: "2025-03-05",
      lastContact: "2025-03-12",
      created: "1 hour ago",
    ),
    User(
      id: 119245,
      name: "Deepak Sharma",
      branch: "Jaipur",
      phone: "97******33",
      dupe: 0,
     assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Follow-up",
      source: "Walk-in",
      walkInDate: "2025-03-14",
      lastContact: "2025-03-15",
      created: "1 hour 5 minutes ago",
    ),
    User(
      id: 119246,
      name: "Aditi Bansal",
      branch: "Noida",
      phone: "91******99",
      dupe: 1,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Query",
      source: "Instagram",
      walkInDate: "2025-03-09",
      lastContact: "2025-03-11",
      created: "1 hour 10 minutes ago",
    ),
    User(
      id: 119247,
      name: "Karan Kapoor",
      branch: "Delhi",
      phone: "98******22",
      dupe: 0,
       assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Closed",
      source: "Referral",
      walkInDate: "2025-03-02",
      lastContact: "2025-03-13",
      created: "1 hour 20 minutes ago",
    ),
    User(
      id: 119248,
      name: "Shalini Mishra",
      branch: "Lucknow",
      phone: "90******77",
      dupe: 0,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Pending",
      source: "App",
      walkInDate: "2025-03-06",
      lastContact: "2025-03-14",
      created: "1 hour 25 minutes ago",
    ),
    User(
      id: 119249,
      name: "Mohit Chauhan",
      branch: "Chandigarh",
      phone: "94******55",
      dupe: 0,
      assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Query",
      source: "Inbound Call",
      walkInDate: "2025-03-03",
      lastContact: "2025-03-12",
      created: "1 hour 30 minutes ago",
    ),
    User(
      id: 119250,
      name: "Tanya Agarwal",
      branch: "Delhi",
      phone: "93******11",
      dupe: 0,
     assignedMembers: [
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      name: "Naveen Yadav",
      lastActiveDate: "2025-03-15",
      email: "naveen.yadav@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Ritika Verma",
      lastActiveDate: "2025-03-12",
      email: "ritika.verma@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/men/33.jpg",
      name: "Amit Singh",
      lastActiveDate: "2025-03-10",
      email: "amit.singh@example.com",
    ),
    AssignedMember(
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      name: "Shreya Kapoor",
      lastActiveDate: "2025-03-09",
      email: "shreya.kapoor@example.com",
    ),
  ],
      status: "Follow-up",
      source: "Event",
      walkInDate: "2025-03-12",
      lastContact: "2025-03-15",
      created: "1 hour 35 minutes ago",
    ),
  ];
    List<User> get users => _users;
   List<User> get currentPageUsers {
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
