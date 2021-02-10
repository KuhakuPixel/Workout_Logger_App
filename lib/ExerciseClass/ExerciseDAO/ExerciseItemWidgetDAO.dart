import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';
import 'package:json_annotation/json_annotation.dart';
part "ExerciseItemWidgetDAO.g.dart";

@JsonSerializable(explicitToJson: true)
class ExerciseItemWidgetDAO {
  ///exercise item required property
  String exerciseName;

  ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  String targetMuscle;
  ExerciseItemWidgetDAO(this.exerciseName, this.exerciseType, this.targetMuscle);
  factory ExerciseItemWidgetDAO.fromJson(Map<String, dynamic> json) => _$ExerciseItemWidgetDAOFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseItemWidgetDAOToJson(this);
}
