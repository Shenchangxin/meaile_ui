import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/tab_index/index.dart';
import 'package:meaile_ui/widgets/page_content.dart';


List<Widget> tabViewList = [
  TabIndex(),
  PageContent(name: '食记'),
  PageContent(name: '营养师'),
  PageContent(name: '我的'),
];

List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(label: '首页',icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: '食记',icon: Icon(Icons.add_card_rounded)),
  BottomNavigationBarItem(label: '营养师',icon: Icon(Icons.adb_sharp)),
  BottomNavigationBarItem(label: '我的',icon: Icon(Icons.account_circle)),
];


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

    );
  }
}