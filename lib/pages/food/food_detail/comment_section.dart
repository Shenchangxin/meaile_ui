// 评论区组件
import 'package:flutter/material.dart';

import 'comment_item.dart';
import 'index.dart';

class CommentSection extends StatelessWidget {
  final List<Comment> comments;

  const CommentSection({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('评论', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          ...comments.map((comment) => CommentItem(
            avatarUrl: comment.avatarUrl,
            username: comment.username,
            content: comment.content,
          )).toList(),
        ],
      ),
    );
  }
}