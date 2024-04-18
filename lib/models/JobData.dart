class JobData {
  String jobId;
  String jobTitle;
  String jobDescription;
  String jobPostingDate;
  String? jobImage;
  String userId;
  String jobSalary;
  String jobExperience;

  JobData({
    this.jobId = '',
    this.jobTitle = '',
    this.jobDescription = '',
    this.jobPostingDate = '',
    this.jobImage,
    required this.userId,
    required this.jobSalary,
    required this.jobExperience,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobPostingDate': jobPostingDate,
      'jobImage': jobImage,
      'userId': userId,
      'jobSalary': jobSalary,
      'experience': jobExperience,
    };
  }

  JobData.fromJson(Map<String, dynamic> json)
      : jobId = json['jobId'] ?? '',
        jobTitle = json['jobTitle'] ?? '',
        jobDescription = json['jobDescription'] ?? '',
        jobPostingDate = json['jobPostingDate'] ?? '',
        jobImage = json['jobImage'],
        userId = json['userId'] ?? '',
        jobSalary = json['jobSalary'] ?? '',
        jobExperience = json['jobExperience'] ?? '';

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
