import 'dart:convert';

import 'package:WorkoutLoggerApp/ApplicationManager.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseDAO/ExerciseItemVolumeDAO.dart';
import 'package:WorkoutLoggerApp/PageBaseClass/page.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/WidgetKey.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/AddExerciseToWorkoutPage.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutWidgetInformationPageDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutItemWidgetDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutPageDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutItemWidget.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutWidgetInformationPage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  WorkoutPage({Key key}) : super(key: key);

  final String workoutPagePreferencekey = "workoutPagePreferencekey";
  //the list should be declared here because this actual class is the one used for the tab not the _WorkoutPageState
  //if the list is declared in _WorkoutPageState it will be always a new instance hence the list item is reseted (executed from the createState virtual functin)
  static List<WorkoutItemWidget> listOfWorkoutWidget = <WorkoutItemWidget>[
    //WorkoutItemWidget(workoutName: "Idk", workoutInfoPage: null),
  ];
  @override
  WorkoutPageState createState() => WorkoutPageState();

  Future<void> saveWorkoutPageState() async {
    //init the DAO of this class to be saved
    WorkoutPageDAO workoutPageDAO = new WorkoutPageDAO(
      //map every WorkoutItemWidget to WorkoutItemWidgetDAO
      listOfWorkoutWidget: WorkoutPage.listOfWorkoutWidget.map<WorkoutItemWidgetDAO>(
        //return the Dao of each workoutItemWidget
        (workoutItemWidget) {
          return workoutItemWidget.toDAO();
        },
      ).toList(),
    );
    //save the json[map<string,dynamic>]
    await Prefences.saveJSON(this.workoutPagePreferencekey, workoutPageDAO.toJson());
  }

  ///return the DAO to be used to init the state
  Future<WorkoutPageDAO> loadWorkoutPageDAO() async {
    //get the json to init the DAO
    Map<String, dynamic> json = await Prefences.getJSON(this.workoutPagePreferencekey);

    return new WorkoutPageDAO.fromJson(json);
  }
}

class WorkoutPageState extends State<WorkoutPage> {
  void initState() {
    loadAndSetState();
    super.initState();
  }

  ///load previous data and update the widget
  Future<void> loadAndSetState() async {
    //try to load state if the user has saved previously
    try {
      //load in the DAO
      WorkoutPageDAO workoutPageDAO = await widget.loadWorkoutPageDAO();
      //load in the workout list
      //map every workoutItemWidgetDAO to workoutItemWidget
      setState(
        () {
          WorkoutPage.listOfWorkoutWidget = workoutPageDAO.listOfWorkoutWidget.map<WorkoutItemWidget>(
            (workoutItemWidgetDAO) {
              return WorkoutItemWidget.fromDAO(workoutItemWidgetDAO);
            },
          ).toList();
        },
      );
    } catch (e) {
      debugPrintStack(label: "no data has been saved", maxFrames: 2);
    }
  }

  void addNewWorkoutToList(WorkoutItemWidget newWorkout) {
    //make sure the state is updated when adding a new item
    setState(() {
      WorkoutPage.listOfWorkoutWidget.add(newWorkout);
    });
    //save the added value
    widget.saveWorkoutPageState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "WorkoutPage",
      pageInputType: PageInputType.newNormalPage,
      inputPage: WorkoutWidgetInformationPage(
        key: WidgetKey.toAddWorkoutInputPageStateKey,
        addWorkoutToListFunction: addNewWorkoutToList,
      ),
      spaceBetweenItem: 10,
      itemList: WorkoutPage.listOfWorkoutWidget,
    );
  }
}

//todo:write fromDAO constructor to hide some abstraction for fuck sake
