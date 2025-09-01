import 'package:flutter/material.dart';

class EditEnquiryProvider extends ChangeNotifier{
  final List<String> _source = [
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
  List<String> get source => _source;
  String? _selectedsources;
  String? get selectedsources => _selectedsources;

  void setSelectedsources(String? value) {
    _selectedsources = value;
    print(_selectedsources);
    notifyListeners();
  }






  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailAddressController = TextEditingController();



}