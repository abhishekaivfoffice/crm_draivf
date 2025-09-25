import 'dart:io';

import 'package:flutter/material.dart';

class CourseAddLeadProvider extends ChangeNotifier {
  //course lead provider
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final qualificationController = TextEditingController();
  final employeeidController = TextEditingController();

  ////preferred locations
  final List<String> _locations = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get locations => _locations;
  String? _selectedlocation;
  String? get selectedlocation => _selectedlocation;
  //selected location
  void setSelectedLocation(String? value) {
    _selectedlocation = value;

    notifyListeners();
  }

  //course
  final List<String> _course = [
    "Course121",
    "Course122",
    "Course123",
    "Course124",
    "Course125",
    "Course126",
    "Course127",
  ];
  List<String> get course => _course;
  String? _selectedcourse;
  String? get selectedCourse => _selectedcourse;
  //selected location
  void setSelectedCourse(String? value) {
    _selectedcourse = value;

    notifyListeners();
  }

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

  String? _selectedsources;
  String? get selectedsources => _selectedsources;

  //selected source//
  void setSelectedsources(String? value) {
    _selectedsources = value;
    notifyListeners();
  }

  /////Registration fee
  final List<String> _registrationfee = ["Paid", "Not Paid", "Not Applicable"];
  List<String> get registrationFee => _registrationfee;

  String? _selectedregfee;
  String? get selectedregfee => _selectedregfee;

  //selected reg fee
  void setSelectedregfee(String? value) {
    _selectedregfee = value;
    notifyListeners();
  }

  /////Registration fee
  final List<String> _status = ["Online", "Offline", "Hybrid"];
  List<String> get status => _status;

  String? _selectedstatus;
  String? get selectedstatus => _selectedstatus;

  //selected reg fee
  void setSelectedstat(String? value) {
    _selectedstatus = value;
    notifyListeners();
  }

  /////Assigned options
  final List<String> _assigned = ["Durga IVF"];
  List<String> get assigned => _assigned;

  String? _selectedassigned;
  String? get selectedassigned => _selectedassigned;

  //selected Assigned//
  void setSelectedassigned(String? value) {
    _selectedassigned = value;
    print(_selectedassigned);

    notifyListeners();
  }

  /////interest status options
  final List<String> _intereststatus = [
    "Interested",
    "Not Interested",
    "Not Yet Confirmed",
  ];
  List<String> get interestStatus => _intereststatus;

  String? _selectedintereststatus;
  String? get selectedintereststatus => _selectedintereststatus;

  //selected Assigned//
  void setSelectedintereststatus(String? value) {
    _selectedintereststatus = value;

    notifyListeners();
  }

  /////loan required status
  final List<String> _loanrequired = ["Yes", "No"];
  List<String> get loanrequired => _loanrequired;

  String? _selectedloanrequiredstatus;
  String? get selectedloanrequiredstatus => _selectedloanrequiredstatus;

  //selected Assigned//
  void setSelectedLoanrequiredstatus(String? value) {
    _selectedloanrequiredstatus = value;

    notifyListeners();
  }

  File? _selectedFile;

  File? get selectedFile => _selectedFile;

  //choose file
  void setFile(File file) {
    _selectedFile = file;
    notifyListeners();
  }

  ////dummy data for edit lead screen///
  void loadDummyLead() {
    emailController.text = "anitha@example.com";

    _selectedstatus = "Interested";
    _selectedsources = "Google";
    _selectedassigned = "Yamini 12767";
    _selectedlocation = "Chennai - Sholinganallur";

    notifyListeners();
  }
}
