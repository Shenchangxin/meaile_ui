import 'package:flutter/material.dart';
import 'package:meaile_ui/widgets/page_content.dart';

import '../routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用户注册'),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
              labelText: '用户名',
              hintText: '请输入用户名'
          ),),
          TextField(decoration: InputDecoration(
            labelText: '密码',
            hintText: '请输入密码',
          ),obscureText: true,),
          ElevatedButton(child: Text('注 册'),onPressed: (){

          },),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 设置主轴对齐方式为两端对齐
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('已有账号？'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: TextButton(child: Text('去登录~'),onPressed: (){
                  Navigator.pushNamed(context, Routes.login);
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}