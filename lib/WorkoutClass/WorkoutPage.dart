import 'package:WorkoutLoggerApp/PageBaseClass/page.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/WidgetKey.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/AddExerciseToWorkoutPage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutItemWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/toAddWorkoutPage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  //the list should be declared here because this actual class is the one used for the tab not the _WorkoutPageState 
  //if the list is declared in _WorkoutPageState it will be always a new instance hence the list item is reseted (executed from the createState virtual functin)
  static List<WorkoutItemWidget> listOfWorkoutWidget = <WorkoutItemWidget>[
    //WorkoutItemWidget(workoutName: "Idk", workoutInfoPage: null),
  ];
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  void AddNewWorkoutToList(WorkoutItemWidget newWorkout) {
    //make sure the state is updated when adding a new item
    setState(() {
      WorkoutPage.listOfWorkoutWidget.add(newWorkout);
    });
  }

  @override
  Widget build(BuildContext context) {

    return ApplicationPage(
      pageTitle: "WorkoutPage",
      pageInputType: PageInputType.newNormalPage,
      inputPage: WorkoutInputPage(
        key: WidgetKey.toAddWorkoutInputPageStateKey,
        addWorkoutToListFunction: AddNewWorkoutToList,
      ),
      spaceBetweenItem: 10,
      itemList: WorkoutPage.listOfWorkoutWidget,
    );
  }
}

///to do:
///Create a class (deriving from widget) to store the state of the newly added workout
///in that class create a property of [ExerciseCardWithVolumeWidget] that will store the data of a newly created workout which will be editable later
///
