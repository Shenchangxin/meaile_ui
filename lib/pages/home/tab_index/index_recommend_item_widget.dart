import 'package:flutter/material.dart';
import '../../../widgets/common_image.dart';
import 'index_recommend_item.dart';

class IndexRecommendItemWidget extends StatelessWidget{
  final IndexRecommendItem data;
  const IndexRecommendItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  () {
        // 点击跳转逻辑
        if (data.navigateUri.isNotEmpty) {
          try {
            // 使用 Navigator.pushNamed 跳转到指定路由
            Navigator.pushNamed(context, data.navigateUri);
          } catch (e) {
            print('路由不存在：$e');
            // 处理路由不存在的情况，如显示错误提示
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('错误'),
                content: Text('跳转页面不存在！'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('确定'),
                  ),
                ],
              ),
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), // 圆角边框
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05), // 阴影颜色和透明度
              spreadRadius: 1, // 阴影扩展半径
              blurRadius: 1, // 阴影模糊半径
              offset: Offset(0, 1), // 阴影偏移
            ),
          ],
        ),
        width:
        (MediaQuery.of(context).size.width - 24) /
            2, // 计算每个项目的宽度
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 将图片放在具有圆角的 ClipRRect 中
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: CommonImage(
                imageUrl: data.imageUri,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.subTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis, // 设置超出部分显示为省略号
                    maxLines: 1, // 设置最大显示行数为1
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}