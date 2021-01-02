import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

///An widget for containing an exercise item
class ExerciseItemWidget extends StatelessWidget {
  final String exerciseName;
  //constructor
  ExerciseItemWidget({this.exerciseName}) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Text(exerciseName),
        
        //border property
        shape: BeveledRectangleBorder(
          side: BorderSide(
            color: Colors.amber[800],
            width:1,
          ),
        ),
         
        color: ApplicationColorsPallete.ColorsPallete_["BlackGreyish"],
        //elevation:10000000000000,
      ),
      width: double.maxFinite,
      height: 100,
    );
  }
}
