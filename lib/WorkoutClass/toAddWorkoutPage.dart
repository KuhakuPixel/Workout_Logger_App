import 'package:WorkoutLoggerApp/AppManager.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/PageBaseClass/ItemInputPage.dart';

import 'package:WorkoutLoggerApp/WorkoutClass/ToAddExercisePage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutItemWidget.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

enum WorkoutPageType {
  pageToAddNewWorkout,
  workoutPageInfo,
}

//lets edit this class to be able to receive a function that will add a new item
///page for adding new workout
class WorkoutInputPage extends StatefulWidget {
  String workoutName = "";

  List<ExerciseItemWidgetVolume> exercisesInWorkout = <ExerciseItemWidgetVolume>[];
  void Function(WorkoutItemWidget) addWorkoutToListFunction;

  ///help to determine wheater this workout is firstly created or  modified?
  WorkoutPageType workoutPageType;
  //https://stackoverflow.com/questions/21033398/how-do-i-call-on-the-super-class-constructor-and-other-statements-in-dart
  WorkoutInputPage({@required Key key, @required this.addWorkoutToListFunction}) : super(key: key) {
    this.workoutPageType = WorkoutPageType.pageToAddNewWorkout;
  }

  ///only use this to edit the workoutPage(not first time instantiating);
  ///will also instantiate with cloned properties of the argument
  WorkoutInputPage.Modifiable(WorkoutInputPage workoutInputPageToBeCloned) {
    //reassign value
    this.workoutName = workoutInputPageToBeCloned.workoutName;
    //modify property
    this.workoutPageType = WorkoutPageType.workoutPageInfo;

    //clone every exercises in the workout
    for (int i = 0; i < workoutInputPageToBeCloned.exercisesInWorkout.length; i++) {
      this.exercisesInWorkout.add(
            new ExerciseItemWidgetVolume.Clone(workoutInputPageToBeCloned.exercisesInWorkout[i]),
          );
    }
  }

  @override
  WorkoutInputPageState createState() => WorkoutInputPageState();
}

class WorkoutInputPageState extends State<WorkoutInputPage> {
  void AddOneExerciseToWorkout(ExerciseItemWidgetVolume exerciseItemWidgetVolume) {
    //add the item and notify the framework to update the state
    setState(() {
      widget.exercisesInWorkout.add(exerciseItemWidgetVolume);
    });
    //pop off 1 route from the current
    Navigator.pop(context);
  }

  //Size Property//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  double exerciseItemVolumeHeight = 200;
  double exerciseItemVolumeWidth = 350;
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
              onChanged: (stringValue) {
                widget.workoutName = stringValue;
              },
              leftPaddingValue: 6,
              textInputWidth: 200,
              fieldValue: widget.workoutName,
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
                        return new AddExerciseToWorkoutPage();
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
            //the content of the item widget(scrollable)
            child: Scrollbar(
              child: SingleChildScrollView(
                //column of added exercise
                child: Container(
                  child: Column(
                    //map every children to a container(only for resizing purpose)
                    children: widget.exercisesInWorkout.map<Container>((exerciseItemWidgetVolume) {
                      return Container(
                        child: exerciseItemWidgetVolume,
                        width: this.exerciseItemVolumeWidth,
                        height: this.exerciseItemVolumeHeight,
                      );
                    }).toList(),
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
              ),
              controller: new ScrollController(),
              isAlwaysShown: true,
              thickness: 10,
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
          //determine the icon of the right button according to widget.workoutPageType
          rightButtonIcon: widget.workoutPageType == WorkoutPageType.workoutPageInfo ? Icons.check : Icons.add,
          onPressedCloseButton: () {
            //go back to the last page in the route stack
            Navigator.pop(context);
          },
          onPressedConfirmButton: () {
            switch (widget.workoutPageType) {
              //add new workout to the list
              case WorkoutPageType.pageToAddNewWorkout:
                //checking the exercisenameInput
                //return true if the argument element is equal to one of the contained elements
                bool exerciseNameIsValid = !(["", null, false, 0].contains(widget.workoutName));
                if (exerciseNameIsValid) {
                  //make sure to notify the framework to rebuild the widget with a new state
                  setState(() {
                    //the object that should be passed in must be constructed via  WorkoutInputPage.ModifiableProperties
                    WorkoutItemWidget newWorkout = new WorkoutItemWidget(
                      workoutName: widget.workoutName,
                      //clone and assign the state of the current input page
                      //widget refers to "WorkoutInputPage"
                      workoutInfoPage: new WorkoutInputPage.Modifiable(widget),
                    );
                    //add the workout to the list
                    widget.addWorkoutToListFunction(newWorkout);
                  });

                  //go back to the last route
                  Navigator.pop(context);
                  //Show notification message:"will not work if the current route is not the main route"
                  AppManager.ShowSnackBar(context, "Workout Added");
                } else {
                  //go back to the last route
                  Navigator.pop(context);
                  AppManager.ShowSnackBar(context, "Please fill the Workout Name name Bitch-NicholasPixel");
                }
                break;
              case WorkoutPageType.workoutPageInfo:

                //go back to the previous route in the stack
                Navigator.pop(context);
                break;
            }
          },
        )
      ],
    );
  }
}
