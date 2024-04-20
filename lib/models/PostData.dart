class PostData {
  String postId;
  String postContent;
  String? postImage;
  String userId;
  String postDate;

  PostData({
    this.postId = '',
    this.postContent = '',
    this.postImage,
    this.userId = '',
    this.postDate = '',
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

  factory PostData.fromJson(Map<dynamic, dynamic> json){
     return PostData( postId : json['postId'] ?? '',
        postContent : json['postContent'] ?? '',
        postImage : json['postImage'],
        userId : json['userId'] ?? '',
        postDate : json['postDate'] ?? '');
}
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
