import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

class AvailableExerciseAndButton extends StatelessWidget {
  final double height;
  final double width;
  final ExerciseItemWidget exerciseItemWidget;
  final double exerciseCardLeftPaddingValue;

  ///this function will be called when the user selects an exercise to be added to the new workout (on button press)
  final void Function(ExerciseItemWidget) onAddExerciseToPreviewFunction;

  AvailableExerciseAndButton({
    this.height,
    this.width,
    this.exerciseItemWidget,
    this.exerciseCardLeftPaddingValue = 12,
    this.onAddExerciseToPreviewFunction,
  }) {}
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //exercise card
        Container(
          child: InkWell(
            child: exerciseItemWidget,
            onTap: () {
            
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
          onPressed: () {
              print("Adding " +
                  this.exerciseItemWidget.exerciseName +
                  " To your workout");
              onAddExerciseToPreviewFunction(this.exerciseItemWidget);
              //go back to the latest route in the stack
              Navigator.pop(context);
          },
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
