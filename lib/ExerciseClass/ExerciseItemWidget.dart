import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/WidgetKey.dart';

import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

///Control the colors of the ExerciseItemWidget
class ExerciseItemWidgetProperty {
//decoration
  static Color textColor = Colors.amber[800];
  //ApplicationColorsPallete.ColorsPallete_["Light Grey 2"]
  static Color cardBorderColor = Colors.amber[800];
  static Color cardBackgroundColor = ApplicationColorsPallete.ColorsPallete_["BlackGreyish"];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/// widget for containing an exercise item
class ExerciseItemWidget extends StatelessWidget {
  ////////////////////////////////////////////////////////ExerciseWidgetProperty//////////////////////////////////////////////////////

  ///this list will be assigned to the row in the card
  Widget exerciseItemWidget = Text("Null");

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
                        color: ExerciseItemWidgetProperty.textColor,
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
                        color: ExerciseItemWidgetProperty.textColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    //exercise Type
                    Text(
                      " Exercise Type   : " + ExerciseConverterClass.ConvertExerciseTypeEnumToString(enumValue: this.exerciseType),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.4,
                        wordSpacing: 2,
                        color: ExerciseItemWidgetProperty.textColor,
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
              color: ExerciseItemWidgetProperty.cardBorderColor,
              width: 2.5,
            ),
          ),
          color: ExerciseItemWidgetProperty.cardBackgroundColor
          //elevation:10000000000000,
          ),
      width: double.maxFinite,
      height: this.exerciseCardHeight,
      //set padding size
    );
  }

 

  ///an exercise item which will have a button to add itself to a list
  ExerciseItemWidget.ExerciseCardWithAddButton({
    @required this.exerciseName,
    @required this.exerciseType,
    @required this.targetMuscle,
    
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
                        color: ExerciseItemWidgetProperty.textColor,
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
                        color: ExerciseItemWidgetProperty.textColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    //exercise Type
                    Text(
                      " Exercise Type   : " + ExerciseConverterClass.ConvertExerciseTypeEnumToString(enumValue: this.exerciseType),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.4,
                        wordSpacing: 2,
                        color: ExerciseItemWidgetProperty.textColor,
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),

                RawMaterialButton(
                  onPressed: () {
                    //instantiate ExerciseItemWidget.ExerciseItemWithRepetitionCount
                    //add the item to the list of exercises
                    ExerciseItemWidgetVolume exerciseVolumeCard = new ExerciseItemWidgetVolume(
                      exerciseName: this.exerciseName,
                      exerciseType: this.exerciseType,
                      targetMuscle: this.targetMuscle,
                    );
                    //this.addExerciseToWorkoutButtonEvent(exerciseVolumeCard);
                    //add an exercise to the page 
                    WidgetKey.toAddWorkoutInputPageStateKey.currentState.AddOneExerciseToWorkout(exerciseVolumeCard);
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
              color: ExerciseItemWidgetProperty.cardBorderColor,
              width: 2.5,
            ),
          ),
          color: ExerciseItemWidgetProperty.cardBackgroundColor
          //elevation:10000000000000,
          ),
      width: double.maxFinite,
      height: this.exerciseCardHeight,
      //set padding size
    );
  }

  @override
  Widget build(BuildContext context) {
    //the item widget
    return this.exerciseItemWidget;
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///this class is used as a widget to determine a volume or a set
class ExerciseItemWidgetVolume extends StatefulWidget {
  ///exercise item required property
  String exerciseName;

  ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  String targetMuscle;

  @override
  _ExerciseItemWidgetVolumeState createState() => _ExerciseItemWidgetVolumeState();
  ExerciseItemWidgetVolume({
    @required this.exerciseName,
    @required this.exerciseType,
    @required this.targetMuscle,
  }) {}
}

class _ExerciseItemWidgetVolumeState extends State<ExerciseItemWidgetVolume> {
  /////////////size and other padding properties
  ///card positional properties
  double exerciseCardHeight = 100;
  //card spacing margin in the container
  double cardLeftPaddingValue = 10;
  double cardRightPaddingValue = 0;
  double cardTopPaddingValue = 10;
  double cardBottomPaddingValue = 0;

  double buttonsHeight;

  //,,,,,,,,,,,,,,,,,,,,,,,,,,,,

  /// i
  List<ExerciseSetInstanceWidget> exerciseSetsWidgets = <ExerciseSetInstanceWidget>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //exercise item info and delete button
                    Row(
                      children: <Widget>[
                        //exercise item info
                        Column(
                          children: <Widget>[
                            //exercise name title
                            Text(
                              widget.exerciseName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                letterSpacing: 0.4,
                                wordSpacing: 2,
                                color: ExerciseItemWidgetProperty.textColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            //target muscle
                            Text(
                              " Target Muscles : " + widget.targetMuscle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                letterSpacing: 0.4,
                                wordSpacing: 2,
                                color: ExerciseItemWidgetProperty.textColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            //exercise Type
                            Text(
                              " Exercise Type   : " + ExerciseConverterClass.ConvertExerciseTypeEnumToString(enumValue: widget.exerciseType),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                letterSpacing: 0.4,
                                wordSpacing: 2,
                                color: ExerciseItemWidgetProperty.textColor,
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
                    //rep text and stuff

                    Container(
                      child: Text(
                        "Set",
                        style: TextStyle(
                          color: ExerciseItemWidgetProperty.textColor,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),

                    //spread the list//although there is another way to this (creating a function that will spread the item)
                    ...this.exerciseSetsWidgets,

                    //container for 2 button (to add set or remove set)
                    Container(
                      child: Row(
                        children: [
                          //add new exercise set button
                          Container(
                            child: RaisedButton(
                              onPressed: () {
                                //add new set and increase the size of the exercisecard with volume
                                //and update the ui to a new state
                                setState(() {
                                  this.exerciseSetsWidgets.add(
                                        new ExerciseSetInstanceWidget(
                                          exerciseType: widget.exerciseType,
                                          indexOfSet: this.exerciseSetsWidgets.length,
                                        ),
                                      );
                                });
                              },
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
                            height: this.buttonsHeight,
                          ),
                          //remove new exercise set button
                          Container(
                            child: RaisedButton(
                              onPressed: () {
                                //remove a set of exercise from the list
                                //notify the framework to update the state
                                setState(() {
                                  //remove the last element(the last index)
                                  if (this.exerciseSetsWidgets.length != 0) {
                                    this.exerciseSetsWidgets.removeAt(this.exerciseSetsWidgets.length - 1);
                                  } else {
                                    debugPrintStack(
                                      label: "exerciseSetsWidgets length is 0 cannot remove anymore item",
                                      maxFrames: 2,
                                    );
                                  }
                                });
                              },
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
                            height: this.buttonsHeight,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ],
                ),
              ),
              controller: new ScrollController(),
              isAlwaysShown: true,
            ),
            padding: EdgeInsets.only(
              left: cardLeftPaddingValue,
              right: cardRightPaddingValue,
              top: cardTopPaddingValue,
              bottom: cardBottomPaddingValue,
            ),
          ),

          //border property
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: ExerciseItemWidgetProperty.cardBorderColor,
              width: 2.5,
            ),
          ),
          color: ExerciseItemWidgetProperty.cardBackgroundColor
          //elevation:10000000000000,
          ),
      width: double.maxFinite,
      height: exerciseCardHeight + 60,
      //set padding size
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class ExerciseSetInstanceWidget extends StatelessWidget {
  ExerciseType exerciseType;

  int indexOfSet = 0;

  ///indexxOfSet:set of [indexOfSet] in a exercise
  ExerciseSetInstanceWidget({
    @required ExerciseType exerciseType,
    @required int indexOfSet,
  }) {
    //initialize instance value

    this.exerciseType = exerciseType;
    this.indexOfSet = indexOfSet;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //add more instances
        Row(
          children: <Widget>[
            Text(this.indexOfSet.toString()),
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

        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
