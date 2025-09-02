import 'package:flutter/cupertino.dart';

import '../../../../data/models/camp_user_model.dart';

class CampUserDetailsProvider extends ChangeNotifier {
  final marriageDateController = TextEditingController();

  int pageSize = 10;
  int currentPage = 0;
  String? _selectedAction;
  bool get showFilters => _showFilters;

  final List<String> _zone = [
    "CHENNAI",
    "KARNATAKA",
    "CENTRAL TN",
    "KERALA",
    "SOUTH TN",
    "WEST 1 TN",
    "AP & VELLORE",
    "WEST 2 TN",
  ];
  List<String> get zone => _zone;
  String? _selectedzone;
  String? get selectedzone => _selectedzone;

  void setSelectedzone(String? value) {
    _selectedzone = value;
    print(_selectedzone);
    notifyListeners();
  }

  final List<String> _location = [
    "Chennai",
    "Bangalore",
    "Hyderabad",
    "Coimbatore",
    "Madurai",
    "Kerala",
    "Pune",
    "Mumbai",
    "Delhi",
    "Kolkata",
  ];

  final List<Map<String, dynamic>> campList = [
    {
      "branch": "WEST 2 TN Erode",
      "campType": "External",
      "campDate": "2024-12-22",
      "campLocation": "K S PHYSIOTHERAPY CLINIC",
      "drName": "Dr. Priya",
      "campIncharge": "",
      "createdDate": "2024-12-21 09:15:24",
      "deatils": "2024-12-21 09:15:24",
      "QR": "2024-12-21 09:15:24",
      "action": "2024-12-21 09:15:24",
    },
    {
      "branch": "WEST 1 TN Coimbatore - Thudiyalur",
      "campType": "Inhouse",
      "campDate": "2024-12-22",
      "campLocation": "HINDUSTHAN HOSPITAL",
      "drName": "Dr. Deepa",
      "campIncharge": ".",
      "createdDate": "2024-12-21 09:14:15",
      "deatils": "2024-12-21 09:15:24",
      "QR": "2024-12-21 09:15:24",
      "action": "2024-12-21 09:15:24",
    },
    {
      "branch": "WEST 1 TN Coimbatore - Thudiyalur",
      "campType": "Inhouse",
      "campDate": "2024-12-22",
      "campLocation": "HINDUSTHAN HOSPITAL",
      "drName": "Dr. Deepa",
      "campIncharge": ".",
      "createdDate": "2024-12-21 09:14:15",
      "deatils": "2024-12-21 09:15:24",
      "QR": "2024-12-21 09:15:24",
      "action": "2024-12-21 09:15:24",
    },
    {
      "branch": "WEST 1 TN Coimbatore - Thudiyalur",
      "campType": "Inhouse",
      "campDate": "2024-12-22",
      "campLocation": "HINDUSTHAN HOSPITAL",
      "drName": "Dr. Deepa",
      "campIncharge": ".",
      "createdDate": "2024-12-21 09:14:15",
      "deatils": "2024-12-21 09:15:24",
      "QR": "2024-12-21 09:15:24",
      "action": "2024-12-21 09:15:24",
    },
  ];

  List<String> get location => _location;
  String? _selectedlocation;
  String? get selectedlocation => _selectedlocation;

  void setSelectedlocation(String? value) {
    _selectedlocation = value;
    print(_selectedlocation);
    notifyListeners();
  }

  final List<String> _camptype = ["InHouse", "External"];
  List<String> get campeType => _camptype;
  String? _selectedcampeType;
  String? get selectedcampeType => _selectedcampeType;

  void setSelectedcampeType(String? value) {
    _selectedcampeType = value;
    print(_selectedcampeType);
    notifyListeners();
  }

  final List<String> _items = ["5", "10", "15", "20"];

  List<String> get items => _items;

  void setPageSize(int newSize) {
    pageSize = newSize;
    currentPage = 0; // reset when changed
    notifyListeners();
  }

  void setSelectedAction(String? action) {
    _selectedAction = action;
    if (action != null) {
      _performAction(action);
    }
    notifyListeners();
  }

  String? get selectedAction => _selectedAction;
  final List<String> _actionItems = ["Excel", "CSV", "Pdf", "Print"];

  List<String> get actionItems => _actionItems;

  bool _showFilters = false;
  void toggleFilters() {
    _showFilters = !_showFilters;
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
}
