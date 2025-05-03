import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meaile_ui/routes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return MaterialApp(
      builder: (context, child) {
        return EasyLoading.init()(context, child);
      },
      theme: ThemeData(primaryColor: Colors.green),
      onGenerateRoute: router.generator,
    );
  }
}