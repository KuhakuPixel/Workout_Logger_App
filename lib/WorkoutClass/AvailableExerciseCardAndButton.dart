import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:flutter/material.dart';

///a set of exercise item widget and a button  that are wrapped with row and wrapped again with expanded
class AvailableExerciseAndButton extends StatelessWidget {
  final double exerciseItemheight;
  final double exerciseItemwidth;
  final ExerciseItemWidget exerciseItemWidget;
  final double exerciseCardLeftPaddingValue;

  ///this function will be called when the user selects an exercise to be added to the new workout (on button press)
  final void Function(ExerciseCardWithVolumeWidget)
      addExerciseToWorkoutButtonEvent;

  AvailableExerciseAndButton({
    @required this.exerciseItemheight,
    @required this.exerciseItemwidth,
    @required this.exerciseItemWidget,
    @required this.exerciseCardLeftPaddingValue = 12,
    @required this.addExerciseToWorkoutButtonEvent,
  }) {}
  //the widget instance deosnt build the widget when it is mapped into the list

  //things to do:
  //it should be better to separate this widget class from the original exercise item widget
  //or to create many overload for the exerciseitemwidget (unlikely)
  @override
  Widget build(BuildContext context) {
    //WRAPPING with expanded to fix overflow
    return Row(
      children: <Widget>[
        //exercise card
        Container(
          child: InkWell(
            child: exerciseItemWidget,
            onTap: () {},
            splashColor: Colors.amber[200],
            //focusColor: ,
            ///overlayColor: ,
            //borderRadius:BorderRadius.all(Radius.),
          ),
          height: this.exerciseItemheight,
          width: this.exerciseItemwidth,
          padding: EdgeInsets.only(left: this.exerciseCardLeftPaddingValue),
        ),

        RawMaterialButton(
          onPressed: () {
            print("Adding " +
                this.exerciseItemWidget.exerciseName +
                " To your workout");
            addExerciseToWorkoutButtonEvent(
              new ExerciseCardWithVolumeWidget(
                exerciseItem: this.exerciseItemWidget,
              ),
            );
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
