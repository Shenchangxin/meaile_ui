import 'package:flutter/material.dart';

// 顶部栏组件
class TopAppBar extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final VoidCallback onBack;
  final VoidCallback onFollow;
  final VoidCallback onShare;
  final bool isFollowing;

  const TopAppBar({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.onBack,
    required this.onFollow,
    required this.onShare,
    required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(userAvatar),
          ),
          const SizedBox(width: 10),
          Text(userName),
          const Spacer(),
          ElevatedButton(
            onPressed: onFollow,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            child: Text(isFollowing ? '已关注' : '关注', style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
          IconButton(icon: const Icon(Icons.share), onPressed: onShare),
        ],
      ),
    );
  }
}