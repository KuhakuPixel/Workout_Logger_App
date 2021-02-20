import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutPage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutWidgetInformationPage.dart';
import 'package:flutter/material.dart';
///class containing key of the widget that will act as an easy global acsess to a widget
class WidgetKey {
  //value will be modified by passing it to the respective constructor
  static GlobalKey<WorkoutWidgetInformationPageState> toAddWorkoutInputPageStateKey = GlobalKey();
  static GlobalKey<ExercisePageState> exercisePageStateKey=GlobalKey();
  static GlobalKey<WorkoutPageState> workoutPageStateKey=GlobalKey();
}
