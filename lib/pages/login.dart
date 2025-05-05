import 'package:flutter/material.dart';
import '../api/common/common_api.dart';
import '../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CommonApi _commonApi = CommonApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登 录'),
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
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
              obscureText: !showPassword,
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text.trim();
                String password = _passwordController.text.trim();
                _commonApi.login(context,username,password);
              },
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
              child: Text('登 录',style: TextStyle(color: Colors.white),),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // 设置主轴对齐方式为两端对齐
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0), // 左侧组件的左边距
                  child: Text('还没有账号？'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0), // 右侧组件的右边距
                  child: TextButton(
                    child: Text('去注册~', style: TextStyle(color: Colors.blue)),
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
