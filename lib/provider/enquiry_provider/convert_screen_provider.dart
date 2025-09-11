import 'package:flutter/material.dart';

class ConvertScreenProvider extends ChangeNotifier {
  final List<String> _preferredlocations = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get preferredlocations => _preferredlocations;
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
  final List<String> _treatment = [
    "Consulting",
    "Infertility Tests",
    "Natural",
    "IUI",
    "ICSI",
    "IVF",
    "Surrogacy",
  ];
  List<String> get treatment => _treatment;

  String? _selectedpreferredlocation;
  String? get selectedpreferredlocation => _selectedpreferredlocation;

  String? _selectedstatus;
  String? get selectedstatus => _selectedstatus;

  void setSelectedPreferredLocation(String? value) {
    _selectedpreferredlocation = value;
    print(_selectedpreferredlocation);

    notifyListeners();
  }

  String? _selectedtreatment;
  String? get selectedtreatment => _selectedtreatment;

  void setSelectedtreatment(String? value) {
    _selectedtreatment = value;
    print(_selectedtreatment);
    notifyListeners();
  }

  void setSelectedstatus(String? value) {
    _selectedstatus = value;
    print(_selectedstatus);

    notifyListeners();
  }


  final wifeNameController = TextEditingController();
  final husbandNameController = TextEditingController();
  final wifeAgeController = TextEditingController();
  final husbandNumberController = TextEditingController();
  final wifeNumberController = TextEditingController();
  final husbandAgeController = TextEditingController();
  final sourceController = TextEditingController();
}
