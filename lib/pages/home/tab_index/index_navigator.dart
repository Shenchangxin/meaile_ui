import 'package:flutter/material.dart';
import '../../../widgets/common_image.dart';
import 'index_navigator_item.dart';

class IndexNavigator extends StatelessWidget{
  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigatorItemList.map((item) => InkWell(
          onTap: (){
            item.onTap(context);
          },
          child: Column(
            children: [
              SizedBox(
                width: 55,
                height: 55, // 指定图片的高度
                child: CommonImage(imageUrl: item.imageUri,fit: BoxFit.cover),
              ),
              Text(item.title,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.0),)
            ],
          ),
        )).toList(),
      ),
    );
  }
}