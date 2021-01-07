import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationPage extends StatelessWidget {
  final String pageTitle;

  ///this property will have some spacing specified by the constructor
  List<Widget> contentsList;
  List<Widget> modalPageWidgets;
  //constructor
  ApplicationPage({
    @required this.pageTitle,
    @required double spaceBetweenItem,
    @required List<Widget> itemList,
    @required this.modalPageWidgets,
  }) {
    this.contentsList = BuildContentsListWidget(spaceBetweenItem, itemList);
  }

  ///returns in a list of widget with spacing between childs
  List<Widget> BuildContentsListWidget(
      double spaceBetweenItem, List<Widget> itemList) {
    List<Widget> newContentsList = [];

    for (int i = 0; i < itemList.length; i++) {
      newContentsList.add(itemList[i]);

      //add boxing space accordingly

      newContentsList.add(
        SizedBox(
          height: spaceBetweenItem,
        ),
      );
    }
    return newContentsList;
  }

  ///show  a modal bottom sheet when the add button is pressed
  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      //takes in a function with taking in context as an argument and return a widget for the modar sheet
      builder: (BuildContext context) {
        //wrapping the modal bottom sheet widget in a statefulbuilder to fix state not updating after notifying the framework
        return StatefulBuilder(
            //builder will take in a function with argument (context and setstate(void function that takwes in another void function))
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 610,
            width: double.infinity,
            color: Colors.grey[900],
            //contents of the input spreadsheet
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              //the widgets input  content
              children: this.modalPageWidgets,
            ),
          );
        });
      },
    );
  }

  //a virtual function that will be implemented to be used for  each page
  @override
  Widget build(BuildContext context) {
    //allow some flexibility by wrapping all the widget in a containr
    return Scaffold(
      //main content for the page//where the items will be implemented
      body: Container(
        //add some spacing
        padding: EdgeInsets.only(
          top: 5,
        ),
        //wrapped the list with a scrollable widget
        child: SingleChildScrollView(
          child: Column(
            children: contentsList,
          ),
          //padding: EdgeInsets.only(bottom: 15),
        ),
      ),
      // a floatingactionbuttonn that is built in as a parameter of schaffhold
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //open the modal bottom sheet when the buttonn is pressed
        onPressed: () {
          ShowModalBottomSheet(context);
        },
        backgroundColor: Colors.amber[800],
        focusColor: Colors.amber[300],
      ),
    );
  }
}
