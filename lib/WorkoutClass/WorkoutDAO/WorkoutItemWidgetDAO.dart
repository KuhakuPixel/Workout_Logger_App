import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutInputPageDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/toAddWorkoutPage.dart';

class WorkoutItemWidgetDAO{
  final String workoutName;
  ///this will be a page that the user can navigatte to to edit the workout(its repetition count its exercises and ect)
  final WorkoutInputPageDAO workoutInfoPage;
  //size property
  final double workoutCardHeight = 100;
  //card spacing margin in the container
  final double cardLeftPaddingValue = 10;
  final double cardRightPaddingValue = 0;
  final double cardTopPaddingValue = 10;
  final double cardBottomPaddingValue = 0;
}