import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:flutter/material.dart';

class ExerciseVolumeWidget extends StatefulWidget {
  Color textColor;
  double buttonsHeight;
  ExerciseType exerciseType;
  ExerciseVolumeWidget(
      {@required Color textColor,
      @required ExerciseType exerciseType,
      @required double buttonHeight}) {
    //initialize instance value
    this.textColor = textColor;
    this.buttonsHeight = buttonHeight;
    this.exerciseType = exerciseType;
  }

  @override
  _ExerciseVolumeWidgetState createState() => _ExerciseVolumeWidgetState();
}

class _ExerciseVolumeWidgetState extends State<ExerciseVolumeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //rep text and stuff

        Container(
          child: Text(
            "Set",
            style: TextStyle(
              color: widget.textColor,
            ),
          ),
          alignment: Alignment.topLeft,
        ),

        //add more instances
        Row(
          children: <Widget>[
            Text("0"),
            AmberTextInput(
              labelText: "Reps",
              onChanged: (stringValue) {},
              leftPaddingValue: 0,
              textInputWidth: 50,
              
            ),
            AmberTextInput(
              labelText: "Weight",
              onChanged: (stringValue) {},
              leftPaddingValue: 0,
              textInputWidth: 50,
            ),
            SizedBox(
              width: 5,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),

        //button to add set or remove set

        Container(
          child: Row(
              children: [
                //add set button
                Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "New Set",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.amber[800],
                    splashColor: Colors.amber[200],
                    highlightColor: Colors.amber[200],
                  ),
                  padding: EdgeInsets.only(
                    right: 10,
                    top: 14,
                  ),
                  height: widget.buttonsHeight,
                ),
                //remove set button
                Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Remove Set",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.amber[800],
                    splashColor: Colors.amber[200],
                    highlightColor: Colors.amber[200],
                  ),
                  padding: EdgeInsets.only(
                    right: 10,
                    top: 14,
                  ),
                  height: widget.buttonsHeight,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
