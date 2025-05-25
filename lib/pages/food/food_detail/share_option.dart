// 分享选项
import 'package:flutter/material.dart';

class ShareOption extends StatelessWidget {
  final String imageUrl;
  final String optionName;

  const ShareOption({
    super.key,
    required this.imageUrl,
    required this.optionName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(height: 5),
        Text(optionName, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}