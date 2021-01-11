import 'package:WorkoutLoggerApp/ContentPages/page.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  ///this is the value for all of the widgets in the modal bottom page
  double modalWidgetsLeftPaddingValue = 6;
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "WorkoutPage",
      spaceBetweenItem: 5,
      itemList: <Widget>[
        Text("Hello world"),
      ],
      bottomModalPageInputWidgets: <Widget>[
        ///widget for the modal page input
        //Exercise name input
        AmberTextInput(
          labelText: "Type workout Name here",
          onChanged: (stringValue) {},
          leftPaddingValue: 6,
          textInputWidth: 250,
        ),
        SizedBox(
          height: 20,
        ),
        //search bar
        AmberTextInput(
          labelText: "Search shit",
          onChanged: (stringValue) {},
          leftPaddingValue: 6,
          textInputWidth: 250,
          textInputHeight:50,
        ),
        SizedBox(
          height: 10,
        ),
        CloseModalBottomPageAndConfirmButtonWidget(
          onPressedCloseButton: () {
            //go back to the last page in the route stack
            Navigator.pop(context);
          },
          onPressedConfirmButton: () {},
        )
        
      ],
    );
  }
}
