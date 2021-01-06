import 'package:flutter/material.dart';

///A combined details and dropdown customized widget for the apps
class DropDownWithDetails extends StatelessWidget {
  final String dropDownStringValue;
  final String detailStringValue;
  final List<Widget> dropDownItemList;
  final double spaceBetween;
  DropDownWithDetails({
    this.dropDownStringValue,
    this.dropDownItemList,
    this.detailStringValue,
    this.spaceBetween,
  }) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          //text widget
          Text(this.detailStringValue),
          SizedBox(
            width: this.spaceBetween
          ),
          DropdownButton<String>(
            value: this.dropDownStringValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {},
            items: this.dropDownItemList,
          ),
        ],
      ),
    );
  }
}
