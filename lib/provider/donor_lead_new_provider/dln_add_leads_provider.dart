import 'dart:io';

import 'package:flutter/material.dart';

class DLNAddLeadsProvider extends ChangeNotifier {
  /////status option
  final List<String> _status = ["Donor"];
  List<String> get status => _status;

  /////sources options
  final List<String> _sources = [
    "Affiliate Portals",
    "Camp",
    "Dropout",
    "Ebook",
    "Facebook",
    "Google",
    "Hotstar",
    "Inbound Call",
    "Justdial",
    "Oneindia",
    "Practo",
    "Quora",
  ];
  List<String> get sources => _sources;

  /////Assigned options
  final List<String> _assigned = [
    "Yamini 12767",
    "vishali TPR",
    "vignesh CRM",
    "Veera Pandi",
    "Vanitha 12383",
    "Super Admin",
    "Sudhakar L",
    "SREE HARISH RG",
    "sorna TPR",
    "Siva S",
    "Saranya S",
    "Santhiya 12679",
  ];
  List<String> get assigned => _assigned;

  /////Attribute option/////

  final List<String> _attribute = [
    "Facebook",
    "Google",
    "Youtube",
    "Outdoor Banner",
    "Sun TV",
    "K TV",
    "Sun Music",
    "Kalaingar TV",
    "Instagram",
    "News Paper",
    "Doctor Referral",
    "Friend Referral",
    "George_Annur_09-04-2023",
    "George_Karamadai_19-03-2023",
    "George_Ganapathy_05-03-2023",
    "Treatment Dropped",
    "ambur",
  ];
  List<String> get attribute => _attribute;
  ////preferred locations
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
  ////simulation locations
  final List<String> _simulationlocations = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get simulationlocation => _simulationlocations;
  ////case locations
  final List<String> _caselocations = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get caselocation => _caselocations;

  ///profile group
  final List<String> _profileGroup = [
    "Consulting",
    "Infertility Tests",
    "Natural",
    "IUI",
    "ICSI",
    "IVF",
    "Surrogacy",
  ];
  List<String> get profileGroup => _profileGroup;
  //for fertility treatment
  final List<String> _forFertlityTreatment = ["New", "Old"];
  List<String> get forFertilityTreatment => _forFertlityTreatment;
  //prefered time to call
  //for fertility treatment
  final List<String> _preferedTime = [
    "7am to 11am",
    "11am to 3pm",
    "3pm to 7pm",
    "7pm to 11pm",
  ];
  List<String> get preferedTime => _preferedTime;
  //prefered language
  final List<String> _preferedLanguage = [
    "Tamil",
    "English",
    "Kannada",
    "Hindi",
    "Telugu",
    "Malayalam",
  ];
  List<String> get preferedLanguage => _preferedLanguage;
  // //Tags
  // final List<String> _tags = ["Tag1", "Tag2", "Tag3", "Tag4", "Tag5"];
  // List<String> get tags => _tags;

  //controllers//
  final wifeNameController = TextEditingController();
  final wifeNumberController = TextEditingController();
  final addressController = TextEditingController();
  final husbandNameController = TextEditingController();
  final marriageDateController = TextEditingController();
  final marriedYearsController = TextEditingController();
  final wifeAgeController = TextEditingController();
  final husbandNumberController = TextEditingController();
  final husbandAgeController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipcodeController = TextEditingController();
  final agentnameController = TextEditingController();
  final agentnumberController = TextEditingController();
  final walkinDateController = TextEditingController();
  final descriptionController = TextEditingController();
  final lastcontactDateController = TextEditingController();

  /////////
  String? _selectedstatus;
  String? get selectedstatus => _selectedstatus;

  String? _selectedsources;
  String? get selectedsources => _selectedsources;

  String? _selectedassigned;
  String? get selectedassigned => _selectedassigned;

  String? _selectedattribute;
  String? get selectedattribute => _selectedattribute;
  bool _isWifeWhatsappAvailable = false;
  bool get isWifeWhatsappAvailable => _isWifeWhatsappAvailable;
  bool _isHusbandWhatsappAvailable = false;
  bool get isHusbandWhatsappAvailable => _isHusbandWhatsappAvailable;
  //prefered location
  String? _selectedpreferredlocation;
  String? get selectedpreferredlocation => _selectedpreferredlocation;
  //simulation location
  String? _selectedsimulationlocation;
  String? get selectedsimulationlocation => _selectedsimulationlocation;

  //case location
  String? _selectedcaselocation;
  String? get selectedcaselocation => _selectedcaselocation;

