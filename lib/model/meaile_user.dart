import 'package:intl/intl.dart';

import 'meaile_oss.dart';

class MeaileUser {
  final int? id;
  final String? userName;
  final String? nickName;
  final String? password;
  final String? status;
  final String? avatar;
  final String? backgroundImage;
  final String? profile;
  final String? sex;
  final String? hobby;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final MeaileOss? avatarOssObj;

  const MeaileUser({
    this.id,
    this.userName,
    this.nickName,
    this.password,
    this.status,
    this.avatar,
    this.backgroundImage,
    this.profile,
    this.sex,
    this.hobby,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.avatarOssObj,
  });

  factory MeaileUser.fromJson(Map<String, dynamic> json) {
    return MeaileUser(
      id: json['id']?.toInt(),
      userName: json['userName'],
      nickName: json['nickName'],
      password: json['password'],
      status: json['status'],
      avatar: json['avatar'],
      backgroundImage: json['backgroundImage'],
      profile: json['profile'],
      sex: json['sex'],
      hobby: json['hobby'],
      createdBy: json['createdBy'],
      createdTime: json['createdTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['createdTime'])
          : null,
      updatedBy: json['updatedBy'],
      updatedTime: json['updatedTime'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['updatedTime'])
          : null,
      avatarOssObj: json['avatarOssObj'] != null
          ? MeaileOss.fromJson(json['avatarOssObj'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'nickName': nickName,
      'password': password,
      'status': status,
      'avatar': avatar,
      'backgroundImage': backgroundImage,
      'profile': profile,
      'sex': sex,
      'hobby': hobby,
      'createdBy': createdBy,
      'createdTime': createdTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(createdTime!)
          : null,
      'updatedBy': updatedBy,
      'updatedTime': updatedTime != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(updatedTime!)
          : null,
      'avatarOssObj': avatarOssObj?.toJson(),
    };
  }
}