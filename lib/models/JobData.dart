class JobData {
  String jobId;
  String jobTitle;
  String jobDescription;
  String jobPostingDate;
  String? jobImage;
  String userId;

  JobData({
    this.jobId = '',
    this.jobTitle = '',
    this.jobDescription = '',
    this.jobPostingDate = '',
    this.jobImage,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobPostingDate': jobPostingDate,
      'jobImage': jobImage,
      'userId': userId,
    };
  }

  JobData.fromJson(Map<String, dynamic> json)
      : jobId = json['jobId'] ?? '',
        jobTitle = json['jobTitle'] ?? '',
        jobDescription = json['jobDescription'] ?? '',
        jobPostingDate = json['jobPostingDate'] ?? '',
        jobImage = json['jobImage'],
        userId = json['userId'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobPostingDate': jobPostingDate,
      'jobImage': jobImage,
      'userId': userId,
    };
  }
}