  String? _selectedProfileGroup;
  String? get selectedProfileGroup => _selectedProfileGroup;
  String? _selectedForFertilityTreatment;
  String? get selectedForFertilityTreatment => _selectedForFertilityTreatment;
  String? _selectedPreferedTime;
  String? get selectedPreferedTime => _selectedPreferedTime;
  String? _selectedPreferedLanguage;
  String? get selectedPreferedLanguage => _selectedPreferedLanguage;
  // bool _isPublic = false;
  // bool get isPublic => _isPublic;
  bool _isContactedToday = false;
  bool get isContactedToday => _isContactedToday;
  // final List<String> _selectedTags = [];
  // List<String> get selectedTags => _selectedTags;

  //selected status//
  void setSelectedstatus(String? value) {
    _selectedstatus = value;
    print(_selectedstatus);

    notifyListeners();
  }

  //selected source//
  void setSelectedsources(String? value) {
    _selectedsources = value;
    print(_selectedsources);
    notifyListeners();
  }

  //selected Assigned//
  void setSelectedassigned(String? value) {
    _selectedassigned = value;
    print(_selectedassigned);

    notifyListeners();
  }

  //selected Assigned//
  void setSelectedattribute(String? value) {
    _selectedattribute = value;
    print(_selectedattribute);

    notifyListeners();
  }
  // iswifewhatsappavailable//

  void setWifeWhatsappAvailable(bool value) {
    _isWifeWhatsappAvailable = value;
    notifyListeners();
  }
  // isHusbandwhatsappavailable//

  void setHusbandWhatsappAvailable(bool value) {
    _isHusbandWhatsappAvailable = value;
    notifyListeners();
  }

  //selected prefered location//
  void setSelectedPreferredLocation(String? value) {
    _selectedpreferredlocation = value;
    print(_selectedpreferredlocation);

    notifyListeners();
  }

  //selected simulation location//
  void setSelectedsimulationLocation(String? value) {
    _selectedsimulationlocation = value;
    print(_selectedsimulationlocation);

    notifyListeners();
  }

  //selected case location//
  void setSelectedcaseLocation(String? value) {
    _selectedcaselocation = value;
    print(_selectedcaselocation);

    notifyListeners();
  }

  // // ispublic//
  // void setIsPublic(bool value) {
  //   _isPublic = value;
  //   notifyListeners();
  // }
  // // iscontactedtoday//

  void setIsContactedToday(bool value) {
    _isContactedToday = value;
    notifyListeners();
  }

  //marriage date

  void setMarriageDate(String date) {
    marriageDateController.text = date;

    try {
      List<String> parts = date.split("-");
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      DateTime dateofmarry = DateTime(year, month, day);
      int age = calculatMarriedYears(dateofmarry);

      marriedYearsController.text = age.toString();
    } catch (e) {
      marriedYearsController.text = "";
    }

    notifyListeners(); // ✅ very important
  }

  int calculatMarriedYears(DateTime marrydate) {
    DateTime today = DateTime.now();
    int marriedyears = today.year - marrydate.year;
    if (today.month < marrydate.month ||
        (today.month == marrydate.month && today.day < marrydate.day)) {
      marriedyears--;
    }
    return marriedyears;
  }

  //selected profile group//
  void setSelectedProfileGroup(String? value) {
    _selectedProfileGroup = value;
    print(_selectedProfileGroup);

    notifyListeners();
  }

  //selected for fertility treatment//
  void setSelectedForFertilityTreatment(String? value) {
    _selectedForFertilityTreatment = value;
    print(_selectedForFertilityTreatment);

    notifyListeners();
  }

  //selected prefered time to call//
  void setSelectedPreferedTime(String? value) {
    _selectedPreferedTime = value;
    print(_selectedPreferedTime);

    notifyListeners();
  }

  //selected prefered Language//
  void setSelectedPreferedLanguage(String? value) {
    _selectedPreferedLanguage = value;
    print(_selectedPreferedLanguage);

    notifyListeners();
  }

  // ///selected tags
  // void toggleItem(String item) {
  //   if (_selectedTags.contains(item)) {
  //     _selectedTags.remove(item);
  //   } else {
  //     _selectedTags.add(item);
  //   }
  //   notifyListeners();
  // }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //controller for textfield//////////////////////dummy codeeeeeeeeee
  final passwordcontroller = TextEditingController();

