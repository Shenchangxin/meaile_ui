import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meaile_ui/model/login_user.dart';

import '../../http/http_util.dart';
import '../../routes.dart';
import '../../storage/storage.dart';
import '../api_constants.dart';

class CommonApi {

  void login(BuildContext context,String username,String password,) async {

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
      // LoginUser loginUser = LoginUser.fromJson(json.decode(response.data["data"]));
      //保存登录信息
      String loginUserInfo = jsonEncode(response.data["data"]);
      await SecureStorage().writeData('loginUser', loginUserInfo);
      // 保存 token
      String token = response.data["data"]["token"];
      await SecureStorage().writeData('token', token);
      // String? tokenStorage = await SecureStorage().readData('token');
      // 跳转到首页
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      // 登录失败
      EasyLoading.showError(response?.message ?? '登录失败');
    }
  }
  void register(BuildContext context,String username,String password,String confirmPassword) async {

    // 验证输入
    if (username.isEmpty) {
      EasyLoading.showError('请输入用户名');
      return;
    }
    if (password.isEmpty) {
      EasyLoading.showError('请输入密码');
      return;
    }
    if (confirmPassword.isEmpty) {
      EasyLoading.showError('请输入确认密码');
      return;
    }
    if (password != confirmPassword) {
      EasyLoading.showError('确认密码不正确');
    }
    // 显示加载提示
    EasyLoading.show(status: '注册中...');
    // 调用 HttpUtil.post() 方法
    DioResponse? response = await HttpUtil().post(
      ApiConstants.REGISTER,
      data: {
        "username": username,
        "password": password,
      },
    );
    // 处理响应
    if (response != null && response.code == 200) {
      // 注册成功
      EasyLoading.showSuccess('注册成功，请前去登录');
      // 跳转到首页
      Navigator.pushReplacementNamed(context, Routes.login);
    } else {
      // 登录失败
      EasyLoading.showError(response?.message ?? '注册失败');
    }
  }
}