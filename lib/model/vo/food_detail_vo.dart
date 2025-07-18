class FoodDetailData {
  final int foodId;
  final int userId;
  final String userName;
  final String userAvatar;
  final String foodName;
  final String introduction;
  final int likeCount;
  final int shareCount;
  final int commentCount;
  final List<String> mediaUrls;

  FoodDetailData({
    required this.foodId,
    required this.userId,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
    required this.userName,
    required this.userAvatar,
    required this.foodName,
    required this.introduction,
    required this.mediaUrls,
  });
  factory FoodDetailData.fromJson(Map<String, dynamic> json) {
    final creator = json['creator'] as Map<String, dynamic>;
    return FoodDetailData(
      foodId: json['id'] as int,
      userId: creator['id'] as int,
      likeCount: json['likeCount'] ?? 0,
      shareCount: json['shareCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      userName: creator['userName'] ?? '',
      userAvatar: creator['userAvatar'] ?? '',
      foodName: json['foodName'] ?? '',
      introduction: json['introduction'] ?? '',
      mediaUrls: List<String>.from(json['mediaUrls']),
      // comments: List<Comment>.from(json['comments'].map((x) => Comment.fromJson(x))),
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
      'foodName': foodName,
      'introduction': introduction,
      'mediaUrls': mediaUrls,
    };
  }
}