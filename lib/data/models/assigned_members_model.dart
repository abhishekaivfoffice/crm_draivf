
class AssignedMember {
  final String profileImage;
  final String name;
  final String lastActiveDate;
  final String email;

  AssignedMember({
    required this.profileImage,
    required this.name,
    required this.lastActiveDate,
    required this.email,
  });
}

class User {
  final int id;
  final String name;
  final String branch;
  final String phone;
  final int dupe;
  final List<AssignedMember> assignedMembers; // 🔥 multiple members
  final String status;
  final String source;
  final String walkInDate;
  final String lastContact;
  final String created;

  User({
    required this.id,
    required this.name,
    required this.branch,
    required this.phone,
    required this.dupe,
    required this.assignedMembers,
    required this.status,
    required this.source,
    required this.walkInDate,
    required this.lastContact,
    required this.created,
  });
}
