import 'dart:io';

import 'package:flutter/material.dart';

class JLNAddNewTaskProvider extends ChangeNotifier {
  final subjectController = TextEditingController();
  final startDateController = TextEditingController();
  final dueDateController = TextEditingController();
    final repeateverycountController = TextEditingController();
        final totalcyclecountController = TextEditingController();
    final taskDescriptionController = TextEditingController();
  File? _selectedFile;

  File? get selectedFile => _selectedFile;
  //choose file
  void setFile(File file) {
    _selectedFile = file;
    notifyListeners();
  }

  /////priority option
  final List<String> _priority = ["Low", "Medium", "High", "Urgent"];
  List<String> get priority => _priority;
  String? _selectedpriority;
  String? get selectedpriority => _selectedpriority;
  //selected status//
  void setSelectedpriority(String? value) {
    _selectedpriority = value;

    notifyListeners();
  }

  /////repeat every option
  final List<String> _repeateveryoptions = [
    "Week",
    "2 Weeks  ",
    "1 Month",
    "2 Months",
    "3 Months",
    "6 Months",
    "1 Year",
    "Custom",
  ];
  List<String> get repeateveryoptions => _repeateveryoptions;
  String? _selectedrepeateveryoption;
  String? get selectedrepeateveryoption => _selectedrepeateveryoption;
  bool _isCustomSelected = false;
  bool get isCustomSelected => _isCustomSelected;

  void setSelectedrepeateveryoption(String? value) {
    _selectedrepeateveryoption = value;
     // Check if "Custom" is selected
    if (value == "Custom") {
      _isCustomSelected = true;
    } else {
      _isCustomSelected = false;
    }

    notifyListeners();
  }

  /////repeat every custom option
  final List<String> _repeateverycustomoptions = [
    "Day(s)",
    "Week(s)",
    "Month(s)",
    "Year(s)",
 
  ];
  List<String> get repeateverycustomoptions => _repeateverycustomoptions;
  String? _selectedrepeateverycustomoption;
  String? get selectedrepeateverycustomoption => _selectedrepeateverycustomoption;

  void setSelectedrepeateverycustomoption(String? value) {
    _selectedrepeateverycustomoption = value;


    notifyListeners();
  }
 /////leads option
  final List<String> _leadsoptions = [
    "Lead 1",
    "Lead 2",
    "Lead 3",
    "Lead 4",
 
  ];
  List<String> get leadsoptions => _leadsoptions;
  String? _selectedleadsoption;
  String? get selectedleadsoption => _selectedleadsoption;

  void setSelectedLeadsOption(String? value) {
    _selectedleadsoption = value;


    notifyListeners();
  }
   /////Assignee  option
  final List<String> _assigneeoptions = [
    "Follower 1",
    "Follower 2",
    "Follower 3",
    "Follower 4",
 
  ];
  List<String> get assigneeoptions => _assigneeoptions;
  String? _assigneeoption;
  String? get selectedassigneeoption => _assigneeoption;

  void setSelectedAssigneeOption(String? value) {
    _assigneeoption = value;


    notifyListeners();
  }








   /////followers option
  final List<String> _followersoptions = [
    "Follower 1",
    "Follower 2",
    "Follower 3",
    "Follower 4",
 
  ];
  List<String> get followeroptions => _followersoptions;
  String? _selectedfolloweroption;
  String? get selectedfolloweroption => _selectedfolloweroption;

  void setSelectedFollowerOption(String? value) {
    _selectedfolloweroption = value;


    notifyListeners();
  }







  bool _ispublic = false;
  bool get ispublic => _ispublic;

  void setispublic(bool value) {
    _ispublic = value;
    notifyListeners();
  }
  bool _isInfinity = true;
  TextEditingController totalCyclesController = TextEditingController();

  bool get isInfinity => _isInfinity;

  void toggleInfinity(bool? value) {
    _isInfinity = value ?? true;
    if (_isInfinity) {
      totalCyclesController.clear(); // clear text if infinity selected
    }
    notifyListeners();
  }
   //Tags
  final List<String> _tags = ["Tag1", "Tag2", "Tag3", "Tag4", "Tag5"];
  List<String> get tags => _tags;
  final List<String> _selectedTags = [];
  List<String> get selectedTags => _selectedTags;

  ///selected tags
  void toggleItem(String item) {
    if (_selectedTags.contains(item)) {
      _selectedTags.remove(item);
    } else {
      _selectedTags.add(item);
    }
    notifyListeners();
  }



}
