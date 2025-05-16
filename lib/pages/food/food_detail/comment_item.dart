// 评论项组件
import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  final String avatarUrl;
  final String username;
  final String content;

  const CommentItem({
    super.key,
    required this.avatarUrl,
    required this.username,
    required this.content,
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
                  Text(widget.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    isExpanded
                        ? widget.content
                        : (widget.content.length > 30 ? '${widget.content.substring(0, 30)}...' : widget.content),
                  ),
                  if (widget.content.length > 30)
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