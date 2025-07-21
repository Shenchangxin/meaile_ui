class FoodDetailData {
  final int foodId;
  final int userId;
  final String userName;
  final String nickName;
  final String userAvatarUrl;
  final String foodName;
  final String introduction;
  final int likeCount;
  final int shareCount;
  final int commentCount;
  bool isFollowing = false;
  final List<String> mediaUrls;

  FoodDetailData({
    required this.foodId,
    required this.userId,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
    required this.userName,
    required this.nickName,
    required this.userAvatarUrl,
    required this.foodName,
    required this.introduction,
    required this.mediaUrls,
    required this.isFollowing,
  });
  factory FoodDetailData.fromJson(Map<String, dynamic> json) {
    final creator = json['creator'] as Map<String, dynamic>;
    return FoodDetailData(
      foodId: json['id'] as int,
      userId: creator['id'] as int,
      likeCount: json['likeCount'] ?? 0,
      shareCount: json['shareCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      userName: json['userName'] ?? '',
      nickName: json['nickName'] ?? '',
      userAvatarUrl: json['userAvatarUrl'] ?? '',
      foodName: json['foodName'] ?? '',
      introduction: json['introduction'] ?? '',
      isFollowing: json['isFollowing'] ?? '',
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
      'nickName': nickName,
      'userAvatarUrl': userAvatarUrl,
      'foodName': foodName,
      'introduction': introduction,
      'isFollowing': isFollowing,
      'mediaUrls': mediaUrls,
    };
  }
}