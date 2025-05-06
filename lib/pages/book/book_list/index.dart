import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/book/book_list/tab_content.dart';
import '../../../api/book/book_api.dart';
import '../../../model/meaile_book.dart';
import '../../home/tab_index/index_recommend_item.dart';
import '../../home/tab_index/index_search.dart';

class FoodCourtPage extends StatefulWidget {
  const FoodCourtPage({super.key});

  @override
  State<FoodCourtPage> createState() => _FoodCourtPageState();
}

class _FoodCourtPageState extends State<FoodCourtPage> {

  final ScrollController _scrollController = ScrollController();
  List<IndexRecommendItem> indexRecommendData = [];
  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasMore = true; // 是否还有更多数据，默认为 true
  int _currentTabIndex = 1; // 当前选中的导航索引
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
              fileUrl = fileUrl.replaceFirst('127.0.0.1', '10.0.2.2');
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
  List<String> titleList = ['关注', '推荐', '减脂', '增肌', '分类'];
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
                TabContentWidget(
                  titleList: titleList,
                  titleIndex: _currentTabIndex,
                  contentList: indexRecommendData,
                  onTitleSelected: (index) {
                    setState(() {
                      _currentTabIndex = index;
                      // 根据选中的索引加载对应的内容
                      switch (index) {
                        case 0: // 关注
                        // 加载关注内容
                          break;
                        case 1: // 推荐
                          fetchRecommendData();
                          break;
                        case 2: // 减脂
                        // 加载减脂内容
                          break;
                        case 3: // 增肌
                        // 加载增肌内容
                          break;
                        case 4: // 分类
                        // 加载分类内容
                          break;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
