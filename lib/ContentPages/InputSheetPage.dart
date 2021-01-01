import 'package:flutter/material.dart';

class InputPageForm extends StatelessWidget {
  final String pageTitle;
  InputPageForm({this.pageTitle});
  @override
  Widget build(BuildContext context) {
    //allow some flexibility by wrapping all the widget in a containr
    return Scaffold(
      body: Row(
        //main content for the page
        children: <Widget>[
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  Text(
                    "Exercises List",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        print("AddShit");
                      },
                      child: Text(
                        "Add Exercise",
                        style: TextStyle(
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            height: 100,
            width: 411.4,
          )
        ],
      ),
        // a floatingactionbuttonn that is built in as a parameter of schaffhold
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          
        },
        backgroundColor:Colors.amber[800] ,
        focusColor:Colors.amber[300],
      ),
    );
  }
}
