import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/PageBaseClass/ItemInputPage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ToAddExercisePage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

///page for adding new workout
class ToAddWorkoutInputPage extends StatefulWidget {
  @override
  _ToAddWorkoutInputPageState createState() => _ToAddWorkoutInputPageState();
}

class _ToAddWorkoutInputPageState extends State<ToAddWorkoutInputPage> {
  ///exercises that will be added to the workout
  ///the object has to be instanted with ExerciseItemWithRepetitionCount() constructor
  List<ExerciseItemWidget> exercisesInWorkout = <ExerciseItemWidget>[];

  @override
  Widget build(BuildContext context) {
    return ItemInputPageWidget(
      inputPageTitle: "Add a workout",
      inputWidgetListImplementation: <Widget>[
        ///widgets for the modal page input
        //Workout name input and Add exercise button
        Row(
          children: [
            //workout name
            AmberTextInput(
              labelText: "Type workout Name here",
              onChanged: (stringValue) {},
              leftPaddingValue: 6,
              textInputWidth: 200,
            ),
            //button to add a new exercise to the workout
            Container(
              child: RaisedButton(
                onPressed: () {
                  //navigate to a new page to select an exercise
                  Navigator.push(
                    context,
                    //the page that will be directed to
                    //need to provide an annonymus function that will return an instance of page(widget)
                    MaterialPageRoute(
                      builder: (context) {
                        //page widget
                        return new AddExerciseToWorkoutPage(
                          onAddExerciseToWorkoutButton:
                              //pass an anonymus function that will add an item and notify the framework and will navigate back to this page once the item is added
                              (exerciseItemWidgetToBeAdded) {
                            setState(() {
                              this
                                  .exercisesInWorkout
                                  .add(exerciseItemWidgetToBeAdded);
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  "Add Exerice",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.amber[800],
                splashColor: Colors.amber[200],
                highlightColor: Colors.amber[200],
              ),
              padding: EdgeInsets.only(
                right: 10,
                top: 14,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        SizedBox(
          height: 10,
        ),
        //boxed container containing the exercises
        Container(
          child: Card(
            //the content of the item widget
            child: SingleChildScrollView(
              child: Column(
                children: this.exercisesInWorkout,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),

            //border property
            shape: BeveledRectangleBorder(
              side: BorderSide(
                color: Colors.amber[800],
                width: 2,
              ),
            ),

            color: ApplicationColorsPallete.ColorsPallete_["BlackGreyish"],

            //elevation:10000000000000,
          ),
          width: double.infinity,
          height: 480,
        ),
        SizedBox(
          height: 10,
        ),
        CloseModalBottomPageAndConfirmButtonWidget(
          onPressedCloseButton: () {
            //go back to the last page in the route stack
            Navigator.pop(context);
          },
          onPressedConfirmButton: () {},
        )
      ],
    );
  }
}
