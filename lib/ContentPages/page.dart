import 'package:flutter/material.dart';


class ApplicationPage extends StatelessWidget {
  final String pageTitle;

  ///this property will have some spacing specified by the constructor
  List<Widget> contentsList;
  //constructor
  ApplicationPage({
    @required this.pageTitle,
   @required double spaceBetweenItem,
   @required List<Widget> itemList,
  }) {
    this.contentsList = BuildContentsListWidget(spaceBetweenItem, itemList);
  }

//returns in a list of widget with spacing between childs feature
  List<Widget> BuildContentsListWidget(
      double spaceBetweenItem, List<Widget> itemList) {
    List<Widget> newContentsList = [];

    for (int i = 0; i < itemList.length; i++) {
      newContentsList.add(itemList[i]);
      //dont add box spacing
      if (i < itemList.length - 1) {
        newContentsList.add(SizedBox(
          height: spaceBetweenItem,
        ));
      }
    }
    return newContentsList;
  }

  ///show  a modal bottom sheet when a certainn button is pressed
  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      //takes in a function with taking in context as an argument and return a widget for the modar sheet
      builder: (BuildContext context) {
        return Container(
          height: 610,
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
        onPressed: () {
          ShowModalBottomSheet(context);
        },
        backgroundColor: Colors.amber[800],
        focusColor: Colors.amber[300],
      ),
    );
  }
}
