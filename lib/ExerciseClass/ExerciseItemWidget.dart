import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

/// widget for containing an exercise item
class ExerciseItemWidget extends StatelessWidget {
  ///this list will be assigned to the row in the card
  List<Widget> exerciseItemWidget = <Widget>[];

  ///exercise item required property
  final String exerciseName;

  final ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  final String targetMuscle;
  List<RawMaterialButton> listOfButton;
  //card spacing margin in the container
  final double cardLeftPaddingValue = 10;
  final double cardRightPaddingValue = 0;
  final double cardTopPaddingValue = 10;
  final double cardBottomPaddingValue = 0;

  //decoration
  Color textColor = Colors.amber[800];
  //ApplicationColorsPallete.ColorsPallete_["Light Grey 2"]
  Color cardBorderColor = Colors.amber[800];
  Color cardBackgroundColor =
      ApplicationColorsPallete.ColorsPallete_["BlackGreyish"];
  //constructor
  ExerciseItemWidget(
      {@required this.exerciseName,
      @required this.exerciseType,

      ///Only assign the value that are available inside muscleList
      @required this.targetMuscle}) {
    this.exerciseItemWidget = <Widget>[
      Column(
        children: <Widget>[
          //exercise name title
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
          //target muscle
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
          //exercise Type
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
    ];
  }

  ///this function will be called when the user selects an exercise to be added to the new workout (on button press)
  void Function(ExerciseCardWithVolumeWidget) addExerciseToWorkoutButtonEvent;

  ExerciseItemWidget.ExerciseCardWithAddButton(
      {this.exerciseName, this.exerciseType, this.targetMuscle}) {
    this.exerciseItemWidget = <Widget>[
      ///all of the infos
      Column(
        children: <Widget>[
          //exercise name title
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
          //target muscle
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
          //exercise Type
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
      //button here 
    ];
  }

  ExerciseItemWidget.ExerciseItemWithRepetitionCount(
      {this.exerciseName, this.exerciseType, this.targetMuscle}) {
    this.exerciseItemWidget = <Widget>[
      Column(
        children: <Widget>[
          //exercise name title
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
          //target muscle
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
          //exercise Type
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    //the item widget
    return Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Row(
              children: this.exerciseItemWidget,
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
