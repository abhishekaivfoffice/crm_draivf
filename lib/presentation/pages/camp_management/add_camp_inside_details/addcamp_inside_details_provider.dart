import 'dart:io';

import 'package:flutter/material.dart.';

class AddCampInsideProvider extends ChangeNotifier{
  final calenderDateController = TextEditingController();
  final campActivityController = TextEditingController();
  final areaCoveredDetailsController = TextEditingController();

  File? _selectedFile;

  File? get selectedFile => _selectedFile;
  void setFile(File file) {
    _selectedFile = file;
    notifyListeners();
  }
  void clearFile() {
    _selectedFile = null;
    notifyListeners();
  }
}