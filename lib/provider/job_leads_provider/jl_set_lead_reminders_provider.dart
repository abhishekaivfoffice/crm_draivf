import 'package:flutter/widgets.dart';

class JLSetLeadRemindersProvider extends ChangeNotifier{
    final reminderdatetimeController = TextEditingController();
        final descriptionController = TextEditingController();

  /////priority option
  final List<String> _remindersto = ["aswini", "athira", "akhil", "karthick"];
  List<String> get remindersto => _remindersto;
  String? _selectedremindersto;
  String? get selectedremindersto => _selectedremindersto;
  //selected status//
  void setSelecteremindersdo(String? value) {
    _selectedremindersto = value;

    notifyListeners();
  }

  bool _sendemailforreminder = false;
  bool get sendemailforreminder => _sendemailforreminder;

  void setsendemailforreminder(bool value) {
    _sendemailforreminder = value;
    notifyListeners();
  }
}