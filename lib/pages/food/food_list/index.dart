import 'package:flutter/material.dart';
import 'package:meaile_ui/pages/food/food_list/tab_content.dart';
import '../../../api/food/food_api.dart';
import '../../../model/meaile_food.dart';
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
  int _currentTabIndex = 0; // 当前选中的导航索引
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fetchRecommendData(_currentTabIndex);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isFetching && _hasMore) {
      loadMoreRecommendData(_currentTabIndex);
    }
  }

  Future<void> fetchRecommendData(int index) async {
    indexRecommendData.clear();
    try {
      setState(() {
        _isFetching = true;
      });

      final foodApi = FoodApi();
      List<MeaileFood> foodList=[];
      if(index == 0){
        foodList = await foodApi.getFollowFoodList(_currentPage, 10);
      }else if (index == 1){
        foodList = await foodApi.getRecommendFoodList(_currentPage, 10);
      }else if (index == 2){
        foodList = await foodApi.getFatLossFoodList(_currentPage, 10);
      }else if (index == 3){
        foodList = await foodApi.getMuscleBuildingFoodList(_currentPage, 10);
      }else if (index == 4){
        foodList = await foodApi.getRecommendFoodList(_currentPage, 10);
      }
      setState(() {
        indexRecommendData = foodList.map((food) {
          String fileUrl = food.imageOssObj?.fileUrl ?? '';
          // fileUrl = fileUrl.replaceFirst('127.0.0.1', '10.0.2.2');
          return IndexRecommendItem(
            food.foodName ?? '',
            food.introduction ?? '',
            fileUrl,
            '/food/getFoodInfo/${food.id}',
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

  Future<void> loadMoreRecommendData(int index) async {
    if (_isFetching) return;

    setState(() {
      _isFetching = true;
    });

    try {
      final foodApi = FoodApi();
      List<MeaileFood> foodList=[];
      if(index == 0){//关注列表
        foodList = await foodApi.getFollowFoodList(_currentPage + 1, 10);
      }else if (index == 1){//推荐列表
        foodList = await foodApi.getRecommendFoodList(_currentPage + 1, 10);
      }else if (index == 2){//减脂
        foodList = await foodApi.getFatLossFoodList(_currentPage + 1, 10);
      }else if (index == 3){//增肌
        foodList = await foodApi.getMuscleBuildingFoodList(_currentPage + 1, 10);
      }else if (index == 4){//分类
        foodList = await foodApi.getRecommendFoodList(_currentPage + 1, 10);
      }
      if (foodList.isNotEmpty) {
        setState(() {
          _currentPage++;
          indexRecommendData.addAll(
            foodList.map((food) {
              String fileUrl = food.imageOssObj?.fileUrl ?? '';
              fileUrl = fileUrl.replaceFirst('127.0.0.1', '10.0.2.2');
              return IndexRecommendItem(
                food.foodName ?? '',
                food.introduction ?? '',
                fileUrl,
                '/food/getFoodInfo/${food.id}',
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
        title: Text('美食广场', style: TextStyle(color: Colors.white)),
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
                    });
                    fetchRecommendData(index);
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
