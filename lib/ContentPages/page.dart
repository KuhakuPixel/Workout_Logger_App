import 'package:flutter/material.dart';

class ApplicationPage extends StatelessWidget {
  final String pageTitle;

  //constructor
  ApplicationPage({this.pageTitle});

  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      //takes in a function with taking in context as an argument and return a widget for the modar sheet
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.grey[900],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //allow some flexibility by wrapping all the widget in a containr
    return Scaffold(
      body: Row(
        //main content for the page
        children: <Widget>[],
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
