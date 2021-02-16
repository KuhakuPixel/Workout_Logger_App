import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseSetInstanceDAO.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseGlobalClass.dart';

class ExerciseItemWidgetVolumeDAO {
  ///exercise item required property
  String exerciseName;

  ExerciseType exerciseType;

  ///Only assign the value that are available inside muscleList
  String targetMuscle;

  ///the exercises set that are added to a workout by the user
  List<ExerciseSetInstanceDAO> exerciseSetsWidgets = [];
}
