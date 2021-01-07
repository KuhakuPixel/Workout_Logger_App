import 'package:WorkoutLoggerApp/CustomWidget/DetailsAndDropDown.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

import '../ContentPages/page.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class DropDownValueWrapper {
  String stringValue = "";
  DropDownValueWrapper(this.stringValue);
}

///implementing ApplicationPage WIdget
class _ExercisePageState extends State<ExercisePage> {
  ///this is the value for all of the widgets in the modal bottom page
  double modalWidgetsLeftPaddingValue = 6;
  DropDownValueWrapper exerciseTypeDropDownValueWrapper =
      new DropDownValueWrapper(
    ExerciseConverterClass.ConvertEnumToString(
        enumValue: ExerciseType.bodyweight),
  );
  DropDownValueWrapper targetMuscleDropDownValueWrapper =
      new DropDownValueWrapper(
    ExerciseConverterClass.ConvertEnumToString(
        enumValue: ExerciseType.bodyweight),
  );

  ///Alternative to passing variable by reference
  void ChangeDropDownValue(
      DropDownValueWrapper dropDownValueWrapperReference, String newValue) {
    setState(() {
      dropDownValueWrapperReference.stringValue = newValue;
    });
  }

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
                dropDownStringValue:
                    exerciseTypeDropDownValueWrapper.stringValue,
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
                    exerciseTypeDropDownValueWrapper.stringValue =
                        dropDownChangedValue;
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: modalWidgetsLeftPaddingValue,
              ),
            );
          },
        ),

        /*
        DropdownButton<String>(
          value: exerciseTypeDropDownValueWrapper.stringValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            ChangeDropDownValue(exerciseTypeDropDownValueWrapper, newValue);
           // print(exerciseTypeDropDownValueWrapper.stringValue);
          },
          items: ExerciseConverterClass.exerciseTypeList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        */
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
                  Navigator.pop(context);
                  print("Submit input");
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
