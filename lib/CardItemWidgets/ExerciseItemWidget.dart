import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

/// widget for containing an exercise item
class ExerciseItemWidget extends StatelessWidget {
  final String exerciseName;

  //card spacing margin in the container
  final double cardLeftPaddingValue = 10;
  final double cardRightPaddingValue = 0;
  final double cardTopPaddingValue = 10;
  final double cardBottomPaddingValue = 0;
  //constructor
  ExerciseItemWidget({
    this.exerciseName,
    /*
    this.cardBottomPaddingValue=0,
    this.cardLeftPaddingValue=0,
    this.cardRightPaddingValue=0,
    this.cardTopPaddingValue=0,*/
  }) {}
  @override
  Widget build(BuildContext context) {
    //the item widget
    return Container(
      child: Card(
        //the content of the item widget
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                exerciseName.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  letterSpacing: 0.4,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "-Target Muscles : " + "Tricep",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  letterSpacing: 0.4,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "-Exercise Type  : " + "Bodyweight",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  letterSpacing: 0.4,
                  wordSpacing: 2,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          padding: EdgeInsets.only(
            left: this.cardLeftPaddingValue,
            right: this.cardRightPaddingValue,
            top: this.cardTopPaddingValue,
            bottom: this.cardBottomPaddingValue,
          ),
        ),

        //border property
        shape: BeveledRectangleBorder(
          side: BorderSide(
            color: ApplicationColorsPallete.ColorsPallete_["Light Grey 2"],
            width: 3,
          ),
        ),

        color: ApplicationColorsPallete.ColorsPallete_["BlackGreyish"],
        //elevation:10000000000000,
      ),
      width: double.maxFinite,
      height: 100,
      //set padding size
    );
  }
}
