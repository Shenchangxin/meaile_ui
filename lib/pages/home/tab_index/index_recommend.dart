import 'package:flutter/material.dart';
import 'package:meaile_ui/widgets/common_image.dart';
import 'index_recommend_item.dart';
import 'index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {
  const IndexRecommend({super.key});

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
                  // return InkWell(
                  //   onTap:  () {
                  //     // 点击跳转逻辑
                  //     if (item.navigateUri.isNotEmpty) {
                  //       try {
                  //         // 使用 Navigator.pushNamed 跳转到指定路由
                  //         Navigator.pushNamed(context, item.navigateUri);
                  //       } catch (e) {
                  //         print('路由不存在：$e');
                  //         // 处理路由不存在的情况，如显示错误提示
                  //         showDialog(
                  //           context: context,
                  //           builder: (context) => AlertDialog(
                  //             title: Text('错误'),
                  //             content: Text('跳转页面不存在！'),
                  //             actions: [
                  //               TextButton(
                  //                 onPressed: () => Navigator.of(context).pop(),
                  //                 child: Text('确定'),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       }
                  //     }
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12.0), // 圆角边框
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.05), // 阴影颜色和透明度
                  //           spreadRadius: 1, // 阴影扩展半径
                  //           blurRadius: 1, // 阴影模糊半径
                  //           offset: Offset(0, 1), // 阴影偏移
                  //         ),
                  //       ],
                  //     ),
                  //     width:
                  //     (MediaQuery.of(context).size.width - 24) /
                  //         2, // 计算每个项目的宽度
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         // 将图片放在具有圆角的 ClipRRect 中
                  //         ClipRRect(
                  //           borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(12.0),
                  //             topRight: Radius.circular(12.0),
                  //           ),
                  //           child: CommonImage(
                  //             imageUrl: item.imageUri,
                  //             fit: BoxFit.cover,
                  //             height: 150,
                  //             width: double.infinity,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 item.title,
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 16,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 item.subTitle,
                  //                 style: TextStyle(
                  //                   fontSize: 14,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
