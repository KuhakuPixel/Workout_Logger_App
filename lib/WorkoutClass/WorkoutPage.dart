import 'package:WorkoutLoggerApp/ContentPages/page.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "WorkoutPage",
      spaceBetweenItem: 5,
      itemList: <Widget>[
        Text("Hello world"),
      ],
      modalPageWidgets: <Widget>[
        Text("Hello world"),
      ],
    );
  }
}
