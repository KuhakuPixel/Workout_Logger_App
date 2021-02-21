import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "dart:convert";

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
  static List<Widget> DisplayItemsAccordingToState(List<Widget> items, String emptyItemMessage) {
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
///class to save and get saved json [Map<String,dynamic>]
class Prefences {
  ///save a json [Map<String,dynamic>)]
  static Future<void> saveJSON(String stringKey, Map<String, dynamic> json) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    //save the json by first turning it into a string with jsonEncode
    prefs.setString(stringKey, jsonEncode(json));
  }

  static Future<Map<String, dynamic>> getJSON(String stringKey) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    //get the json string from SharedPreferences
    String jsonString = prefs.getString(stringKey) ?? "";
    if(jsonString==""){
      debugPrintStack(label: "Null jsonValue",maxFrames: 2);
      return null;
    }
    //convert jsonString to map<String,dynamic> aka the json datatypes
    return jsonDecode(jsonString);
  }
}
