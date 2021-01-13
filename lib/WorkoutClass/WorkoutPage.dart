import 'package:WorkoutLoggerApp/ContentPages/page.dart';
import 'package:WorkoutLoggerApp/CustomWidget/CloseModalBottomPageAndConfirmButton.dart';
import 'package:WorkoutLoggerApp/CustomWidget/TextInput.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/ToAddExercisePage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  ///this is the value for all of the widgets in the modal bottom page
  double modalWidgetsLeftPaddingValue = 6;
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      pageTitle: "WorkoutPage",
      spaceBetweenItem: 5,
      itemList: <Widget>[
        Text("Hello world"),
      ],
      
      /////////////////////  bottomModalPageInputWidgets
      bottomModalPageInputWidgets: <Widget>[
        ///widgets for the modal page input
        //Exercise name input and Add exercise button
        Row(
          children: [
            AmberTextInput(
              labelText: "Type workout Name here",
              onChanged: (stringValue) {},
              leftPaddingValue: 6,
              textInputWidth: 200,
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  //navigate to a new page to select an exercise
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
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
        //boxed container
        Container(
          child: Card(
            //the content of the item widget
            child: Column(
              //item inside the card (aligned by the help of column widget)
              children: <Widget>[
                //search bar
                /*
                AmberTextInput(
                  labelText: "Search Exercise..........",
                  onChanged: (stringValue) {},
                  leftPaddingValue: 8,
                  textInputWidth: 250,
                  textInputHeight:50,
                ),
                */
                //Search field
                /*
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
                      labelText: 'Search Exercise',
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(8), // Added this
                      //enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                  width: 350,
                  padding: EdgeInsets.only(
                    //left: 10,
                    top: 20,
                  ),
                  alignment: Alignment.center,
                ),
                */
              ],

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
