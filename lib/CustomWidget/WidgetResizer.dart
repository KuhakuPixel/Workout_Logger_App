import 'package:flutter/material.dart';

class ResizedWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget widget;
  const ResizedWidget({this.height, this.width,this.widget}){}
  @override
  Widget build(BuildContext context) {
    return Container(
      child:this.widget,
      height: this.height,
      width:this.width,
    );
  }
}