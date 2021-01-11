import 'package:flutter/material.dart';

class AppManager {
  static void ShowSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.amber[800]),
      ),
      backgroundColor: Colors.grey[900],
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }

  ///display item if the item is empty then add a message
  static List<Widget> DisplayItemsAccordingToState(
      List<Widget> items, String emptyItemMessage) {
    if (items.length == 0) {
      return <Widget>[
        Container(
          child: Text(
            emptyItemMessage,
            style: TextStyle(
              color: Colors.amber[800],
            ),
          ),
          alignment: Alignment.center,
         // height:double.infinity,
        ),
      ];
    } else {
      return items;
    }
  }
}
