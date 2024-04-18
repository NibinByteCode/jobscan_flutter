class PostData {
  String postId;
  String postContent;
  String? postImage;
  String userId;
  int postDate;

  PostData({
    this.postId = '',
    this.postContent = '',
    this.postImage,
    this.userId = '',
    this.postDate = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'postContent': postContent,
      'postImage': postImage,
      'userId': userId,
      'postDate': postDate,
    };
  }

  PostData.fromJson(Map<String, dynamic> json)
      : postId = json['postId'] ?? '',
        postContent = json['postContent'] ?? '',
        postImage = json['postImage'],
        userId = json['userId'] ?? '',
        postDate = json['postDate'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'postContent': postContent,
      'postImage': postImage,
      'userId': userId,
      'postDate': postDate,
    };
  }
}
