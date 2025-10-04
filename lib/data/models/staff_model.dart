class StaffModel {
  final String fullName;
  final String email;
  final String location;
  final String role;
  final String lastLogin;
  final bool isActive;
  final String imageUrl;

  StaffModel({
    required this.fullName,
    required this.email,
    required this.location,
    required this.role,
    required this.lastLogin,
    required this.isActive,
    required this.imageUrl,
  });

  // Factory constructor to create from JSON
  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      location: json['location'] ?? '',
      role: json['role'] ?? '',
      lastLogin: json['lastLogin'] ?? '',
      isActive: json['isActive'] ?? false,
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'location': location,
      'role': role,
      'lastLogin': lastLogin,
      'isActive': isActive,
      'imageUrl': imageUrl,
    };
  }
}