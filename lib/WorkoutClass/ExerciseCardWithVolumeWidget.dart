import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

class ExerciseCardWithVolumeWidget extends StatelessWidget {
  final ExerciseItemWidget exerciseItem;

  const ExerciseCardWithVolumeWidget({this.exerciseItem});
  @override
  Widget build(BuildContext context) {
    //to do:implement some flexibility that it can expand it self according to how many exercises are added 

    return this.exerciseItem;
  }
}
