class Comment {
  final int commentId;
  final int userId;
  final int likeCount;
  final String avatarUrl;
  final String username;
  final String content;

  Comment({
    required this.commentId,
    required this.userId,
    required this.likeCount,
    required this.avatarUrl,
    required this.username,
    required this.content,
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'] as int,
      userId: json['userId'] as int,
      likeCount: json['likeCount'] as int,
      avatarUrl: json['avatarUrl'] as String,
      username: json['username'] as String,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'userId': userId,
      'likeCount': likeCount,
      'avatarUrl': avatarUrl,
      'username': username,
      'content': content,
    };
  }
}