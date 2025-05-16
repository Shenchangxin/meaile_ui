// 内容组件
import 'package:flutter/material.dart';

class ContentComponent extends StatelessWidget {
  final String title;
  final String description;

  const ContentComponent({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          Text(description, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}