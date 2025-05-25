import '../../http/http_util.dart';
import '../../model/meaile_food.dart';
import '../../model/vo/food_detail_vo.dart';
import '../api_constants.dart';

class FoodApi {
  ///查询美食广场页面关注列表
  Future<List<MeaileFood>> getFollowFoodList(int pageNum, int pageSize) async {
    try {
      // 构建请求参数
      Map<String, dynamic> queryParams = {
        'pageNum': pageNum,
        'pageSize': pageSize,
      };

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        ApiConstants.FOOD_FOLLOW_LIST,
        queryParameters: queryParams,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileFood 对象列表
        List<MeaileFood> foodList = (response.data['data'] as List)
            .map((item) => MeaileFood.fromJson(item))
            .toList();

        return foodList;
      } else {
        throw Exception('获取关注列表失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取关注列表时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
  ///查询美食广场页面推荐列表
  Future<List<MeaileFood>> getRecommendFoodList(int pageNum, int pageSize) async {
    try {
      // 构建请求参数
      Map<String, dynamic> queryParams = {
        'pageNum': pageNum,
        'pageSize': pageSize,
      };

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        ApiConstants.FOOD_RECOMMEND_LIST,
        queryParameters: queryParams,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileFood 对象列表
        List<MeaileFood> foodList = (response.data['data'] as List)
            .map((item) => MeaileFood.fromJson(item))
            .toList();

        return foodList;
      } else {
        throw Exception('获取关注列表失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取关注列表时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
  ///查询美食广场页面减脂列表
  Future<List<MeaileFood>> getFatLossFoodList(int pageNum, int pageSize) async {
    try {
      // 构建请求参数
      Map<String, dynamic> queryParams = {
        'pageNum': pageNum,
        'pageSize': pageSize,
      };

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        ApiConstants.FOOD_FATLOSS_LIST,
        queryParameters: queryParams,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileFood 对象列表
        List<MeaileFood> foodList = (response.data['data'] as List)
            .map((item) => MeaileFood.fromJson(item))
            .toList();

        return foodList;
      } else {
        throw Exception('获取关注列表失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取关注列表时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
  ///查询美食广场页面增肌列表
  Future<List<MeaileFood>> getMuscleBuildingFoodList(int pageNum, int pageSize) async {
    try {
      // 构建请求参数
      Map<String, dynamic> queryParams = {
        'pageNum': pageNum,
        'pageSize': pageSize,
      };

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        ApiConstants.FOOD_MUSCLEBUILDING_LIST,
        queryParameters: queryParams,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileFood 对象列表
        List<MeaileFood> foodList = (response.data['data'] as List)
            .map((item) => MeaileFood.fromJson(item))
            .toList();

        return foodList;
      } else {
        throw Exception('获取关注列表失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取关注列表时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
  Future<FoodDetailData> getFoodInfo(String foodId) async {
    try {
      // 构建请求 URL，包含路径参数 foodId
      String url = '${ApiConstants.FOOD_GETFOODINFO}$foodId';

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        url,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileFood 对象
        FoodDetailData food = FoodDetailData.fromJson(response.data['data']);

        return food;
      } else {
        throw Exception('获取食物信息失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取食物信息时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
}