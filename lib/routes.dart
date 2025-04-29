import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/index.dart';
import 'package:meaile_ui/pages/login.dart';

class Routes {
  static String home = '/';
  static String login = '/login';


  static final Handler _homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return HomePage();
    });
  static final Handler _loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return LoginPage();
    },
  );

  static void configureRoutes(FluroRouter router){
    router.define(home,handler: _homeHandler);
    router.define(login,handler: _loginHandler);
  }

}