import '../../http/http_util.dart';
import '../../model/meaile_comment.dart';
import '../api_constants.dart';

class CommentApi {
  ///查询评论列表，分页
  Future<List<MeaileComment>> getCommentListByBizId(int pageNum, int pageSize,int bizId) async {
    try {
      // 构建请求参数
      Map<String, dynamic> queryParams = {
        'pageNum': pageNum,
        'pageSize': pageSize,
        'bizId': bizId,
      };

      // 调用 HttpUtil 的 get 方法请求后端接口
      DioResponse response = await HttpUtil().get(
        ApiConstants.COMMENT_GETCOMMENTLISTBYBIZID,
        queryParameters: queryParams,
      );

      // 检查响应状态码
      if (response.code == 200) {
        // 将响应数据转换为 MeaileComment 对象列表
        List<MeaileComment> commentList = (response.data['data'] as List)
            .map((item) => MeaileComment.fromJson(item))
            .toList();

        return commentList;
      } else {
        throw Exception('获取评论列表失败: ${response.message}');
      }
    } catch (e) {
      // 处理异常
      print('获取评论列表时发生错误: $e');
      rethrow; // 重新抛出异常，让调用者可以处理
    }
  }
}