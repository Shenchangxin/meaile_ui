import 'package:flutter/material.dart';
import 'package:meaile_ui/widgets/page_content.dart';

import '../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用户登录'),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名'
          ),),
          Padding(padding: EdgeInsets.all(15),),
          TextField(
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '请输入密码',
              suffixIcon: IconButton(icon: Icon(showPassword? Icons.visibility_off : Icons.visibility),onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              }, ),
            ),
            obscureText: !showPassword,
          ),
          Padding(padding: EdgeInsets.all(10),),
          ElevatedButton(child: Text('登 录'),onPressed: (){

          },),
          Padding(padding: EdgeInsets.all(5),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 设置主轴对齐方式为两端对齐
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0), // 左侧组件的左边距
                child: Text('还没有账号？'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0), // 右侧组件的右边距
                child: TextButton(
                  child: Text('去注册~',style: TextStyle(color: Colors.green),),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}