import 'package:WorkoutLoggerApp/PageBaseClass/page.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ToAddExercisePage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  List<ExerciseItemWidget> exercisesToBeAdded = <ExerciseItemWidget>[];

  void AddExerciseToPreview(ExerciseItemWidget exerciseItem) {
    setState(() {
      exercisesToBeAdded.add(exerciseItem);
    });

  }
  
  ///this is the value for all of the widgets in the modal bottom page
  double modalWidgetsLeftPaddingValue = 6;
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "WorkoutPage",
      pageInputType:PageInputType.newNormalPage,
      spaceBetweenItem: 5,
      itemList: <Widget>[
        Text("Hello world"),
      ],

      /////////////////////  bottomModalPageInputWidgets
      pageInputToAddNewItemWidgets: <Widget>[
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
                          //pass in an annonymus function that executes the  reference to the instance's property 
                          onAddExerciseToPreviewFunction: (exerciseItemWidget) {
                            AddExerciseToPreview(exerciseItemWidget);
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
        //boxed container (used for exercises preview in the future workout)
        Container(
          child: Card(
            //the content of the item widget
            child: Column(
              children: this.exercisesToBeAdded,
              crossAxisAlignment: CrossAxisAlignment.center,
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
