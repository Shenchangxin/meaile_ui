// 最近分享的好友
import 'package:flutter/material.dart';

class RecentShareFriend extends StatelessWidget {
  final String avatarUrl;
  final String userName;

  const RecentShareFriend({
    super.key,
    required this.avatarUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 8),
        Text(userName),
      ],
    );
  }
}

