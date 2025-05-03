import 'package:flutter/material.dart';
import 'package:meaile_ui/widgets/page_content.dart';

import '../routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            Padding(padding: EdgeInsets.all(15)),
            TextField(
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
              ),
              obscureText: true,
            ),
            Padding(padding: EdgeInsets.all(15)),
            TextField(
              decoration: InputDecoration(
                labelText: '确认密码',
                hintText: '请输入密码',
              ),
              obscureText: true,
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {},
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
