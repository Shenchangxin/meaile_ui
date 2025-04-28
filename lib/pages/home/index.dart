import 'package:flutter/material.dart';
import 'package:meaile_ui/widgets/page_content.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: PageContent(name: '首页'),
    );
  }
}