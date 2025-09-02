import 'package:flutter/material.dart';

class AddCampInsideActionProvider extends ChangeNotifier {
  final List<String> _branch = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get branch => _branch;

  String? _selectedbranch;
  String? get selectedbranch => _selectedbranch;

  void setSelectedbranch(String? value) {
    _selectedbranch = value;
    print(_selectedbranch);
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


  List<String> get location => _location;
  String? _selectedlocation;
  String? get selectedlocation => _selectedlocation;

  void setSelectedlocation(String? value) {
    _selectedlocation = value;
    print(_selectedlocation);
    notifyListeners();
  }

  final calenderDateController = TextEditingController();
  final drNameController = TextEditingController();
  final campInChargeNameController = TextEditingController();
  final gMapLocationNameController = TextEditingController();

}
