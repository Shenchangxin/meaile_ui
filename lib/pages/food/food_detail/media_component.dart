// 视频/图片组件
import 'package:flutter/material.dart';

class MediaComponent extends StatelessWidget {
  final List<String> mediaUrls;

  const MediaComponent({
    super.key,
    required this.mediaUrls,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        children: mediaUrls.map((url) => Image.network(url, fit: BoxFit.cover)).toList(),
      ),
    );
  }
}