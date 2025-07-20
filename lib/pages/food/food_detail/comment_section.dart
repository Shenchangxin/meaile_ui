// 评论区组件
import 'package:flutter/material.dart';

import '../../../model/meaile_comment.dart';
import 'comment_item.dart';

class CommentSection extends StatelessWidget {
  final List<MeaileComment> comments;

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
            avatarUrl: comment.avatarUrl ?? '',
            userName: comment.userName ?? '',
            commentContent: comment.commentContent ?? '',
          )),
        ],
      ),
    );
  }
}