import 'package:flutter/material.dart';

///use this widget to resize any widget created be it built in or custom,

class ResizedWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget widget;
   ResizedWidget({this.height, this.width,this.widget}){}
  @override
  Widget build(BuildContext context) {
    ///taking advantage of container
    return Container(
      child:this.widget,
      height: this.height,
      width:this.width,
    );
  }
}