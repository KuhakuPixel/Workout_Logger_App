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
  final List<RawMaterialButton> listOfButton;
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
  ExerciseItemWidget({
    @required this.exerciseName,
    @required this.exerciseType,

    ///Only assign the value that are available inside muscleList
    @required this.targetMuscle,
    this.listOfButton=const <RawMaterialButton>[],
  }) {}

  ///display the exercise item info accordingly,
  ///will be used as the children of a row
  List<Widget> CreateWidgetInExerciseItemWidget(
    List<RawMaterialButton> listOfButton,
  ) {
    List<Widget> exerciseItemWidgets = <Widget>[
      //the column of exercise name,type and muscle target
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

    //add all of the remaining button
    for (int i = 0; i < listOfButton.length; i++) {
      exerciseItemWidgets.add(listOfButton[i]);
    }
    return exerciseItemWidgets;
  }

  @override
  Widget build(BuildContext context) {
    //the item widget
    return Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Row(
              children: CreateWidgetInExerciseItemWidget(this.listOfButton),
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
