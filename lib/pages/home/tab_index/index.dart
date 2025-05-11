import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/home/tab_index/index_navigator.dart';
import 'package:meaile_ui/widgets/common_swiper.dart';

import '../../../api/book/book_api.dart';
import '../../../model/meaile_book.dart';
import 'index_recommend.dart';
import 'index_recommend_item.dart';
import 'index_search.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({super.key});

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {

  final ScrollController _scrollController = ScrollController();
  List<IndexRecommendItem> indexRecommendData = [];
  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasMore = true; // 是否还有更多数据，默认为 true
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fetchRecommendData();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isFetching && _hasMore) {
      loadMoreRecommendData();
    }
  }

  Future<void> fetchRecommendData() async {
    try {
      setState(() {
        _isFetching = true;
      });

      final bookApi = BookApi();
      final List<MeaileBook> bookList = await bookApi.getRecommendBookList(_currentPage, 10);

      setState(() {
        indexRecommendData = bookList.map((book) {
          String fileUrl = book.imageOssObj?.fileUrl ?? '';
          fileUrl = fileUrl.replaceFirst('127.0.0.1', '10.0.2.2');
          return IndexRecommendItem(
            book.bookName ?? '',
            book.introduction ?? '',
            fileUrl,
            '/book/getBookInfo/${book.id}',
          );
        }).toList();
        _isFetching = false;
      });
    } catch (e) {
      print('获取推荐数据失败: $e');
      setState(() {
        _isFetching = false;
      });
    }
  }

  Future<void> loadMoreRecommendData() async {
    if (_isFetching) return;

    setState(() {
      _isFetching = true;
    });

    try {
      final bookApi = BookApi();
      final List<MeaileBook> bookList = await bookApi.getRecommendBookList(_currentPage + 1, 10);

      if (bookList.isNotEmpty) {
        setState(() {
          _currentPage++;
          indexRecommendData.addAll(
            bookList.map((book) {
              String fileUrl = book.imageOssObj?.fileUrl ?? '';
              // fileUrl = fileUrl.replaceFirst('127.0.0.1', '10.0.2.2');
              return IndexRecommendItem(
                book.bookName ?? '',
                book.introduction ?? '',
                fileUrl,
                '/book/getBookInfo/${book.id}',
              );
            }).toList(),
          );
          _isFetching = false;
        });
      } else {
        setState(() {
          _hasMore = false;
          _isFetching = false;
        });
      }
    } catch (e) {
      print('加载更多推荐数据失败: $e');
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(padding: EdgeInsets.all(5)),
                SearchBarWithDropdown(),
                IndexNavigator(),
                CommonSwiper(),
                IndexRecommend(recommendData: indexRecommendData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
