import 'package:flutter/cupertino.dart';

class NewCampProvider extends ChangeNotifier {
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

  String? _selectedpreferredlocation;
  String? get selectedpreferredlocation => _selectedpreferredlocation;

  void setSelectedPreferredLocation(String? value) {
    _selectedpreferredlocation = value;
    print(_selectedpreferredlocation);
    notifyListeners();
  }

  final List<String> _camptype = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get campType => _camptype;
  String? _selectedCampType;
  String? get selectedCampType => _selectedCampType;
  void setSelectedcampType(String? value) {
    _selectedCampType = value;
    print(_camptype);
    notifyListeners();
  }

  final marriageDateController = TextEditingController();
  final campLocationController = TextEditingController();
  final drnNameController = TextEditingController();
  final campInChargeController = TextEditingController();
  final mapLocationController = TextEditingController();
}
