import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

/// widget for containing an exercise item
class ExerciseItemWidget extends StatelessWidget {
  ///exercise item required property
  final String exerciseName;

  final ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  final String targetMuscle;
  //card spacing margin in the container
  final double cardLeftPaddingValue = 10;
  final double cardRightPaddingValue = 0;
  final double cardTopPaddingValue = 10;
  final double cardBottomPaddingValue = 0;

  //decoration
  Color textColor = Colors.amber[800];
  Color cardBorderColor = Colors
      .amber[800]; //ApplicationColorsPallete.ColorsPallete_["Light Grey 2"]
  Color cardBackgroundColor =
      ApplicationColorsPallete.ColorsPallete_["BlackGreyish"];
  //constructor
  ExerciseItemWidget({
    @required this.exerciseName,
    @required this.exerciseType,

    ///Only assign the value that are available inside muscleList
    @required this.targetMuscle,
  }) {}

  @override
  Widget build(BuildContext context) {
    //the item widget
    return Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  exerciseName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    letterSpacing: 0.4,
                    wordSpacing: 2,
                    color: this.textColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  " Target Muscles : " + targetMuscle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 0.4,
                    wordSpacing: 2,
                    color: this.textColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  " Exercise Type   : " +
                      ExerciseConverterClass.ConvertExerciseTypeEnumToString(
                          enumValue: this.exerciseType),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 0.4,
                    wordSpacing: 2,
                    color: this.textColor,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: EdgeInsets.only(
              left: this.cardLeftPaddingValue,
              right: this.cardRightPaddingValue,
              top: this.cardTopPaddingValue,
              bottom: this.cardBottomPaddingValue,
            ),
          ),

          //border property
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: this.cardBorderColor,
              width: 2.5,
            ),
          ),
          color: this.cardBackgroundColor
          //elevation:10000000000000,
          ),
      width: double.maxFinite,
      height: 100,
      //set padding size
    );
  }
}
