import 'package:intl/intl.dart';

import 'meaile_oss.dart';
import 'meaile_tag.dart';

class MeaileFood {
  final int? id;
  final String? foodName;
  final String? image;
  final String? introduction;
  final double? favorite;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final List<MeaileTag>? tagList;
  final MeaileOss? imageOssObj;

  const MeaileFood({
    this.id,
    this.foodName,
    this.image,
    this.introduction,
    this.favorite,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.tagList,
    this.imageOssObj,
  });

  factory MeaileFood.fromJson(Map<String, dynamic> json) {
    return MeaileFood(
      id: json['id']?.toInt(),
      foodName: json['foodName'],
      image: json['image'],
      introduction: json['introduction'],
      favorite: json['favorite']?.toDouble(),
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
      'foodName': foodName,
      'image': image,
      'introduction': introduction,
      'favorite': favorite,
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