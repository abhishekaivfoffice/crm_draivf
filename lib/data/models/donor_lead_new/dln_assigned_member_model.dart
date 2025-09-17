class DLNAssignedMember {
  final String profileImage;
  final String name;
  final String lastActiveDate;
  final String email;

  DLNAssignedMember({
    required this.profileImage,
    required this.name,
    required this.lastActiveDate,
    required this.email,
  });
}

class PatientRecord {
  final int id;
  final String wifeName;
  final String location;
  final String wifePhone;
  final int dupe;
  final List<DLNAssignedMember> assignedMembers;
  final String status;
  final String source;
  final String walkInDate;
  final String lastContact;
  final String created;
  final String action;
  final String donorName;
  final int age;
  final String wifePhoto;
  final String husbandPhoto;
  final String aadharWife;
  final String aadharHusband;
  final String marriageCertificate;
  final String divorceDocument;
  final String childrenDetails;
  final String birthCertificate;
  final String panCard;
  final String mrdNumber;
  final String artEnrolment;
  final String tvScan;
  final String semenTest;
  final String serology;
  final String bbt;
  final String tft;
  final String cardiacFitness;
  final String ecg;
  final String informedConsent;
  final String donorConsent;
  final String donorBond;
  final String recipientName;
  final String recipientMrd;
  final List<String> consultationDates;
  final List<String> testDates;
  final String pharmacyTimeline;
  final String ivfDashboard;
  final String opuSummary;
  final String intraOp;
  final String postOp;
  final List<String> prescriptions;
  final List<String> reports;

  PatientRecord({
    required this.id,
    required this.wifeName,
    required this.location,
    required this.wifePhone,
    required this.dupe,
    required this.assignedMembers,
    required this.status,
    required this.source,
    required this.walkInDate,
    required this.lastContact,
    required this.created,
    required this.action,
    required this.donorName,
    required this.age,
    required this.wifePhoto,
    required this.husbandPhoto,
    required this.aadharWife,
    required this.aadharHusband,
    required this.marriageCertificate,
    required this.divorceDocument,
    required this.childrenDetails,
    required this.birthCertificate,
    required this.panCard,
    required this.mrdNumber,
    required this.artEnrolment,
    required this.tvScan,
    required this.semenTest,
    required this.serology,
    required this.bbt,
    required this.tft,
    required this.cardiacFitness,
    required this.ecg,
    required this.informedConsent,
    required this.donorConsent,
    required this.donorBond,
    required this.recipientName,
    required this.recipientMrd,
    required this.consultationDates,
    required this.testDates,
    required this.pharmacyTimeline,
    required this.ivfDashboard,
    required this.opuSummary,
    required this.intraOp,
    required this.postOp,
    required this.prescriptions,
    required this.reports,
  });
}
