import 'package:WorkoutLoggerApp/ExerciseClass/ExercisePage.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

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
  static List<Widget> _pageContentOptions = <Widget>[
    ExercisePage(),
    ExercisePage(),
    ExercisePage(),
  ];

  ///Called with an index as its argument according to which tab is pressed
  ///by calling setState to rebuild the Widget
  void _onTabPressed(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
//main virtual function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      //the body will control the main page content
      body: _pageContentOptions[_selectedPageIndex],

      //the bottom navigation bar//containing it with card to allow for more decoration
      bottomNavigationBar: Card(
        child: BottomNavigationBar(
          //tab bar's icons and buttons
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Schedules',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Routines',
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
          onTap: _onTabPressed,
        ),
        elevation: 1000000000000000000000,
        color: Colors.black87,
      ),
    );
  }
}
