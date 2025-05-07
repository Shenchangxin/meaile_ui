import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/food/food_list/index.dart';
import 'package:meaile_ui/pages/home/index.dart';
import 'package:meaile_ui/pages/login.dart';
import 'package:meaile_ui/pages/not_found.dart';
import 'package:meaile_ui/pages/book/book_detail/book_detail.dart';
import 'package:meaile_ui/pages/register.dart';

class Routes {
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String bookDetail = '/book/getBookInfo/:bookId';
  static String foodCourt = '/foodCourt';


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
  static final Handler _bookDetail_Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return BookDetailPage(bookId: params['bookId'][0]);
    },
  );
  static final Handler _foodCourt_Handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return FoodCourtPage();
    },
  );

  static void configureRoutes(FluroRouter router){
    router.define(home,handler: _homeHandler);
    router.define(login,handler: _loginHandler);
    router.define(register,handler: _registerHandler);
    router.define(bookDetail,handler: _bookDetail_Handler);
    router.define(foodCourt,handler: _foodCourt_Handler);
    router.notFoundHandler = _notFound_Handler;
  }

}