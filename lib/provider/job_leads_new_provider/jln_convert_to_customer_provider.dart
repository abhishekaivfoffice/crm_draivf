import 'package:flutter/material.dart';

class JlNConvertToCustomerProvider extends ChangeNotifier {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final positionController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipcodeController = TextEditingController();
  final passwordController = TextEditingController();
  bool _sendSetPasswordEmail = false;
  bool get sendSetPasswordEmail => _sendSetPasswordEmail;

  void setSendsetPasswordEmail(bool value) {
    _sendSetPasswordEmail = value;
    notifyListeners();
  }

  bool _notSendWelcomeEmail = false;
  bool get notSendWelcomeEmailEmail => _notSendWelcomeEmail;

  void setNotsendWelcomeEmail(bool value) {
    _notSendWelcomeEmail = value;
    notifyListeners();
  }
}
