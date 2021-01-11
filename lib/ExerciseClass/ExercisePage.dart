import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/DetailsAndDropDown.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

import '../AppManager.dart';
import '../ContentPages/page.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

///implementing ApplicationPage WIdget
class _ExercisePageState extends State<ExercisePage> {
  ///this is the value for all of the widgets in the modal bottom page
  double modalWidgetsLeftPaddingValue = 6;

  String newExerciseName;
  String newExerciseType =
      ExerciseConverterClass.ConvertExerciseTypeEnumToString(
          enumValue: ExerciseType.bodyweight);
  String newTargetMuscle = muscleList[0];

  List<ExerciseItemWidget> exerciseList = [
    /*
    new ExerciseItemWidget(
      exerciseName: "Barbell curl",
      exerciseType: ExerciseType.weighted,
      targetMuscle: muscleList[3],
    ),
    new ExerciseItemWidget(
      exerciseName: "Push up",
      exerciseType: ExerciseType.bodyweight,
      targetMuscle: muscleList[13],
    ),
    */
  ];

  void AddExerciseToList(
      String exerciseName, ExerciseType exerciseType, String targetMuscle) {
    ExerciseItemWidget newExerciseItem = new ExerciseItemWidget(
      exerciseName: exerciseName,
      exerciseType: exerciseType,
      targetMuscle: targetMuscle,
    );
    //rebuild all the widget after this code is run
    setState(() {
      exerciseList.add(newExerciseItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    //exercise page will use most of the feature from application page
    return ApplicationPage(
      pageTitle: "Exercise Page",
      spaceBetweenItem: 10,
      itemList: AppManager.DisplayItemsAccordingToState(
          exerciseList, "Tap the bottom to add new Exercise"),
      bottomModalPageInputWidgets: <Widget>[
        ///widget for the modal page input
        //Exercise name input
        ///widget for the modal page input
        //Exercise name input
        AmberTextInput(
          labelText: "Type Exercise Name Here....",
          onChanged: (stringValue) {
            //track the value of the dropdown
            this.newExerciseName = stringValue;
          },
          leftPaddingValue:  modalWidgetsLeftPaddingValue,
          textInputWidth: 250,
        ),
       
        SizedBox(
          height: 10,
        ),
        //dropwdown with details (exercise type)
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            //builded widget dropwdown with details (exercise type)
            return Container(
              child: DropDownWithDetails(
                dropDownStringValue: newExerciseType,
                detailStringValue: "Exercise Type",
                spaceBetween: 150,
                //map the exerciseTypeList into DropdownMenuItem<String> type
                dropDownItemList: ExerciseConverterClass.exerciseTypeList
                    .map<DropdownMenuItem<String>>((String value) {
                  //specify the widget that is returned
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

                onDropDownValueChanged: (String dropDownChangedValue) {
                  //print("Value " + dropDownChangedValue);
                  setState(() {
                    newExerciseType = dropDownChangedValue;
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: modalWidgetsLeftPaddingValue,
              ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        //dropdown with details for chosing the target muscle
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: DropDownWithDetails(
                dropDownStringValue: newTargetMuscle,
                detailStringValue: "Target Muscle",
                spaceBetween: 150,
                //map the exerciseTypeList into DropdownMenuItem<String> type
                dropDownItemList:
                    muscleList.map<DropdownMenuItem<String>>((String value) {
                  //specify the widget that is returned
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

                onDropDownValueChanged: (String dropDownChangedValue) {
                  //print("Value " + dropDownChangedValue);
                  setState(() {
                    newTargetMuscle = dropDownChangedValue;
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: modalWidgetsLeftPaddingValue,
              ),
            );
          },
        ),

        SizedBox(
          height: 10,
        ),
        //close and confirm button

        CloseModalBottomPageAndConfirmButtonWidget(
          onPressedCloseButton: () {
            Navigator.pop(context);
          },
          onPressedConfirmButton: () {
            //checking the exercisenameInput
            //return true if the argument element is equal to one of the contained elements
            bool exerciseNameIsValid =
                !(["", null, false, 0].contains(this.newExerciseName));
            if (exerciseNameIsValid) {
              //make sure to notify the framework to rebuild the widget with a new state
              setState(() {
                AddExerciseToList(
                  this.newExerciseName,
                  ExerciseConverterClass.ConvertStringToExerciseType(
                      this.newExerciseType),
                  this.newTargetMuscle,
                );
              });
              AppManager.ShowSnackBar(context, "Exercise Added");
              //reset name
              this.newExerciseName = null;
              //go back to the last route
              Navigator.pop(context);
            } else {
              AppManager.ShowSnackBar(
                  context, "Please fill the exercise name Bitch-NicholasPixel");
              //go back to the last route
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
