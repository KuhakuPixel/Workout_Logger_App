import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutWidgetInformationPageDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutWidgetInformationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part "WorkoutItemWidgetDAO.g.dart";

//constructor should take  List<ExerciseItemWidgetDAO> to be loaded properly
@JsonSerializable(explicitToJson: true)
class WorkoutItemWidgetDAO {
  final String workoutName;

  ///this will be a page that the user can navigatte to to edit the workout(its repetition count its exercises and ect)
  final WorkoutWidgetInformationPageDAO workoutInfoPage;

  WorkoutItemWidgetDAO({
    @required this.workoutName,
    @required this.workoutInfoPage,
  });
  factory WorkoutItemWidgetDAO.fromJson(Map<String, dynamic> json) => _$WorkoutItemWidgetDAOFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutItemWidgetDAOToJson(this);
}
