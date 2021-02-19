import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseItemVolumeDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutWidgetInformationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'WorkoutWidgetInformationPage.g.dart';

@JsonSerializable(explicitToJson: true)
class WorkoutWidgetInformationPageDAO {
  String workoutName = "";

  List<ExerciseItemWidgetVolumeDAO> exercisesInWorkout = <ExerciseItemWidgetVolumeDAO>[];

  ///help to determine wheater this workout is firstly created or  modified?
  WorkoutPageType workoutPageType;
  WorkoutWidgetInformationPageDAO({
    @required this.workoutName,
    @required this.exercisesInWorkout,
    @required this.workoutPageType,
  });
  factory WorkoutWidgetInformationPageDAO.fromJson(Map<String, dynamic> json) => _$WorkoutInputPageDAOFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutInputPageDAOToJson(this);
}
