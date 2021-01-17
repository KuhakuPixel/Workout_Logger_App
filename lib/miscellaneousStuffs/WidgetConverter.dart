import 'package:flutter/material.dart';

class WidgetConverterLibrary {
  ///returns in a list of widget with spacing between childs
  static List<Widget> BuildWidgetsWithSpace(
      double spaceBetweenItem, List<Widget> itemList) {
    List<Widget> newContentsList = <Widget>[];

    for (int i = 0; i < itemList.length; i++) {
      newContentsList.add(itemList[i]);

      //add boxing space accordingly
      newContentsList.add(
        SizedBox(height: spaceBetweenItem),
      );
    }
    return newContentsList;
  }
}
