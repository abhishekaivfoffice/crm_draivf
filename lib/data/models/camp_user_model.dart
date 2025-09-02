class CampUsers {
  final int branch;
  final String camptype;
  final double campdate;
  final String camplocation;
  final String drname;
  final String campincharge;
  final double createddate;
  final String deatils;
  final String QR;
  bool action;


  CampUsers({
    required this.branch,
    required this.camptype,
    required this.campdate,
    required this.camplocation,
    required this.drname,
    required this.campincharge,
    required this.createddate,
    required this.deatils,
    required this.QR,
    this.action = false,
  });
}
