/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //page content
  //this will be used as a page for the main content of the app
  static const List<Widget> _pageContentOptions = <Widget>[
    Text(
      'Schedules page',
      style: optionStyle,
    ),
    Text(
      'Routines page',
      style: optionStyle,
    ),
    Text(
      'Workout page',
      style: optionStyle,
    ),
  ];

  ///Called with an index as its argument according to which tab is pressed
  ///by calling setState to rebuild the Widget
  void _onTabPressed(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout logger'),
      ),
      //the body parameter keeps track of the pages
      body: Center(
        child: _pageContentOptions[_selectedPageIndex],
      ),
      //the bottom navigation bar
      bottomNavigationBar: Card(
        child: BottomNavigationBar(
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
        elevation:1000000000000000000000,
        color:Colors.black87,
       
      ),
    );
  }
}
