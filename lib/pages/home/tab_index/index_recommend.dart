import 'package:flutter/material.dart';
import '../../../api/book/book_api.dart';
import '../../../model/meaile_book.dart';
import 'index_recommend_item.dart';
import 'index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {
  final List<IndexRecommendItem> recommendData;

  const IndexRecommend({super.key, required this.recommendData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '推荐',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Wrap(
            spacing: 8.0, // 水平间距
            runSpacing: 8.0, // 垂直间距
            children: recommendData.map((item) {
              return IndexRecommendItemWidget(data: item);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
