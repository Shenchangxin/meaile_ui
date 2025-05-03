import 'package:flutter/cupertino.dart';

class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext context) onTap;
  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> navigatorItemList = [
  IndexNavigatorItem('美食广场', 'static/images/美食.png', (BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }),
  IndexNavigatorItem('达人秀', 'static/images/相机.png', (BuildContext context) {
    Navigator.of(context).pushNamed('routeName');
  }),
  IndexNavigatorItem('食材选购', 'static/images/手提包.png', (BuildContext context) {
    Navigator.of(context).pushNamed('routeName');
  }),
  IndexNavigatorItem('膳食攻略', 'static/images/笔记.png', (BuildContext context) {
    Navigator.of(context).pushNamed('routeName');
  }),
];
