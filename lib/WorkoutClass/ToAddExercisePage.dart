import 'package:WorkoutLoggerApp/PageBaseClass/ItemInputPage.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';
import 'package:WorkoutLoggerApp/StateManager.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/AvailableExerciseCardAndButton.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ExerciseCardWithVolumeWidget.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/WidgetConverter.dart';
import 'package:flutter/material.dart';

///Page to add a new exercise to the workout(with search feature)
class AddExerciseToWorkoutPage extends StatefulWidget {
  ///this function will be called when the user press the add button of any exercises shown
  final void Function(ExerciseCardWithVolumeWidget)
      onAddExerciseToWorkoutButton;

  AddExerciseToWorkoutPage({@required this.onAddExerciseToWorkoutButton});
  @override
  _AddExerciseToWorkoutPageState createState() =>
      _AddExerciseToWorkoutPageState();
}

//state
class _AddExerciseToWorkoutPageState extends State<AddExerciseToWorkoutPage> {
  String searchedExerciseName = "";
  double spacingBetweenAvailableExerciseToAdd = 8;

  //to do:Create a function to takes in the list of widget and remap it into another custom widget
  @override
  Widget build(BuildContext context) {
    //return the list that is going to be used by the argument
    //from a function that map the ExerciseList to another custom widget that is built for this page
    return ItemInputPageWidget(
      inputPageTitle: "Add Exercise To your workout",
      //page list implementation
      inputWidgetListImplementation: <Widget>[
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
            //called when the input are changed with an argument of the typed value
            onChanged: (value) {
              setState(() {
                //update the variable that is going to be used to filter the search
                this.searchedExerciseName = value;
              });
            },
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
          padding: EdgeInsets.only(left: 5),
        ),
        //boxed container containing all of the created exercise
        Container(
          child: Card(
            //the content of the available exercise (wrapped onto column to make it scrollable)
            child: SingleChildScrollView(
              child: Column(
                //display the children according to the search
                children: WidgetConverterLibrary.BuildWidgetsWithSpace(
                  //spacing
                  spaceBetweenItem: this.spacingBetweenAvailableExerciseToAdd,
                  //the item that will be "Spaced"
                  itemList: StateManager.SearchExercises(
                    itemCollections: ExercisePage.exerciseList,
                    searchResult: this.searchedExerciseName,
                  ).map<AvailableExerciseAndButton>(
                    (_exerciseItemWidget) {
                      //this map function will map every item in the iterable to another widget

                      //reinstantiate the exercise item widget so it will be useable for adding it to the preview
                      ExerciseItemWidget exerciseItemWidgetAddable =
                          new ExerciseItemWidget(
                        exerciseName: _exerciseItemWidget.exerciseName,
                        exerciseType: _exerciseItemWidget.exerciseType,
                        targetMuscle: _exerciseItemWidget.targetMuscle,
                        listOfButton: <RawMaterialButton>[],
                      );
                      //remaped widget
                      return AvailableExerciseAndButton(
                        exerciseItemWidget: exerciseItemWidgetAddable,
                        exerciseItemheight: 100,
                        exerciseItemwidth: 300,
                        exerciseCardLeftPaddingValue: 12,
                        //pass the function again that are received by the constructor
                        addExerciseToWorkoutButtonEvent: (exerciseItemWidget_) {
                          widget.onAddExerciseToWorkoutButton(
                              exerciseItemWidget_);
                        },
                        //  onAddExerciseToPreviewFunction:,
                      );
                    },
                  ).toList(),
                ), //children

                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              //availale exercises padding
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),

            //border property
            shape: BeveledRectangleBorder(
              side: BorderSide(
                color: Colors.amber[800],
                width: 2,
              ),
            ),

            color: ApplicationColorsPallete.ColorsPallete_["BlackGreyish"],
          ),
          width: double.infinity,
          height: 500,
          //padding:EdgeInsets.only(left:10,right:10),
        ),
      ],
    );
  }
}
