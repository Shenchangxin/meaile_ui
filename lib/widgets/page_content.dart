import 'package:flutter/material.dart';

import '../routes.dart';

class PageContent extends StatelessWidget {
  final String name;

  const PageContent({super.key , required this.name});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('当前页面 ：$name'),),
      body: ListView(
        children: <Widget>[
          TextButton(child: Text(Routes.home),onPressed: (){
            Navigator.pushNamed(context, Routes.home);
          },),
          TextButton(child: Text(Routes.login),onPressed: (){
            Navigator.pushNamed(context, Routes.login);
          },),
          TextButton(child: Text('Not Found'),onPressed: (){
            Navigator.pushNamed(context, '/notFound');
          },),
          TextButton(child: Text('房屋详情页，id: 123'),onPressed: (){
            Navigator.pushNamed(context, '/recipe/123');
          },),
        ],),
    );
    throw UnimplementedError();
  }
}