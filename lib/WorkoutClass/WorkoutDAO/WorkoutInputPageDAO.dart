import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseItemVolumeDAO.dart';
import "package:WorkoutLoggerApp/WorkoutClass/toAddWorkoutPage.dart";
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part "ExercisePageDAO.g.dart";

@JsonSerializable(explicitToJson: true)
class WorkoutInputPageDAO {
  String workoutName = "";

  List<ExerciseItemWidgetVolumeDAO> exercisesInWorkout = <ExerciseItemWidgetVolumeDAO>[];

  ///help to determine wheater this workout is firstly created or  modified?
  WorkoutPageType workoutPageType;
  WorkoutInputPageDAO({
    @required this.workoutName,
    @required this.exercisesInWorkout,
    @required this.workoutPageType,
  });
  factory WorkoutInputPageDAO.fromJson(Map<String, dynamic> json) => _$WorkoutInputPageDAOFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutInputPageDAOToJson(this);
}
