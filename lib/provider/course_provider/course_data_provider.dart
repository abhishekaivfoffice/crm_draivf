
import 'dart:io';

// import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart' show AssignedMember, User;
import 'package:crm_draivfmobileapp/data/models/coursedata_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CourseDataProvider extends ChangeNotifier {
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








  
final List<CourseDataModel> _users = [
  CourseDataModel(
    id: 4064,
    empId: "EMP100",
    photo:"https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
    name: "Sowmya",
    phone: "98******19",
    city: "Chennai - Sholinganallur",
    access: "CHENNAI +10 more",
    assigned: "MS OG, NO RESPONSE - TEXTED IN WA",
    qualification: "Fellowship in Reproductive Medicine",
    status: "Offline",
    course: "Fellowship in Reproductive Medicine",
    source: "Affiliate Portals",
    createdDate: "08-09-2025",
  ),
   CourseDataModel(
  id: 4065,
  empId: "EMP101",
  photo: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  name: "Ramesh Kumar",
  phone: "97******45",
  city: "Bangalore - Whitefield",
  access: "BANGALORE +5 more",
  assigned: "Interested - Follow Up",
  qualification: "MBBS, MD",
  status: "Online",
  course: "MD Pediatrics",
  source: "Direct Walk-in",
  createdDate: "09-09-2025",
),

CourseDataModel(
  id: 4066,
  empId: "EMP102",
  photo: "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  name: "Anita Sharma",
  phone: "96******88",
  city: "Hyderabad - Gachibowli",
  access: "HYDERABAD",
  assigned: "Converted - Joined",
  qualification: "MBBS, DGO",
  status: "Active",
  course: "Diploma in Gynecology",
  source: "Referral",
  createdDate: "10-09-2025",
),

CourseDataModel(
  id: 4067,
  empId: "EMP103",
  photo: "https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  name: "Deepak Singh",
  phone: "95******72",
  city: "Pune - Hinjewadi",
  access: "PUNE +3 more",
  assigned: "Not Interested - Closed",
  qualification: "MBBS",
  status: "Inactive",
  course: "General Medicine",
  source: "Online Ads",
  createdDate: "11-09-2025",
),

CourseDataModel(
  id: 4068,
  empId: "EMP104",
    photo: "https://images.unsplash.com/photo-1506863530036-1efeddceb993?q=80&w=1044&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

  name: "Priya Nair",
  phone: "94******63",
  city: "Kochi - Kakkanad",
  access: "KOCHI",
  assigned: "Pending - Call Back Later",
  qualification: "MBBS, MS",
  status: "Offline",
  course: "MS Orthopedics",
  source: "Affiliate Portals",
  createdDate: "12-09-2025",
),


  ];
    List<CourseDataModel> get users => _users;
   List<CourseDataModel> get currentPageUsers {
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
