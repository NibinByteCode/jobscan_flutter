class JobData {
  String jobId;
  String jobTitle;
  String jobDescription;
  String jobPostingDate;
  String? jobImage;
  String userId;
  String jobSalary; // Added jobSalary attribute
  String jobExperience; // Added jobExperience attribute

  JobData({
    this.jobId = '',
    this.jobTitle = '',
    this.jobDescription = '',
    this.jobPostingDate = '',
    this.jobImage,
    required this.userId,
    required this.jobSalary, // Added jobSalary to constructor
    required this.jobExperience, // Added jobExperience to constructor
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobPostingDate': jobPostingDate,
      'jobImage': jobImage,
      'userId': userId,
      'jobSalary': jobSalary, // Included jobSalary in the map
      'jobExperience': jobExperience, // Included jobExperience in the map
    };
  }

  factory JobData.fromJson(Map<dynamic, dynamic> json){
    return JobData(
      jobId : json['jobId'] ?? '',
      jobTitle : json['jobTitle'] ?? '',
      jobDescription : json['jobDescription'] ?? '',
      jobPostingDate : json['jobPostingDate'] ?? '',
      jobImage : json['jobImage'],
      userId : json['userId'] ?? '',
      jobSalary : json['jobSalary'] ?? '', // Parse jobSalary from JSON
      jobExperience : json['jobExperience'] ?? '', // Parse jobExperience from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobPostingDate': jobPostingDate,
      'jobImage': jobImage,
      'userId': userId,
      'jobSalary': jobSalary,
      'jobExperience': jobExperience,
    };
  }
}
