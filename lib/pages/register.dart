import 'package:flutter/material.dart';
import '../api/common/common_api.dart';
import '../routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final CommonApi _commonApi = CommonApi();
  bool _isPasswordMatch = true; // 用于存储密码是否匹配的状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注 册'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            Padding(padding: EdgeInsets.all(15)),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
              ),
              obscureText: true,
            ),
            Padding(padding: EdgeInsets.all(15)),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: '确认密码',
                hintText: '请输入密码',
                errorText: _isPasswordMatch ? null : '两次输入的密码不一致', // 根据密码是否匹配显示错误提示
              ),
              obscureText: true,
              onChanged: (String value) {
                // 每次输入变化时校验密码
                setState(() {
                  _isPasswordMatch = value == _passwordController.text;
                });
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text.trim();
                String password = _passwordController.text.trim();
                String confirmPassword = _confirmPasswordController.text.trim();
                // 校验密码是否一致
                if (password != confirmPassword) {
                  setState(() {
                    _isPasswordMatch = false;
                  });
                  return;
                }
                _commonApi.register(context, username, password, confirmPassword);
              },
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
              child: Text('注 册',style: TextStyle(color: Colors.white),),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // 设置主轴对齐方式为两端对齐
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0), // 左侧组件的左边距
                  child: Text('已有账号？'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0), // 右侧组件的右边距
                  child: TextButton(
                    child: Text('去登录~', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.register);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
