// 底部栏组件
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int likeCount;
  final int shareCount;
  final int commentCount;

  const BottomBar({
    super.key,
    required this.likeCount,
    required this.shareCount,
    required this.commentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(Icons.favorite),
              Text(likeCount.toString()),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.repeat),
              Text(shareCount.toString()),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.chat),
              Text(commentCount.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
