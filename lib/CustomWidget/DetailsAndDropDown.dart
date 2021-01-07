import 'package:flutter/material.dart';

///A combined details and dropdown customized widget for the apps
class DropDownWithDetails extends StatelessWidget {
  final String dropDownStringValue;
  final String detailStringValue;
  final List<Widget> dropDownItemList;
  final double spaceBetween;
  final void Function(String) onDropDownValueChanged;
  DropDownWithDetails({
    @required this.dropDownStringValue,
    @required this.dropDownItemList,
    @required this.detailStringValue,
    @required this.spaceBetween,
    @required this.onDropDownValueChanged,
  }) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          //text widget
          Text(this.detailStringValue),
          SizedBox(width: this.spaceBetween),
          //the drop down
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

            ///bug :how can we set the state  because it is build via  showModalBottomSheet
            onChanged: (String newValue) {
              onDropDownValueChanged(newValue);
            },
            items: this.dropDownItemList,
          ),
        ],
      ),
    );
  }
}
