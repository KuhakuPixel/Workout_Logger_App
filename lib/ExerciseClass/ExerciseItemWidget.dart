import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseItemVolumeDAO.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseSetInstanceDAO.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';
import 'package:WorkoutLoggerApp/WidgetKey.dart';

import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import "package:WorkoutLoggerApp/WorkoutClass/WorkoutWidgetInformationPage.dart";

///Control the colors of the ExerciseItemWidget
class ExerciseItemWidgetProperty {
//decoration
  static Color textColor = Colors.amber[800];
  //ApplicationColorsPallete.ColorsPallete_["Light Grey 2"]
  static Color cardBorderColor = Colors.amber[800];
  static Color cardBackgroundColor =
      ApplicationColorsPallete.ColorsPallete_["BlackGreyish"];
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
            child: Row(children: [
              //exercise widget properties like name its type and ect
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
                    " Exercise Type   : " +
                        ExerciseConverterClass.ConvertExerciseTypeEnumToString(
                            enumValue: this.exerciseType),
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
              //delete button
              Container(
                child: RawMaterialButton(
                  onPressed: () {
                    //remove this object from the list
                    WidgetKey.exercisePageStateKey.currentState
                        .removeExerciseFromList(this);
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
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
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

  ///an exercise item which will have a button to add itself to a list ; workoutPage:the workout page that this exercise will belong to
  ExerciseItemWidget.ExerciseCardWithAddButton({
    @required this.exerciseName,
    @required this.exerciseType,
    @required this.targetMuscle,

    ///the workout page that this exercise will belong to
    @required WorkoutWidgetInformationPage workoutInformationPage,
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
                      " Exercise Type   : " +
                          ExerciseConverterClass
                              .ConvertExerciseTypeEnumToString(
                                  enumValue: this.exerciseType),
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
                    ExerciseItemWidgetVolume exerciseVolumeCard =
                        new ExerciseItemWidgetVolume(
                      exerciseName: this.exerciseName,
                      exerciseType: this.exerciseType,
                      targetMuscle: this.targetMuscle,
                      workoutInformationPage: workoutInformationPage,
                    );
                    //this.addExerciseToWorkoutButtonEvent(exerciseVolumeCard);
                    //add an exercise to the page
                    WidgetKey.toAddWorkoutInputPageStateKey.currentState
                        .addOneExerciseToWorkout(exerciseVolumeCard);
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

///this class is used as a widget to determine a volume or a set(contains the exercises )
class ExerciseItemWidgetVolume extends StatefulWidget {
  ///exercise item required property
  String exerciseName;

  ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  String targetMuscle;

  ///the set that are added to the exerciseby the user
  List<ExerciseSetInstance> exerciseSetsWidgets = <ExerciseSetInstance>[];

  ///parent reference(which workout does this exercise belong to)
  WorkoutWidgetInformationPage workoutInformationPage;

  @override
  _ExerciseItemWidgetVolumeState createState() =>
      _ExerciseItemWidgetVolumeState();
  ExerciseItemWidgetVolume({
    @required this.exerciseName,
    @required this.exerciseType,
    @required this.targetMuscle,
    @required this.workoutInformationPage,
  }) {}

  ExerciseItemWidgetVolume.Clone(ExerciseItemWidgetVolume objectToBeCloned) {
    this.exerciseName = objectToBeCloned.exerciseName;
    this.exerciseType = objectToBeCloned.exerciseType;
    this.targetMuscle = objectToBeCloned.targetMuscle;
    this.workoutInformationPage = objectToBeCloned.workoutInformationPage;
    //cloning list
    for (int i = 0; i < objectToBeCloned.exerciseSetsWidgets.length; i++) {
      //to do:add a switch case to handle multiple case(exerciseType)
      //clone and add to list
      this.exerciseSetsWidgets.add(
            new ExerciseSetInstance(
              exerciseSetIndex:
                  objectToBeCloned.exerciseSetsWidgets[i].exerciseSetIndex,
              exerciseType:
                  objectToBeCloned.exerciseSetsWidgets[i].exerciseType,
              numberOfRepetition:
                  objectToBeCloned.exerciseSetsWidgets[i].numberOfRepetition,
              weightValue: objectToBeCloned.exerciseSetsWidgets[i].weightValue,
            ),
          );
    }
  }

  ///instantiate ExerciseItemWidgetVolume from DAO ; workoutWidgetInformationPage is a reference to the workout that this ExerciseItemWidgetVolume belongs to
  ExerciseItemWidgetVolume.fromDAO(ExerciseItemWidgetVolumeDAO dao,
      WorkoutWidgetInformationPage workoutWidgetInformationPage) {
    this.exerciseName = dao.exerciseName;
    this.exerciseType = dao.exerciseType;
    this.targetMuscle = dao.targetMuscle;
    //map dao to load the data
    this.exerciseSetsWidgets = dao.exerciseSetsWidgets.map<ExerciseSetInstance>(
      (exerciseSetInstanceDAO) {
        return ExerciseSetInstance.fromDAO(exerciseSetInstanceDAO);
      },
    ).toList();
    this.workoutInformationPage = workoutWidgetInformationPage;
  }

  ///convert to DAO(used for saving locally)
  ExerciseItemWidgetVolumeDAO toDAO() {
    return new ExerciseItemWidgetVolumeDAO(
      exerciseName: this.exerciseName,
      exerciseType: this.exerciseType,
      targetMuscle: this.targetMuscle,
      //map to dao
      exerciseSetsWidgets: this.exerciseSetsWidgets.map<ExerciseSetInstanceDAO>(
        (exerciseSetInstance) {
          return exerciseSetInstance.toDAO();
        },
      ).toList(),
    );
  }
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
                              " Exercise Type   : " +
                                  ExerciseConverterClass
                                      .ConvertExerciseTypeEnumToString(
                                          enumValue: widget.exerciseType),
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
                              //remove exercise from the workout
                              widget.workoutInformationPage
                                  .createState()
                                  .removeExercisesFromWorkout(widget);
                                  
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
                    ...widget.exerciseSetsWidgets,

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
                                  widget.exerciseSetsWidgets.add(
                                    new ExerciseSetInstance(
                                      exerciseType: widget.exerciseType,
                                      exerciseSetIndex:
                                          widget.exerciseSetsWidgets.length,
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
                                  if (widget.exerciseSetsWidgets.length > 0) {
                                    widget.exerciseSetsWidgets.removeAt(
                                        widget.exerciseSetsWidgets.length - 1);
                                  } else {
                                    debugPrintStack(
                                      label:
                                          "exerciseSetsWidgets length is 0 cannot remove anymore item",
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
///A custom widget which will automatically save the inputted/initial value(will assign the field value to the property of the object)
class ExerciseSetInstance extends StatelessWidget {
  ///is the exercise measured in timed? body weight? or normal weight?
  final ExerciseType exerciseType;

  ///the index of a set of an exercise
  final int exerciseSetIndex;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  int numberOfRepetition;
  double weightValue;

  ///indexxOfSet : set of [exerciseSetIndex] in a exercise;
  ///fill the respective field in accordance to the exercise type
  ExerciseSetInstance({
    @required this.exerciseType,
    @required this.exerciseSetIndex = 0,
    this.weightValue = 0,
    this.numberOfRepetition = 0,
  }) {}

  ///instantiate ExerciseItemWidgetVolume from DAO
  ExerciseSetInstance.fromDAO(ExerciseSetInstanceDAO dao)
      : exerciseSetIndex = dao.exerciseSetIndex,
        exerciseType = dao.exerciseType {
    this.weightValue = dao.weightValue;
    this.numberOfRepetition = dao.numberOfRepetition;
  }

  ///convert to DAO(used for saving locally)
  ExerciseSetInstanceDAO toDAO() {
    return new ExerciseSetInstanceDAO(
      exerciseType: this.exerciseType,
      exerciseSetIndex: this.exerciseSetIndex,
      weightValue: this.weightValue,
      numberOfRepetition: this.numberOfRepetition,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (this.exerciseType) {
      case ExerciseType.weighted:
        return Column(
          children: [
            //add more instances
            Row(
              children: <Widget>[
                Text(this.exerciseSetIndex.toString()),
                AmberTextInput(
                  labelText: "Reps",
                  onChanged: (inputValue) {
                    //assign the inputted value to the object's property
                    this.numberOfRepetition = int.parse(inputValue);
                  },
                  leftPaddingValue: 0,
                  textInputWidth: 50,
                  fieldValue: this.numberOfRepetition.toString(),
                ),
                AmberTextInput(
                  labelText: "Weight",
                  onChanged: (inputValue) {
                    //assign the inputted value to the object's property
                    this.weightValue = double.parse(inputValue);
                  },
                  leftPaddingValue: 0,
                  textInputWidth: 50,
                  fieldValue: this.weightValue.toString(),
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
        break;
      case ExerciseType.bodyweight:
        return Column(
          children: [
            //add more instances
            Row(
              children: <Widget>[
                Text(this.exerciseSetIndex.toString()),
                AmberTextInput(
                  labelText: "Reps(Kg/lbs)",
                  onChanged: (inputValue) {
                    //assign the inputted value to the object's property
                    this.numberOfRepetition = int.parse(inputValue);
                  },
                  leftPaddingValue: 0,
                  textInputWidth: 50,
                  fieldValue: this.numberOfRepetition.toString(),
                ),
                AmberTextInput(
                  labelText: "Body Weight(Kg/lbs)",
                  onChanged: (inputValue) {
                    //assign the inputted value to the object's property
                    this.weightValue = double.parse(inputValue);
                  },
                  leftPaddingValue: 0,
                  textInputWidth: 50,
                  fieldValue: this.weightValue.toString(),
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
        // TODO: Handle this case.
        break;
      case ExerciseType.timed:
        return Column(
          children: [
            //add more instances
            Row(
              children: <Widget>[
                Text(this.exerciseSetIndex.toString()),
                AmberTextInput(
                  labelText: "time (s)",
                  onChanged: (inputValue) {
                    //assign the inputted value to the object's property
                    this.weightValue = double.parse(inputValue);
                  },
                  leftPaddingValue: 0,
                  textInputWidth: 50,
                  fieldValue: this.weightValue.toString(),
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
        break;
    }
  }
}
