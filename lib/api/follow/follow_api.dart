import 'dart:ffi';

import 'package:meaile_ui/utils/logger_util.dart';

import '../../http/http_util.dart';
import '../../model/meaile_food.dart';
import '../../model/vo/food_detail_vo.dart';
import '../api_constants.dart';

class FollowApi {
  ///关注用户
  Future<bool> followUser(String followUserName) async {
    try {
      // 调用 HttpUtil 的 post 方法请求后端接口
      DioResponse? response = await HttpUtil().post(
        ApiConstants.FOLLOW_FOLLOW_USER,
        data: {
          "followUserName": followUserName,
        },
      );

      // 检查响应状态码
      if (response != null && response.code == 200) {
        return true;
      } else {
        LogE("关注用户：$followUserName失败");
        return false;
      }
    } catch (e) {
      // 处理异常
      LogE("关注用户：$followUserName发生错误：$e");
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
}