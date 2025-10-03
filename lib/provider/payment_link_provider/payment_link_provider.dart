import 'dart:io';

// import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart' show AssignedMember, User;
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/data/models/coursedata_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PaymentLinkProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int currentPage = 0;
  int pageSize = 10;
  bool get hasNextPage => (currentPage + 1) * pageSize < users.length;
  bool get hasPreviousPage => currentPage > 0;
  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  final List<String> _items = ["5", "10", "15", "20"];

  List<String> get items => _items;

  String? _selectedExportTypeValue;

  String? get selectedExportTypeValue => _selectedExportTypeValue;
  String? _selectedAction;
  String? get selectedAction => _selectedAction;
  final List<String> _actionItems = ["Excel", "CSV", "Pdf", "Print"];
  List<String> get actionItems => _actionItems;
  bool _showFilters = false;
  bool get showFilters => _showFilters;
  void toggleFilters() {
    _showFilters = !_showFilters;
    notifyListeners();
  }

  //filter values
  final List<String> _paymentstatus = ["Pending", "Partially Paid", "Paid"];
  List<String> get paymentstatus => _paymentstatus;

  String? _selectedPaymentStatus;
  String? get selectedPaymentStatus => _selectedPaymentStatus;
  //setzones
  void setPaymentStatus(String? status) {
    _selectedPaymentStatus = status;
    notifyListeners();
  }

  final TextEditingController dateRangeController = TextEditingController();

  final List<CourseDataModel> _users = [
    CourseDataModel(
      id: 4064,
      empId: "EMP100",
      photo:
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
      name: "Sowmya",
      phone: "98******19",
      city: "Chennai - Sholinganallur",
      access: "CHENNAI +10 more",
      assigned: "MS OG, NO RESPONSE - TEXTED IN WA",
      qualification: "Fellowship in Reproductive Medicine",
      status: "Offline",
      course: "Fellowship in Reproductive Medicine",
      source: "Affiliate Portals",
      createdDate: "08-09-2025",
    ),
    CourseDataModel(
      id: 4065,
      empId: "EMP101",
      photo:
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Ramesh Kumar",
      phone: "97******45",
      city: "Bangalore - Whitefield",
      access: "BANGALORE +5 more",
      assigned: "Interested - Follow Up",
      qualification: "MBBS, MD",
      status: "Online",
      course: "MD Pediatrics",
      source: "Direct Walk-in",
      createdDate: "09-09-2025",
    ),

    CourseDataModel(
      id: 4066,
      empId: "EMP102",
      photo:
          "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=761&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Anita Sharma",
      phone: "96******88",
      city: "Hyderabad - Gachibowli",
      access: "HYDERABAD",
      assigned: "Converted - Joined",
      qualification: "MBBS, DGO",
      status: "Active",
      course: "Diploma in Gynecology",
      source: "Referral",
      createdDate: "10-09-2025",
    ),

    CourseDataModel(
      id: 4067,
      empId: "EMP103",
      photo:
          "https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Deepak Singh",
      phone: "95******72",
      city: "Pune - Hinjewadi",
      access: "PUNE +3 more",
      assigned: "Not Interested - Closed",
      qualification: "MBBS",
      status: "Inactive",
      course: "General Medicine",
      source: "Online Ads",
      createdDate: "11-09-2025",
    ),

    CourseDataModel(
      id: 4068,
      empId: "EMP104",
      photo:
          "https://images.unsplash.com/photo-1506863530036-1efeddceb993?q=80&w=1044&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

      name: "Priya Nair",
      phone: "94******63",
      city: "Kochi - Kakkanad",
      access: "KOCHI",
      assigned: "Pending - Call Back Later",
      qualification: "MBBS, MS",
      status: "Offline",
      course: "MS Orthopedics",
      source: "Affiliate Portals",
      createdDate: "12-09-2025",
    ),
  ];
  List<CourseDataModel> get users => _users;
  List<CourseDataModel> get currentPageUsers {
    final start = currentPage * pageSize;
    final end =
        (start + pageSize > _users.length) ? _users.length : start + pageSize;
    return _users.sublist(start, end);
  }

  void setPageSize(int newSize) {
    pageSize = newSize;
    currentPage = 0; // reset when changed
    notifyListeners();
  }

  // ✅ Pagination controls
  void nextPage() {
    if ((currentPage + 1) * pageSize < users.length) {
      currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
      notifyListeners();
    }
  }

  void setSelectedValue(String? value) {
    _selectedValue = value;
    notifyListeners(); // updates UI
  }

  void setSelectedExportTypeValue(String? value) {
    _selectedValue = value;
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

  bool _isDialogOpen = false;

  bool get isDialogOpen => _isDialogOpen;

  void openDialog(BuildContext context) {
    _isDialogOpen = true;
    notifyListeners();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: const Text("Payment History"),
            content: Container(
              height: 160,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Sl NO : ",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        "01",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        "Date : ",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        "01-07-2025",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Divider(),

                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        "Payment Link Id : ",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        "plink://ytdgsaeujyf//hbghef",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Divider(),

                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        "Payment Status : ",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        "Pending",
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          color: Color.fromARGB(171, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  closeDialog();
                },
                child: const Text("Close"),
              ),
            ],
          ),
    );
  }

  void closeDialog() {
    _isDialogOpen = false;
    notifyListeners();
  }
}
