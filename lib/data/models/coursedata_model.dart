class CourseDataModel {
  final int id;
  final String empId;
  final String? photo;
  final String name;
  final String phone;
  final String city;
  final String access;
  final String assigned;
  final String qualification;
  final String status;
  final String course;
  final String source;
  final String createdDate;

  CourseDataModel({
    required this.id,
    required this.empId,
    this.photo,
    required this.name,
    required this.phone,
    required this.city,
    required this.access,
    required this.assigned,
    required this.qualification,
    required this.status,
    required this.course,
    required this.source,
    required this.createdDate,
  });

  // For debugging / printing
  @override
  String toString() {
    return 'Employee(id: $id, empId: $empId, name: $name, phone: $phone, city: $city, qualification: $qualification, course: $course)';
  }
}

