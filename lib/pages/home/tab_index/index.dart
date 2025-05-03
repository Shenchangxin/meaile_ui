import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/tab_index/index_navigator.dart';
import 'package:meaile_ui/widgets/common_swiper.dart';

import 'index_recommend.dart';
import 'index_search.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabIndex', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(children: [
        Padding(padding: EdgeInsets.all(5)),
        SearchBarWithDropdown(),
        IndexNavigator(),
        // Padding(padding: EdgeInsets.all(15)),
        CommonSwiper(),
        IndexRecommend(),
        Text('这里是内容区域')
      ]),
    );
  }
}
