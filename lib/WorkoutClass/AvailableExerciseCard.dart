import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

class AvailableExerciseAndButton extends StatelessWidget {
  final double height;
  final double width;
  final ExerciseItemWidget exerciseItemWidget;
  final double exerciseCardLeftPaddingValue;
  AvailableExerciseAndButton(
      {this.height,
      this.width,
      this.exerciseItemWidget,
      this.exerciseCardLeftPaddingValue = 12}) {}
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //exercise card
        Container(
          child: InkWell(
            child: exerciseItemWidget,
            onTap: () {
              print("Adding " +
                  this.exerciseItemWidget.exerciseName +
                  " To your workout");
            },
            splashColor: Colors.amber[200],
            //focusColor: ,
            ///overlayColor: ,
            //borderRadius:BorderRadius.all(Radius.),
          ),
          height: this.height,
          width: this.width,
          padding: EdgeInsets.only(left: this.exerciseCardLeftPaddingValue),
        ),

        RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.amber[800],
          child: Icon(
            Icons.add,
            size: 15.0,
          ),
          //padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
