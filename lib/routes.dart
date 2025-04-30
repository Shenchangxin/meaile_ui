import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/index.dart';
import 'package:meaile_ui/pages/login.dart';
import 'package:meaile_ui/pages/not_found.dart';
import 'package:meaile_ui/pages/recipe_detail/recipe_detail.dart';
import 'package:meaile_ui/pages/register.dart';

class Routes {
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String recipeDetail = '/recipe/:recipeId';


  static final Handler _homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return HomePage();
    });
  static final Handler _loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return LoginPage();
    },
  );
  static final Handler _registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return RegisterPage();
    },
  );
  static final Handler _notFound_Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return NotFoundPage();
    },
  );
  static final Handler _recipeDetail_Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return RecipeDetailPage(recipeId: params['recipeId'][0]);
    },
  );

  static void configureRoutes(FluroRouter router){
    router.define(home,handler: _homeHandler);
    router.define(login,handler: _loginHandler);
    router.define(register,handler: _registerHandler);
    router.define(recipeDetail,handler: _recipeDetail_Handler);
    router.notFoundHandler = _notFound_Handler;
  }

}