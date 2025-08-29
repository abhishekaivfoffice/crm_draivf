// import 'package:flutter/material.dart';

// class DomesticLeadsHomeprovider with ChangeNotifier {
//   // final List<String> _zones = [
//   //   "CHENNAI",
//   //   "KARNATAKA",
//   //   "CENTRAL TN",
//   //   "KERALA",
//   //   "SOUTH TN",
//   //   "WEST 1 TN",
//   //   "AP & VELLORE",
//   //   "WEST 2 TN",
//   //   "Not Specified",
//   // ];
//   // List<String> get zones => _zones;
//   // //branches
//   // final List<String> _branches = [
//   //   "Aathur",
//   //   "Bengaluru - Electronic City",
//   //   "Bengaluru - Hebbal",
//   //   "Bengaluru - T Dasarahalli",
//   //   "Bengaluru - Konanakunte",
//   //   "Chengalpattu",
//   //   "Chennai - Madipakkam",
//   //   "Chennai - Sholinganallur",
//   //   "Chennai - Tambaram",
//   //   "Chennai - Thiruvallur",
//   //   "Chennai - Urapakkam",
//   //   "Chennai - Vadapalani",
//   //   "Coimbatore - Ganapathy",
//   // ];
//   // List<String> get branches => _branches;
//   // /////status option
//   // final List<String> _status = [
//   //   "New Lead",
//   //   "Interested",
//   //   "Walk-in/Video Scheduled",
//   //   "Walk-in/Video Done",
//   //   "Treatment Started",
//   //   "Treatment Done",
//   //   "Not Interested",
//   //   "Junk",
//   //   "Not Picked up",
//   //   "Call Later",
//   //   "Walk-in Dropped",
//   //   "Treatment Dropped",
//   // ];
//   // List<String> get status => _status;

//   // final List<String> _agentName = [
//   //   "Yamini 12767",
//   //   "vishali TPR",
//   //   "vignesh CRM",
//   //   "Veera Pandi",
//   //   "Vanitha 12383",
//   //   "Super Admin",
//   //   "Sudhakar L",
//   //   "SREE HARISH RG",
//   //   "sorna TPR",
//   //   "Siva S",
//   //   "Saranya S",
//   //   "Santhiya 12679",
//   // ];
//   // List<String> get agentName => _agentName;
//   // /////socialmedia options
//   // final List<String> _socialMedia = [
//   //   "Affiliate Portals",
//   //   "Camp",
//   //   "Dropout",
//   //   "Ebook",
//   //   "Facebook",
//   //   "Google",
//   //   "Hotstar",
//   //   "Inbound Call",
//   //   "Justdial",
//   //   "Oneindia",
//   //   "Practo",
//   //   "Quora",
//   // ];
//   // List<String> get socialMedia => _socialMedia;
//   // ////digital media options
//   // final List<String> _digitalMedia = [
//   //   "Affiliate Portals",
//   //   "Camp",
//   //   "Dropout",
//   //   "Ebook",
//   //   "Facebook",
//   //   "Google",
//   //   "Hotstar",
//   //   "Inbound Call",
//   //   "Justdial",
//   //   "Oneindia",
//   //   "Practo",
//   //   "Quora",
//   // ];
//   // List<String> get digitalmedia => _digitalMedia;
//   // ////date filter
//   // final List<String> _dateFilter = [
//   //   "Walked In Date",
//   //   "Camp",
//   //   "Dropout",
//   //   "Ebook",
//   //   "Facebook",
//   // ];
//   //   List<String> get dateFilter => _dateFilter;


 


//   // final TextEditingController dateRangeController = TextEditingController();

//   // List<String> _selectedZones = [];
//   // List<String> get selectedZones => _selectedZones;

//   // List<String> _selectedBranches = [];
//   // List<String> get selectedBranches => _selectedBranches;

//   // List<String> _selectedStatus = [];
//   // List<String> get selectedStatus => _selectedStatus;

//   // String? _selectedAgentName;
//   // String? get selectedAgentName => _selectedAgentName;
//   // String? _selectedSocialMedia;
//   // String? get selectedSocialMedia => _selectedSocialMedia;
//   // String? _selectedDigitalMedia;
//   // String? get selectedDigitalMedia => _selectedDigitalMedia;
//   // String? _selectedDateFilter;
//   // String? get selectedDateFilter => _selectedDateFilter;

//   //setzones
//   void setZones(List<String> zones) {
//     _selectedZones = zones;
//     notifyListeners();
//   }

//   void setBranches(List<String> branches) {
//     _selectedBranches = branches;
//     notifyListeners();
//   }

//   void setStatus(List<String> status) {
//     _selectedStatus = status;
//     notifyListeners();
//   }

//   void setAgentNames(String? agentnames) {
//     _selectedAgentName = agentnames;
//     notifyListeners();
//   }

//   void setSocialMedia(String? socialmedia) {
//     _selectedSocialMedia = socialmedia;
//     notifyListeners();
//   }

//   void setDigitalMedia(String? digitalMedia) {
//     _selectedDigitalMedia = digitalMedia;
//     notifyListeners();
//   }

//   void setDateFilter(String? datefilter) {
//     _selectedDateFilter = datefilter;
//     notifyListeners();
//   }
// }
