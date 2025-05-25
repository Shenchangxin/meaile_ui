import 'comment.dart';

class FoodDetailData {
  final int foodId;
  final int userId;
  final String userName;
  final String userAvatar;
  final String title;
  final String description;
  final int likeCount;
  final int shareCount;
  final int commentCount;
  final List<String> mediaUrls;
  final List<Comment> comments;

  FoodDetailData({
    required this.foodId,
    required this.userId,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
    required this.userName,
    required this.userAvatar,
    required this.title,
    required this.description,
    required this.mediaUrls,
    required this.comments,
  });
  factory FoodDetailData.fromJson(Map<String, dynamic> json) {
    final creator = json['creator'] as Map<String, dynamic>;
    return FoodDetailData(
      foodId: json['id'] as int,
      userId: creator['userId'] as int,
      likeCount: json['likeCount'] as int,
      shareCount: json['shareCount'] as int,
      commentCount: json['commentCount'] as int,
      userName: creator['userName'] as String,
      userAvatar: creator['userAvatar'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      mediaUrls: List<String>.from(json['mediaUrls']),
      comments: List<Comment>.from(json['comments'].map((x) => Comment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodId,
      'userId': userId,
      'likeCount': likeCount,
      'shareCount': shareCount,
      'commentCount': commentCount,
      'userName': userName,
      'userAvatar': userAvatar,
      'title': title,
      'description': description,
      'mediaUrls': mediaUrls,
      'comments': comments,
    };
  }
}