// 评论项组件
import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  final String avatarUrl;
  final String userName;
  final String commentContent;

  const CommentItem({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.commentContent,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(widget.avatarUrl),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    isExpanded
                        ? widget.commentContent
                        : (widget.commentContent.length > 30 ? '${widget.commentContent.substring(0, 30)}...' : widget.commentContent),
                  ),
                  if (widget.commentContent.length > 30)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(isExpanded ? '收起' : '展开'),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}