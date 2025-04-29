import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/index.dart';
import 'package:meaile_ui/pages/login.dart';

class Routes {
  final String home = '/';
  final String login = '/login';

  final _homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return HomePage();
    },
  );
  final _loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return LoginPage();
    },
  );

}