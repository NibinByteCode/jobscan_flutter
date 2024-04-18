class UserData {
  final String userId;
  final String userType;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String profileImage;
  final String phoneNumber;
  final String email;
  final String companyName;
  final String designation;
  final String educationQualification;
  final Map<String, String> connections;
  final List<String> postIds;
  List<String> jobIds;
  final int connectionCount;

  UserData({
    required this.userId,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.profileImage,
    required this.phoneNumber,
    required this.email,
    required this.companyName,
    required this.designation,
    required this.educationQualification,
    required this.connections,
    required this.postIds,
    required this.jobIds,
    required this.connectionCount,

  });

  factory UserData.fromJson(Map<dynamic, dynamic> json) {
    return UserData(
      userId: json['userId'] ?? '',
      userType: json['userType'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      profileImage: json['profileImage'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      companyName: json['companyName'] ?? '',
      designation: json['designation'] ?? '',
      educationQualification: json['educationQualification'] ?? '',
      connections: Map<String, String>.from(json['connections'] ?? {}),
      postIds: List<String>.from(json['postIds'] ?? []),
      jobIds : List<String>.from(json['jobIds'] ?? []),
      connectionCount: json['connectionCount'] ?? 0,
    );
  }
}
