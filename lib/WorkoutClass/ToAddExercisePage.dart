import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

class AddExerciseToWorkoutPage extends StatefulWidget {
  @override
  _AddExerciseToWorkoutPageState createState() =>
      _AddExerciseToWorkoutPageState();
}

class _AddExerciseToWorkoutPageState extends State<AddExerciseToWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Exercise To Your Workout"),
      ),
      body: Container(
        //wrapped the column with a scrollable widget to fix size overflow bug
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                //seach field
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber[800],
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber[800],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber[800]),
                      ),
                      labelText: 'Search Exercise.....',
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(8), // Added this
                      //enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                  width: 350,
                  padding: EdgeInsets.only(
                    //left: 10,
                    top: 10,
                    left: 10,
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                //hint text
                Container(
                  child: Text(
                    "Tap To Add An Exercise To Your Workout",
                    style: TextStyle(
                      color: Colors.amber[800],
                    ),
                  ),
                padding:EdgeInsets.only(left:5),
                ),
                //boxed container
                Container(
                  child: Card(
                    //the content of the item widget
                    child: Column(
                      //item inside the card (aligned by the help of column widget)
                     
                      children: <Widget>[],

                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),

                    //border property
                    shape: BeveledRectangleBorder(
                      side: BorderSide(
                        color: Colors.amber[800],
                        width: 2,
                      ),
                    ),

                    color:
                        ApplicationColorsPallete.ColorsPallete_["BlackGreyish"],
                  ),
                  width: double.infinity,
                  height: 480,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start),
        ),
        alignment: Alignment.topLeft,
      ),
    );
  }
}
