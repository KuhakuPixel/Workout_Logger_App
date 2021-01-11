import 'package:WorkoutLoggerApp/CustomWidget/DetailsAndDropDown.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

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

  void ShowSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.amber[800]),
      ),
      backgroundColor: Colors.grey[900],
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    //exercise page will use most of the feature from application page
    return ApplicationPage(
      pageTitle: "Exercise Page",
      spaceBetweenItem: 10,
      itemList: exerciseList,
      modalPageWidgets: <Widget>[
        ///widget for the modal page input
        //Exercise name input
        Container(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Type Exercise Name Here....",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber[800]),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber[800]),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber[800]),
              ),
            ),
            autocorrect: false,
            onChanged: (stringValue) {
              this.newExerciseName = stringValue;
            },
          ),
          width: 250,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: modalWidgetsLeftPaddingValue,
          ),
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
        Container(
          child: Row(
            children: <Widget>[
              //close button
              RawMaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 2.0,
                fillColor: Colors.amber[800],
                child: Icon(
                  Icons.close,
                  size: 30.0,
                ),
                //padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              //confirm button button
              RawMaterialButton(
                onPressed: () {
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
                    ShowSnackBar(context, "Exercise Added now work your ass off to get that six pack");
                    //reset name
                    this.newExerciseName = null;
                    //go back to the last route
                    Navigator.pop(context);
                  }
                  else{
                    ShowSnackBar(context,"Please fill the exercise name Bitch-NicholasPixel");
                     //go back to the last route
                    Navigator.pop(context);
                  }
                },
                elevation: 2.0,
                fillColor: Colors.amber[800],
                child: Icon(
                  Icons.add,
                  size: 30.0,
                ),
                // padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}
