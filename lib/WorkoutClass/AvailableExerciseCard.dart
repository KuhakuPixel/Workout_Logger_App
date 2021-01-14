import 'package:flutter/material.dart';

class AvailableExerciseToPickCard extends StatelessWidget {
  final double height;
  final double width;

  AvailableExerciseToPickCard({this.height, this.width}) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(),
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
