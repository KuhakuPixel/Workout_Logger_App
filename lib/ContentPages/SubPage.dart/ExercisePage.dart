import 'package:WorkoutLoggerApp/CardItemWidgets/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

import '../page.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  List<ExerciseItemWidget> exerciseList = [
    new ExerciseItemWidget(
      exerciseName: "Barbell curl",
      exerciseType:ExerciseType.weighted,
     targetMuscle: muscleList[3],
    ),
    new ExerciseItemWidget(
      exerciseName: "Push up",
      exerciseType:ExerciseType.bodyweight,
      targetMuscle: muscleList[13],
    
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "Exercise Page",
      spaceBetweenItem: 10,
      itemList: exerciseList,
    );
  }
}
