import 'package:flutter/cupertino.dart';

class AssignedMemberProfileProvider extends ChangeNotifier {
  int currentPage = 0;
  int pageSize = 10;
  bool get hasPreviousPage => currentPage > 0;

  String? _selectedExportTypeValue;
  String? get selectedExportTypeValue => _selectedExportTypeValue;
  String? _selectedAction;
  String? get selectedAction => _selectedAction;
  final List<String> _actionItems = ["Excel", "CSV", "Pdf", "Print"];

  
  List<String> get actionItems => _actionItems;
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
