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

  ExercisePageDAO(List<ExerciseItemWidget> exerciseItemWidgets) {
    //create list of type ExerciseItemWidgetDAO
    for (int i = 0; i < exerciseItemWidgets.length; i++) {
      exerciseItemDaoList.add(
        new ExerciseItemWidgetDAO(
          exerciseItemWidgets[i].exerciseName,
          exerciseItemWidgets[i].exerciseType,
          exerciseItemWidgets[i].targetMuscle,
        ),
      );
    }
  }
  factory ExercisePageDAO.fromJson(Map<String, dynamic> json) => _$ExercisePageDAOFromJson(json);
  Map<String, dynamic> toJson() => _$ExercisePageDAOToJson(this);
}
//problem definition:in what readable pattern can we save the map by turning it to string
//turn the signature of tojson to string
//explicitcly convert an object of class type to its json string before storing it inside a map :create a function to save and load the data map (converting to jsonString first)
//create a fucntion to load and save the dao? inside the dao class itself

//have fun
