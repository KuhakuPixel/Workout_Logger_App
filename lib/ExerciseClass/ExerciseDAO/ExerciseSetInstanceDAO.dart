import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part "ExerciseSetInstanceDAO.g.dart";

@JsonSerializable(explicitToJson: true)
class ExerciseSetInstanceDAO {
  ///is the exercise measured in timed? body weight? or normal weight?
  ExerciseType exerciseType = ExerciseType.bodyweight;

  ///the index of a set of an exercise
  int exerciseSetIndex = 0;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  int numberOfRepetition = 0;
  double weightValue = 0;
  ExerciseSetInstanceDAO({
    @required this.exerciseType,
    @required this.exerciseSetIndex,
    @required this.weightValue,
    @required this.numberOfRepetition,
  });
  factory ExerciseSetInstanceDAO.fromJson(Map<String, dynamic> json) => _$ExerciseSetInstanceDAOFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseSetInstanceDAOToJson(this);
}
