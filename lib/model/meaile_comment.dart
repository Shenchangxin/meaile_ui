import 'package:intl/intl.dart';

class MeaileComment {
  final int? commentId;
  final int? userId;
  final int? likeCount;
  final String? avatarUrl;
  final String? username;
  final String? content;
  final DateTime? createTime;
  final DateTime? updateTime;

  MeaileComment({
    this.commentId,
    this.userId,
    this.likeCount,
    this.avatarUrl,
    this.username,
    this.content,
    this.createTime,
    this.updateTime,
  });

  factory MeaileComment.fromJson(Map<String, dynamic> json) {
    return MeaileComment(
      commentId: json['commentId']?.toInt(),
      userId: json['userId']?.toInt(),
      likeCount: json['likeCount']?.toInt(),
      avatarUrl: json['avatarUrl'],
      username: json['username'],
      content: json['content'],
      createTime: json['createTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['createTime'])
          : null,
      updateTime: json['updateTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['updateTime'])
          : null,
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
      'createTime': createTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(createTime!)
          : null,
      'updateTime': updateTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(updateTime!)
          : null,
    };
  }
}