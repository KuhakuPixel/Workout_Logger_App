import 'package:WorkoutLoggerApp/PageBaseClass/page.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/WidgetKey.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ToAddExercisePage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/toAddWorkoutPage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "WorkoutPage",
      pageInputType: PageInputType.newNormalPage,
      inputPage: ToAddWorkoutInputPage(key: WidgetKey.toAddWorkoutInputPageStateKey),
      spaceBetweenItem: 5,
      itemList: <Widget>[
        Text("Hello world"),
      ],
    );
  }
}

///to do:
///Create a class (deriving from widget) to store the state of the newly added workout
///in that class create a property of [ExerciseCardWithVolumeWidget] that will store the data of a newly created workout which will be editable later
///
