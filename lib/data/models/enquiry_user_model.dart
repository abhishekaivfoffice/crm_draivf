class Enquiry {
  final int id;
  final String name;
  final String phone;
  final String source;
  final String email;
  final String createdDate;
  bool isConverted;

  Enquiry({
    required this.id,
    required this.name,
    required this.phone,
    required this.source,
    required this.email,
    required this.createdDate,
    this.isConverted = false,
  });
}
