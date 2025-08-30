import 'package:flutter/material.dart';
import '../../../../data/models/enquiry_user_model.dart';

class HomeEnquiryProvider extends ChangeNotifier {
  // page size for pagination / UI
  int pageSize = 10;

  // export action selection
  String? _selectedAction;
  String? get selectedAction => _selectedAction;

  // export options
  final List<String> actionItems = ["Excel", "CSV", "Pdf", "Print"];

  // sample data (replace with API data)
  final List<Enquiry> enquiries = [
    Enquiry(
      id: 5353,
      name: "test_data",
      phone: "86******42",
      source: "Inbound Call",
      email: "testdata@gmail.com",
      createdDate: "2024-12-02 07:31:05",
      isConverted: true,
    ),
    Enquiry(
      id: 5352,
      name: "Valiyullah",
      phone: "87******09",
      source: "WhatsApp",
      email: "valiyullah@gmail.com",
      createdDate: "2024-07-19 10:54:52",
    ),
    Enquiry(
      id: 5351,
      name: "kk trichy",
      phone: "97******42",
      source: "WhatsApp",
      email: "kktrichy@gmail.com",
      createdDate: "2024-07-19 10:54:52",
    ),
    Enquiry(
      id: 5350,
      name: "bb trichy",
      phone: "99******26",
      source: "WhatsApp",
      email: "bbtrichy@gmail.com",
      createdDate: "2024-07-19 10:54:52",
    ),
  ];

  // change page size
  void setPageSize(int newSize) {
    pageSize = newSize;
    notifyListeners();
  }

  // select export option
  void setSelectedAction(String? action) {
    _selectedAction = action;
    if (action != null) _performAction(action);
    notifyListeners();
  }

  void _performAction(String action) {
    // placeholder for real export logic
    debugPrint("Performing export: $action");
  }

  // toggle converted state for a lead
  void toggleConverted(Enquiry e) {
    e.isConverted = !e.isConverted;
    notifyListeners();
  }

  // delete enquiry
  void deleteEnquiry(Enquiry e) {
    enquiries.remove(e);
    notifyListeners();
  }
}
