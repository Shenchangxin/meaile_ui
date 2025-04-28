import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/index.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HomePage(),
    );
  }
}