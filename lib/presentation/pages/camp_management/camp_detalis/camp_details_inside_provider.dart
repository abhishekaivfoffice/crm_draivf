import 'package:flutter/material.dart';

class CampDetailsInsidePageProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _campList = [
    {
      "Zone": "CHENNAI",
      "Branch": "Chennai - Urapakkam",
      "Camp Type": "Inhouse",
      "campLocation": "K S PHYSIOTHERAPY CLINIC",
      "Dr. Name": "Dr. Shruthi",
      "Camp Date": "2025-02-09",
      "Location": "Dr. Aravind's IVF - Best Fertility and Pregnancy Centre",
      "Camp Incharge": "",
    },{
      "Zone": "madurai",
      "Branch": "Chennai - Urapakkam",
      "Camp Type": "Inhouse",
      "campLocation": "K S PHYSIOTHERAPY CLINIC",
      "Dr. Name": "Dr. Shruthi",
      "Camp Date": "2025-02-09",
      "Location": "Dr. Aravind's IVF - Best Fertility and Pregnancy Centre",
      "Camp Incharge": "",
    },


  ];

  // Get all camps
  List<Map<String, dynamic>> get campList => List.unmodifiable(_campList);

  // Add a new camp
  void addCamp(Map<String, dynamic> newCamp) {
    _campList.add(newCamp);
    notifyListeners();
  }

  // Get camp by index
  Map<String, dynamic> getCampDetails(int index) {
    return _campList[index];
  }
}
