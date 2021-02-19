import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseSetInstanceDAO.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ExerciseItemVolumeDAO.g.dart';

@JsonSerializable(explicitToJson: true)
///the DAO for the ExerciseItemWidgetVolume
class ExerciseItemWidgetVolumeDAO {
  ///exercise item required property
  String exerciseName;

  ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  String targetMuscle;

  ///the exercises set that are added to a workout by the user
  List<ExerciseSetInstanceDAO> exerciseSetsWidgets = [];
  ExerciseItemWidgetVolumeDAO({
    @required this.exerciseName,
   @required this.exerciseType,
   @required this.targetMuscle,
   @required this.exerciseSetsWidgets,
  });
  factory ExerciseItemWidgetVolumeDAO.fromJson(Map<String, dynamic> json) => _$ExerciseItemWidgetVolumeDAOFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseItemWidgetVolumeDAOToJson(this);
}
