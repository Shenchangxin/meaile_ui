import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final String? bookId;

  const BookDetailPage({super.key , required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('菜谱详情页面bookId: $bookId'),),
    );
  }
}