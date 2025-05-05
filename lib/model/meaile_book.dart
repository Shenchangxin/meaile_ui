import 'dart:convert';
import 'package:intl/intl.dart';
import 'meaile_tag.dart'; // 导入 MeaileTag 类的文件
import 'meaile_oss.dart'; // 导入 MeaileOss 类的文件

class MeaileBook {
  final int? id;
  final String? bookName;
  final String? image;
  final String? introduction;
  final double? favorite;
  final int? sort;
  final String? status;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final List<MeaileTag>? tagList;
  final MeaileOss? imageOssObj;

  MeaileBook({
    this.id,
    this.bookName,
    this.image,
    this.introduction,
    this.favorite,
    this.sort,
    this.status,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.tagList,
    this.imageOssObj,
  });

  factory MeaileBook.fromJson(Map<String, dynamic> json) {
    return MeaileBook(
      id: json['id']?.toInt(),
      bookName: json['bookName'],
      image: json['image'],
      introduction: json['introduction'],
      favorite: json['favorite']?.toDouble(),
      sort: json['sort']?.toInt(),
      status: json['status'],
      createdBy: json['createdBy'],
      createdTime: json['createdTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['createdTime'])
          : null,
      updatedBy: json['updatedBy'],
      updatedTime: json['updatedTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['updatedTime'])
          : null,
      tagList: json['tagList'] != null
          ? List<MeaileTag>.from(json['tagList'].map((item) => MeaileTag.fromJson(item)))
          : null,
      imageOssObj: json['imageOssObj'] != null
          ? MeaileOss.fromJson(json['imageOssObj'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookName': bookName,
      'image': image,
      'introduction': introduction,
      'favorite': favorite,
      'sort': sort,
      'status': status,
      'createdBy': createdBy,
      'createdTime': createdTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(createdTime!)
          : null,
      'updatedBy': updatedBy,
      'updatedTime': updatedTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(updatedTime!)
          : null,
      'tagList': tagList?.map((tag) => tag.toJson()).toList(),
      'imageOssObj': imageOssObj?.toJson(),
    };
  }
}