import 'package:flutter/material.dart';
import '../../../api/book/book_api.dart';
import '../../../model/meaile_book.dart';
import 'index_recommend_item.dart';
import 'index_recommend_item_widget.dart';

class IndexRecommend extends StatefulWidget {
  const IndexRecommend({super.key});

  @override
  State<IndexRecommend> createState() => _IndexRecommendState();
}

class _IndexRecommendState extends State<IndexRecommend> {
  List<IndexRecommendItem> indexRecommendData = [];
  @override
  void initState() {
    super.initState();
    fetchRecommendData();
  }

  Future<void> fetchRecommendData() async {
    try {
      final bookApi = BookApi();
      final List<MeaileBook> bookList = await bookApi.getRecommendBookList(1, 10);

      setState(() {
        indexRecommendData = bookList.map((book) {
          String fileUrl = book.imageOssObj?.fileUrl ?? '';
          // 将 127.0.0.1 替换为 10.0.2.2
          fileUrl = fileUrl.replaceFirst('127.0.0.1', '10.0.2.2');
          return IndexRecommendItem(
            book.bookName ?? '',
            book.introduction ?? '',
            // book.imageOssObj?.fileUrl ?? '',
            fileUrl,
            '/book/getBookInfo/${book.id}', // 这里替换成实际的导航 URI
          );
        }).toList();
      });
    } catch (e) {
      print('获取推荐数据失败: $e');
    }
  }

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
            children:
                indexRecommendData.map((item) {
                  return IndexRecommendItemWidget(data: item);
                }).toList(),
          ),
        ),
      ],
    );
  }
}
