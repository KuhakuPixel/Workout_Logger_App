import 'package:WorkoutLoggerApp/CardItemWidgets/ExerciseItemWidget.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatelessWidget {
  final String pageTitle;

  //constructor
  ApplicationPage({this.pageTitle});

  ///show  a modal bottom sheet when a certainn button is pressed
  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      //takes in a function with taking in context as an argument and return a widget for the modar sheet
      builder: (BuildContext context) {
        return Container(
          height: 600,
          width: double.infinity,
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //the input sheed content
            children: <Widget>[
              //close and confirm button
              Container(
                child: Row(
                  children: [
                    //close button
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      elevation: 2.0,
                      fillColor: Colors.amber[800],
                      child: Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                      //padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    //confirm button button
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        print("Submit input");
                      },
                      elevation: 2.0,
                      fillColor: Colors.amber[800],
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                      ),
                      // padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        );
      },
    );
  }

  //a virtual function that will be implemented to be used for  each page
  @override
  Widget build(BuildContext context) {
    //allow some flexibility by wrapping all the widget in a containr
    return Scaffold(
      body: Column(
        //main content for the page//where the items will be implemented
        children: <Widget>[
          //Text(this.pageTitle),
          ExerciseItemWidget(exerciseName: "Push up"),
          ExerciseItemWidget(exerciseName: "Pull up"),
        ],
      ),
      // a floatingactionbuttonn that is built in as a parameter of schaffhold
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ShowModalBottomSheet(context);
        },
        backgroundColor: Colors.amber[800],
        focusColor: Colors.amber[300],
      ),
    );
  }
}
