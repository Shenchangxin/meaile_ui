import 'dart:convert';
import 'package:intl/intl.dart';

class MeaileTag {
  final int? id;
  final String? tagName;
  final int? parentId;
  final int? userId;
  final String? status;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;

  MeaileTag({
    this.id,
    this.tagName,
    this.parentId,
    this.userId,
    this.status,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
  });

  factory MeaileTag.fromJson(Map<String, dynamic> json) {
    return MeaileTag(
      id: json['id']?.toInt(),
      tagName: json['tagName'],
      parentId: json['parentId']?.toInt(),
      userId: json['userId']?.toInt(),
      status: json['status'],
      createdBy: json['createdBy'],
      createdTime: json['createdTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['createdTime'])
          : null,
      updatedBy: json['updatedBy'],
      updatedTime: json['updatedTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['updatedTime'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tagName': tagName,
      'parentId': parentId,
      'userId': userId,
      'status': status,
      'createdBy': createdBy,
      'createdTime': createdTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(createdTime!)
          : null,
      'updatedBy': updatedBy,
      'updatedTime': updatedTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(updatedTime!)
          : null,
    };
  }
}