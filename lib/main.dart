import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';
import 'package:WorkoutLoggerApp/PageBaseClass/page.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutPage.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

///Class that controls the main application
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  //pagek
  static ApplicationPage schedulePage = new ApplicationPage(
    itemList: <Widget>[],
    pageInputType: PageInputType.modalBottomPage,
    pageTitle: "SchedulePage",
    spaceBetweenItem: 5,
    modalBottomPageWidgetsImplementation: <Widget>[],
  );
  static WorkoutPage workoutPage = new WorkoutPage();
  static ExercisePage exercisePage = new ExercisePage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: AppStatefulWidget(),
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class AppStatefulWidget extends StatefulWidget {
  AppStatefulWidget({Key key}) : super(key: key);

  //create state from the _AppStatefulWidgetState
  @override
  _AppStatefulWidgetState createState() => _AppStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AppStatefulWidgetState extends State<AppStatefulWidget> {
  int _selectedPageIndex = 0;

  //page content
  //this will be used as a page for the main content of the app
  static List<Widget> appPages = <Widget>[
    //MyApp.schedulePage,
    MyApp.workoutPage,
    MyApp.exercisePage,
  ];

  

//main virtual function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On Development by NicholasPixel'),
      ),
      //the body will control the main page content appPages[_selectedPageIndex]
      body: appPages[_selectedPageIndex],

      //the bottom navigation bar//containing it with card to allow for more decoration
      bottomNavigationBar: Card(
        child: BottomNavigationBar(
          //tab bar's icons and buttons
          items: <BottomNavigationBarItem>[
            /*
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Schedules',
            )*/
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Workouts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Exercises',
            ),
          ],

          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.amber[800],
          //keeps track of the page index contents
          //by assigning a value according to the index
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
            
          },
        ),
        elevation: 1000000000000000000000,
        color: Colors.black87,
      ),
    );
  }
}