  bool _isloading = false;
  bool get isloading => _isloading;
  //login function
  void addlead(BuildContext context) async {
    if (emailController.text.isEmpty || passwordcontroller.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("please fill all fields")));
      return;
    }
    _isloading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isloading = false;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("login successfull")));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  ////second page controllers
  final donornameController = TextEditingController();
  final detailsofPreviousChildController = TextEditingController();

  final donorageController = TextEditingController();
  File? _selectedWifeImage;
  File? get selectedWifeImage => _selectedWifeImage;
  File? _selectedWifeAadharImage;
  File? get selectedWifeAadharImage => _selectedWifeAadharImage;
  File? _selectedHusbandImage;
  File? get selectedHusbandImage => _selectedHusbandImage;
  File? _selectedHusbandAadharImage;
  File? get selectedHusbandAadharImage => _selectedHusbandAadharImage;
  File? _selectedMarriageCertificate;
  File? get selectedMarriageCertificate => _selectedMarriageCertificate;
  File? _selectedDivorceCertificate;
  File? get selectedDivorceCertificate => _selectedDivorceCertificate;
  File? _selectedBirthCertificate;
  File? get selectedBirthCertificate => _selectedBirthCertificate;
  File? _selectedInsuranceDetails;
  File? get selectedInsuranceDetails => _selectedInsuranceDetails;
  bool _isEggDonor = false;
  bool get isEggDonor => _isEggDonor;

  void setIsEggDonor(bool value) {
    _isEggDonor = value;
    notifyListeners();
  }

  bool _isSpermDonor = false;
  bool get isSpermDonor => _isSpermDonor;

  void setIsSpermDonor(bool value) {
    _isSpermDonor = value;
    notifyListeners();
  }

  //choose wife image
  void setWifeImage(File file) {
    _selectedWifeImage = file;
    notifyListeners();
  }

  //choose wife Aadhar Image
  void setWifeAadharImage(File file) {
    _selectedWifeAadharImage = file;
    notifyListeners();
  }

  //choose Husband image
  void setHusbandImage(File file) {
    _selectedHusbandImage = file;
    notifyListeners();
  }

  //choose Husband Aadhar Image
  void setHusbandAadharImage(File file) {
    _selectedHusbandAadharImage = file;
    notifyListeners();
  }

  //choose Husband Aadhar Image
  void setMarriageCertificate(File file) {
    _selectedMarriageCertificate = file;
    notifyListeners();
  }

  //choose Husband Aadhar Image
  void setDivorceCertificate(File file) {
    _selectedDivorceCertificate = file;
    notifyListeners();
  }

  //choose birth certifiacate
  void setBirthCertificate(File file) {
    _selectedBirthCertificate = file;
    notifyListeners();
  }

  //choose Insurance certifiacate
  void setInsuranceDetails(File file) {
    _selectedInsuranceDetails = file;
    notifyListeners();
  }
  ////////////////////third screeen

  final pancardController = TextEditingController();

  final mrdNumberController = TextEditingController();

  final artBankEnrollmentController = TextEditingController();

  ///////////fourth screen
  File? _selectedTvScan;
  File? get selectedTvScan => _selectedTvScan;
  File? _selectedSemenTest;
  File? get selectedSemenTest => _selectedSemenTest;
  File? _selectedSerology;
  File? get selectedSerology => _selectedSerology;
  File? _selectedbbt;
  File? get selectedbbt => _selectedbbt;
  File? _selectedtft;
  File? get selectedtft => _selectedtft;
  File? _selectedcardiacfitness;
  File? get selectedcardiacfitness => _selectedcardiacfitness;
  File? _selectedecg;
  File? get selectedecg => _selectedecg;
  //choose Tv Scan
  void setTvScan(File file) {
    _selectedTvScan = file;
    notifyListeners();
  }

  //choose Semen Test
  void setSemenTest(File file) {
    _selectedSemenTest = file;
    notifyListeners();
  }

  //choose Serology
  void setSerology(File file) {
    _selectedSerology = file;
    notifyListeners();
  }

  //choose BBT
  void setBbt(File file) {
    _selectedbbt = file;
    notifyListeners();
  }

  //choose TFT
  void setTft(File file) {
    _selectedtft = file;
    notifyListeners();
  }

  //choose cardiac fitness
  void setCardiacFitness(File file) {
    _selectedcardiacfitness = file;
    notifyListeners();
  }

  //choose ECG
  void setEcg(File file) {
    _selectedecg = file;
    notifyListeners();
  }

  ///////fifth screen
  File? _selectedInformedConcent;
  File? get selectedInformedConcent => _selectedInformedConcent;
  File? _selectedArtDonorConcent;
  File? get selectedArtDonorConcent => _selectedArtDonorConcent;
  File? _selectedArtDonorBond;
  File? get selectedArtDonorBond => _selectedArtDonorBond;

  //choose informed concent
  void setInformedConcent(File file) {
    _selectedInformedConcent = file;
    notifyListeners();
  }

  //choose ART Donor concent
  void setARTDonorConcent(File file) {
    _selectedArtDonorConcent = file;
    notifyListeners();
  }

  //choose ART Donor Bond
  void setARTDonorBond(File file) {
    _selectedArtDonorBond = file;
    notifyListeners();
  }

  ///sixth screen
  final reciepientNameController = TextEditingController();
  final reciepientMRDNameController = TextEditingController();
  ////Recipient  locations
  final List<String> _recipientlocations = [
    "Chennai - Sholinganallur",
    "Chennai - Madipakkam",
    "Chennai - Urapakkam",
    "Kanchipuram",
    "Hosur",
    "Tiruppur",
    "Erode",
  ];
  List<String> get recipientlocation => _recipientlocations;
  //Recipient location
  String? _selectedRecipientLocation;
  String? get selectedRecipientLocation => _selectedRecipientLocation;
  //selected simulation location//
  void setSelectedRecipientLocation(String? value) {
    _selectedRecipientLocation = value;

    notifyListeners();
  }

  //seventh screen
  final consultationDatesController = TextEditingController();

  final testDatesController = TextEditingController();

  final pharmacyMedicinesTimelineController = TextEditingController();
  //eighth Screen
  final ivfDashboadNotesController = TextEditingController();
  final intraOpDetailsController = TextEditingController();

  final postOpDetailsController = TextEditingController();
  File? _selectedOpuSummary;
  File? get selectedOpuSummary => _selectedOpuSummary;
  File? _selectedPrescriptions;
  File? get selectedPrescriptions => _selectedPrescriptions;
    File? _selectedEmbryoSummary;
  File? get selectedEmbryoSummary => _selectedEmbryoSummary;
    File? _selectedReports;
  File? get selectedReports => _selectedReports;
    File? _selectedInsuranceClaim;
  File? get selectedInsuranceClain => _selectedInsuranceClaim;
  
  //choose OPU Summary
  void setOpuSummary(File file) {
    _selectedOpuSummary = file;
    notifyListeners();
  }
  
  //choose Prescriptions
  void setPrescriptions(File file) {
    _selectedPrescriptions = file;
    notifyListeners();
  }
  //choose Embryo Summary
  void setEmbryoSummary(File file) {
    _selectedEmbryoSummary = file;
    notifyListeners();
  }
    //choose Reports
  void setReports(File file) {
    _selectedReports = file;
    notifyListeners();
  }
      //choose Insurance claims
  void setInsuranceClaim(File file) {
    _selectedInsuranceClaim = file;
    notifyListeners();
  }

  ////dummy data for edit lead screen///
  void loadDummyLead() {
    wifeNameController.text = "Anitha";
    wifeNumberController.text = "9876543210";
    husbandNameController.text = "Ramesh";
    husbandNumberController.text = "9876501234";
    husbandAgeController.text = "35";
    wifeAgeController.text = "32";
    addressController.text = "123, Anna Nagar, Chennai";
    cityController.text = "Chennai";
    stateController.text = "Tamil Nadu";
    countryController.text = "India";
    zipcodeController.text = "600040";
    emailController.text = "anitha@example.com";
    descriptionController.text = "Follow-up required for IVF treatment.";
    // wifemdrnumberController.text = "WDR12345";
    // husbandmdrnumberController.text = "HDR54321";
    marriageDateController.text = "01-01-2015";
    walkinDateController.text = "12-09-2025";

    _selectedstatus = "Interested";
    _selectedsources = "Google";
    _selectedassigned = "Yamini 12767";
    _selectedattribute = "Facebook";
    _selectedpreferredlocation = "Chennai - Sholinganallur";
    _selectedProfileGroup = "IVF";
    _selectedForFertilityTreatment = "New";
    _selectedPreferedTime = "7am to 11am";
    _selectedPreferedLanguage = "Tamil";

    _isWifeWhatsappAvailable = true;
    _isHusbandWhatsappAvailable = false;
    // _isPublic = true;
    _isContactedToday = true;

    // _selectedTags.clear();
    // _selectedTags.addAll(["Tag1", "Tag3"]);

    marriedYearsController.text = "10";

    notifyListeners();
  }
}
