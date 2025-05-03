import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../http/http_util.dart';
import '../../routes.dart';
import '../../storage/storage.dart';
import '../api_constants.dart';

class CommonApi {

  void Login(BuildContext context,String username,String password,) async {

    // 验证输入
    if (username.isEmpty) {
      EasyLoading.showError('请输入用户名');
      return;
    }
    if (password.isEmpty) {
      EasyLoading.showError('请输入密码');
      return;
    }
    // 显示加载提示
    EasyLoading.show(status: '登录中...');
    // 调用 HttpUtil.post() 方法
    DioResponse? response = await HttpUtil().post(
      ApiConstants.LOGIN,
      data: {
        "username": username,
        "password": password,
      },
    );
    // 处理响应
    if (response != null && response.code == 200) {
      // 登录成功
      EasyLoading.showSuccess('登录成功');
      // 保存 token
      String token = response.data["data"]["token"];
      await SecureStorage().writeData('token', token);
      // 跳转到首页
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      // 登录失败
      EasyLoading.showError(response?.message ?? '登录失败');
    }
  }
}