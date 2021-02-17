import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutItemWidgetDAO.dart';
import 'package:json_annotation/json_annotation.dart';
part "WorkoutPageDAO.g.dart";

//constructor should take  List<ExerciseItemWidgetDAO> to be loaded properly
@JsonSerializable(explicitToJson: true)
class WorkoutPageDAO {
  List<WorkoutItemWidgetDAO> listOfWorkoutWidget = <WorkoutItemWidgetDAO>[
 
  ];
  WorkoutPageDAO({this.listOfWorkoutWidget});
  factory WorkoutPageDAO.fromJson(Map<String, dynamic> json) => _$WorkoutPageDAOFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutPageDAOToJson(this);
}
