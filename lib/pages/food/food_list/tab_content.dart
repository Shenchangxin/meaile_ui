import 'package:flutter/material.dart';
import '../../home/tab_index/index_recommend_item.dart';
import '../../home/tab_index/index_recommend_item_widget.dart';

class TabContentWidget extends StatefulWidget {
  final List<String> titleList;
  final int titleIndex;
  final List<IndexRecommendItem> contentList;
  final Function(int index) onTitleSelected; // 添加回调函数

  const TabContentWidget({
    super.key,
    required this.titleList,
    required this.titleIndex,
    required this.contentList,
    required this.onTitleSelected, // 添加回调函数参数
  });

  @override
  State<TabContentWidget> createState() => _TabContentWidgetState();
}

class _TabContentWidgetState extends State<TabContentWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.titleIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTitleSelected(index); // 调用回调函数
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 导航栏
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 50,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.titleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _onTabTapped(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: double.infinity,
                        alignment: Alignment.center,
                        decoration:
                            _currentIndex == index
                                ? const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                  ),
                                )
                                : null,
                        child: Text(
                          widget.titleList[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                _currentIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color:
                                _currentIndex == index
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // 内容区域
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children:
                widget.contentList.map((item) {
                  return IndexRecommendItemWidget(data: item);
                }).toList(),
          ),
        ),
      ],
    );
  }
}
