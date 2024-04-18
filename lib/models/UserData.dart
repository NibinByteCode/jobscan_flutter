class UserData {
  String userId;
  String userType;
  String firstName;
  String lastName;

  String dateOfBirth;
  String profileImage;
  String phoneNumber;
  String email;
  String companyName;
  String designation;
  String educationQualification;

  Map<String, String> connections;
  List<String> postIds;
  List<String> jobIds;
  int connectionCount;

  UserData({
    this.userId = '',
    this.userType = '',
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth = '',
    this.profileImage = '',
    this.phoneNumber = '',
    this.email = '',
    this.companyName = '',
    this.designation = '',
    this.educationQualification = '',
    this.connections = const {},
    this.postIds = const [],
    this.jobIds = const [],
    this.connectionCount = 0,
  });

  UserData.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] ?? '',
        userType = json['userType'] ?? '',
        firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        dateOfBirth = json['dateOfBirth'] ?? '',
        profileImage = json['profileImage'] ?? '',
        phoneNumber = json['phoneNumber'] ?? '',
        email = json['email'] ?? '',
        companyName = json['companyName'] ?? '',
        designation = json['designation'] ?? '',
        educationQualification = json['educationQualification'] ?? '',
        connections = Map<String, String>.from(json['connections'] ?? {}),
        postIds = List<String>.from(json['postIds'] ?? []),
        jobIds = List<String>.from(json['jobIds'] ?? []),
        connectionCount = json['connectionCount'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userType': userType,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'email': email,
      'companyName': companyName,
      'designation': designation,
      'educationQualification': educationQualification,
      'connections': connections,
      'postIds': postIds,
      'jobIds': jobIds,
      'connectionCount': connectionCount,
    };
  }
}
