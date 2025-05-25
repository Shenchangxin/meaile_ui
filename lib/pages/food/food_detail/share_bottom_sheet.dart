// 分享框组件
import 'package:flutter/material.dart';

import 'recent_share_friend.dart';
import 'share_option.dart';

class ShareBottomSheet extends StatelessWidget {
  final List<RecentShareFriend> recentFriends;
  final List<ShareOption> firstRowOptions;
  final List<ShareOption> secondRowOptions;

  const ShareBottomSheet({
    super.key,
    required this.recentFriends,
    required this.firstRowOptions,
    required this.secondRowOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 第一行：最近分享过的好友
          const Text('最近分享', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recentFriends.map((friend) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: friend,
              )).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // 第二行：分享选项
          const Text('分享到', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: firstRowOptions.map((option) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: option,
              )).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // 第三行：更多选项
          const Text('更多', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: secondRowOptions.map((option) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: option,
              )).toList(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}