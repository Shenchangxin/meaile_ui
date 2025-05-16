// 菜品详情页面
import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'comment_section.dart';
import 'content_component.dart';
import 'media_component.dart';
import 'recent_share_friend.dart';
import 'share_bottom_sheet.dart';
import 'share_option.dart';
import 'top_bar.dart';

class FoodDetailPage extends StatefulWidget {
  final String? foodId;
  const FoodDetailPage({super.key,required this.foodId});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late FoodDetailData foodDetailData;
  bool isFollowing = false;
  late int likeCount;
  late int shareCount;
  late int commentCount;

  @override
  void initState() {
    super.initState();
    fetchFoodDetails();
  }

  void fetchFoodDetails() async {
    // 调用后端接口获取数据
    // 这里模拟数据获取过程
    setState(() {
      foodDetailData = FoodDetailData(
        userName: '账号名称',
        userAvatar: 'https://picsum.photos/30/30',
        title: '菜品标题',
        description: '这里是一些描述文字，介绍这道菜品的详细信息。',
        mediaUrls: [
          'https://picsum.photos/600/400',
          'https://picsum.photos/600/401',
        ],
        comments: [
          Comment(
            avatarUrl: 'https://picsum.photos/50/50',
            username: '用户名',
            content: '这是一个评论，这是这是一个评论，这是一个评论，这是一个评论，这是一个评论，这是一个评论。',
          ),
          Comment(
            avatarUrl: 'https://picsum.photos/50/51',
            username: '用户二',
            content: '这是另一个评论，这是另一个评论，这是另一个评论，这是另一个评论。',
          ),
        ],
      );
      likeCount = 123;
      shareCount = 456;
      commentCount = 789;
    });
  }

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
      // 调用后端关注/取关接口
    });
  }
  void showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShareBottomSheet(
          recentFriends: [
            RecentShareFriend(
              avatarUrl: 'https://picsum.photos/50/50',
              userName: '好友A',
            ),
            RecentShareFriend(
              avatarUrl: 'https://picsum.photos/50/51',
              userName: '好友B',
            ),
          ],
          firstRowOptions: [
            ShareOption(
              imageUrl: 'https://picsum.photos/30/30',
              optionName: '私信好友',
            ),
            ShareOption(
              imageUrl: 'https://picsum.photos/30/31',
              optionName: '微信好友',
            ),
            ShareOption(
              imageUrl: 'https://picsum.photos/30/32',
              optionName: '朋友圈',
            ),
          ],
          secondRowOptions: [
            ShareOption(
              imageUrl: 'https://picsum.photos/30/33',
              optionName: '建群分享',
            ),
            ShareOption(
              imageUrl: 'https://picsum.photos/30/34',
              optionName: '复制链接',
            ),
            ShareOption(
              imageUrl: 'https://picsum.photos/30/35',
              optionName: '生成分享图',
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 内容区域
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (foodDetailData.mediaUrls.isNotEmpty)
                  MediaComponent(mediaUrls: foodDetailData.mediaUrls),
                ContentComponent(
                  title: foodDetailData.title,
                  description: foodDetailData.description,
                ),
                CommentSection(comments: foodDetailData.comments),
              ],
            ),
          ),
          // 顶部栏
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopAppBar(
              userName: foodDetailData.userName,
              userAvatar: foodDetailData.userAvatar,
              onBack: () => Navigator.of(context).pop(),
              onFollow: toggleFollow,
              onShare: () {
                // 显示分享框的逻辑
              },
              isFollowing: isFollowing,
            ),
          ),
          // 底部栏
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomBar(
              likeCount: likeCount,
              shareCount: shareCount,
              commentCount: commentCount,
            ),
          ),
        ],
      ),
    );
  }
}

// 模拟数据模型
class FoodDetailData {
  final String userName;
  final String userAvatar;
  final String title;
  final String description;
  final List<String> mediaUrls;
  final List<Comment> comments;

  FoodDetailData({
    required this.userName,
    required this.userAvatar,
    required this.title,
    required this.description,
    required this.mediaUrls,
    required this.comments,
  });
}

class Comment {
  final String avatarUrl;
  final String username;
  final String content;

  Comment({
    required this.avatarUrl,
    required this.username,
    required this.content,
  });
}
