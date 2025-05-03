import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> defaultImageList = [
  'https://picsum.photos/seed/picsum/200/300',
  'https://picsum.photos/seed/picsum/200/300',
  'https://picsum.photos/seed/picsum/200/300'
];
class CommonSwiper extends StatelessWidget{
  final List<String> imageList;
  const CommonSwiper({super.key,this.imageList = defaultImageList});

  @override
  Widget build(BuildContext context) {
    // 使用 CarouselSlider 组件实现轮播图
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0, // 轮播图的高度
        autoPlay: true, // 是否自动播放
        enlargeCenterPage: true, // 是否放大中心页面
        aspectRatio: 16 / 9, // 宽高比
        autoPlayInterval: Duration(seconds: 3), // 自动播放间隔时间
        autoPlayAnimationDuration: Duration(milliseconds: 800), // 自动播放动画时长
        autoPlayCurve: Curves.fastOutSlowIn, // 自动播放动画曲线
        pauseAutoPlayOnTouch: true, // 触摸时暂停自动播放
        viewportFraction: 0.98, // 每个页面的显示比例
      ),
      items: imageList.map((url) {
        // 使用 map 方法将图片 URL 转换为轮播图的页面
        return Builder(
          builder: (BuildContext context) {
            // 返回一个 Container，用于显示图片
            return Container(
              width: MediaQuery.of(context).size.width, // 容器宽度为屏幕宽度
              margin: EdgeInsets.symmetric(horizontal: 5.0), // 左右外边距为 5.0
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // 圆角半径为 10.0
                image: DecorationImage(
                  image: NetworkImage(url), // 使用 NetworkImage 加载网络图片
                  fit: BoxFit.cover, // 图片填充方式为覆盖整个容器
                ),
              ),
            );
          },
        );
      }).toList(), // 将 map 的结果转换为 List
    );
  }
}