import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseVolumeWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

/// widget for containing an exercise item
class ExerciseItemWidget extends StatelessWidget {
  ////////////////////////////////////////////////////////ExerciseWidgetProperty//////////////////////////////////////////////////////

  ///this list will be assigned to the row in the card
  Widget exerciseItemWidget = Text("Null");
  //decoration
  Color textColor = Colors.amber[800];
  //ApplicationColorsPallete.ColorsPallete_["Light Grey 2"]
  Color cardBorderColor = Colors.amber[800];
  Color cardBackgroundColor =
      ApplicationColorsPallete.ColorsPallete_["BlackGreyish"];

  double exerciseCardHeight = 100;
  //card spacing margin in the container
  final double cardLeftPaddingValue = 10;
  final double cardRightPaddingValue = 0;
  final double cardTopPaddingValue = 10;
  final double cardBottomPaddingValue = 0;

  ////////////////////////////////////////////////////////ExerciseProperty//////////////////////////////////////////////////////
  ///exercise item required property
  final String exerciseName;

  final ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  final String targetMuscle;

  //constructor
  ExerciseItemWidget(
      {@required this.exerciseName,
      @required this.exerciseType,

      ///Only assign the value that are available inside muscleList
      @required this.targetMuscle}) {
    this.exerciseItemWidget = Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Row(
              children: <Widget>[
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
                          ExerciseConverterClass
                              .ConvertExerciseTypeEnumToString(
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
              ],
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
      height: this.exerciseCardHeight,
      //set padding size
    );
  }

  ///a callback function will be called when the user selects an exercise to be added to the new workout (on button press)
  ///todo:assign this function to be called on button press
  void Function(ExerciseItemWidget) addExerciseToWorkoutButtonEvent;

  ///used for adding an exercise to the list
  ExerciseItemWidget.ExerciseCardWithAddButton({
    @required this.exerciseName,
    @required this.exerciseType,
    @required this.targetMuscle,
    @required this.addExerciseToWorkoutButtonEvent,
  }) {
    this.exerciseItemWidget = Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Row(
              //exercise details and button
              children: <Widget>[
                //the exercise info
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
                          ExerciseConverterClass
                              .ConvertExerciseTypeEnumToString(
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

                RawMaterialButton(
                  onPressed: () {
                    //instantiate ExerciseItemWidget.ExerciseItemWithRepetitionCount
                    //to be added to a workout
                    ExerciseItemWidget exerciseToBeAddedToWorkout =
                        new ExerciseItemWidget.ExerciseItemWithRepetitionCount(
                      exerciseName: this.exerciseName,
                      exerciseType: this.exerciseType,
                      targetMuscle: this.targetMuscle,
                    );
                    this.addExerciseToWorkoutButtonEvent(
                        exerciseToBeAddedToWorkout);
                  },
                  elevation: 2.0,
                  fillColor: Colors.amber[800],
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                  ),
                  //padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      height: this.exerciseCardHeight,
      //set padding size
    );
  }

  ExerciseItemWidget.ExerciseItemWithRepetitionCount({
    @required this.exerciseName,
    @required this.exerciseType,
    @required this.targetMuscle,
  }) {
    this.exerciseItemWidget = Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //exercise item info and button
                  Row(
                    children: <Widget>[
                      //exercise item info
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
                                ExerciseConverterClass
                                    .ConvertExerciseTypeEnumToString(
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
                      //delete the exercise button with icon too
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            //to do remove object from the list
                          },
                          elevation: 2.0,
                          fillColor: Colors.amber[800],
                          child: Icon(
                            Icons.delete,
                            size: 30.0,
                          ),
                          //padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        height: 40,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ExerciseVolumeWidget(
                    textColor: this.textColor,
                    exerciseType: this.exerciseType,
                    buttonHeight: 40,
                  ),
                ],
              ),
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
      height: this.exerciseCardHeight + 60,
      //set padding size
    );
  }

  @override
  Widget build(BuildContext context) {
    //the item widget
    return this.exerciseItemWidget;
  }
}
