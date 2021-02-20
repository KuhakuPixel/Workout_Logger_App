import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseItemWidgetDAO.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';
import 'package:json_annotation/json_annotation.dart';
part "ExercisePageDAO.g.dart";

//constructor should take  List<ExerciseItemWidgetDAO> to be loaded properly
@JsonSerializable(explicitToJson: true)
class ExercisePageDAO {
  ///User added exercise will be stored here
  List<ExerciseItemWidgetDAO> exerciseItemDaoList = [];

  //this should receive the exerciseItemWidgetDao list
  //we can archieve this by passing the list that is mapped into DAO
  ExercisePageDAO(this.exerciseItemDaoList) {}
  factory ExercisePageDAO.fromJson(Map<String, dynamic> json) => _$ExercisePageDAOFromJson(json);
  Map<String, dynamic> toJson() => _$ExercisePageDAOToJson(this);
}

