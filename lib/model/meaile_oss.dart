import 'dart:convert';
import 'package:intl/intl.dart';

class MeaileOss {
  final int? id;
  final String? ossId;
  final String? fileName;
  final String? suffix;
  final String? fileUrl;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;

  MeaileOss({
    this.id,
    this.ossId,
    this.fileName,
    this.suffix,
    this.fileUrl,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
  });

  factory MeaileOss.fromJson(Map<String, dynamic> json) {
    return MeaileOss(
      id: json['id']?.toInt(),
      ossId: json['ossId'],
      fileName: json['fileName'],
      suffix: json['suffix'],
      fileUrl: json['fileUrl'],
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
      'ossId': ossId,
      'fileName': fileName,
      'suffix': suffix,
      'fileUrl': fileUrl,
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