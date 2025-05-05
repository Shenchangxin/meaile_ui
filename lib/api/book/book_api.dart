import 'package:meaile_ui/model/meaile_book.dart';

import '../../http/http_util.dart';
import '../api_constants.dart';

class BookApi {

  Future<List<MeaileBook>> getRecommendBookList(int pageNum, int pageSize) async {
    try {
      // 构建请求参数
      Map<String, dynamic> queryParams = {
        'pageNum': pageNum,
        'pageSize': pageSize,
      };

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        ApiConstants.BOOK_RECOMMEND_LIST, // 替换为实际的接口路径
        queryParameters: queryParams,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileBook 对象列表
        List<MeaileBook> bookList = (response.data['data']['list'] as List)
            .map((item) => MeaileBook.fromJson(item))
            .toList();

        return bookList;
      } else {
        throw Exception('获取推荐书籍列表失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取推荐书籍列表时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
}