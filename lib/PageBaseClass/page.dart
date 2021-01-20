import 'package:WorkoutLoggerApp/miscellaneousStuffs/WidgetConverter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
enum PageInputType {
  modalBottomPage,
  newNormalPage,
}

class ApplicationPage extends StatelessWidget {
  final String pageTitle;
  final PageInputType pageInputType;

  ///the main contents of the page
  List<Widget> contentsList;

  ///list of the widget that will be put for the page input
  List<Widget> modalBottomPageWidgetsImplementation;

  ///this class will be used as navigatable page for adding new item
  Widget inputPage;

  ///Fill modalBottomPageWidgetsImplementation if pageInputType=PageInputType.modalBottomPage
  ///Fill inputPage if  pageInputType=PageInputType.newNormalPage
  ApplicationPage({
    @required this.pageTitle,

    ///space between the item:Workout,schedule and ect
    @required double spaceBetweenItem,

    ///the item of the main content of the page
    @required List<Widget> itemList,

    ///this property will be used for the modal bottom page
    this.modalBottomPageWidgetsImplementation,
    @required this.pageInputType,
  }) {
    this.contentsList = WidgetConverterLibrary.BuildWidgetsWithSpace(
      itemList: itemList,
      spaceBetweenItem: spaceBetweenItem,
    );
  }

  ///show an input page for the user according to its type
  void ShowInputPageToAddNewItem(BuildContext context,
      List<Widget> pageInputToAddNewItemWidgets, PageInputType pageInputType) {
    //show new page
    if (this.pageInputType == PageInputType.modalBottomPage) {
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
                children: this.modalBottomPageWidgetsImplementation,
              ),
            );
          });
        },
      );
    } else if (this.pageInputType == PageInputType.newNormalPage) {
      //navigate to new page
      Navigator.push(
        context, //the page that will be directed to
        //need to provide an annonymus function that will return an instance of page(widget)
        MaterialPageRoute(
          builder: (context) {
            //navigated page widget
            //error:This should return the Page Class that this (base class) receive through the constructor
            //return new ;
            /*
            return new Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: this.modalBottomPageWidgetsImplementation,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            );
            */
          },
        ),
      );
    }
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
      //a button that will open up an input page to add the new item
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //open the modal bottom sheet when the buttonn is pressed
        onPressed: () {
          ShowInputPageToAddNewItem(context,
              this.modalBottomPageWidgetsImplementation, this.pageInputType);
        },
        backgroundColor: Colors.amber[800],
        focusColor: Colors.amber[300],
      ),
    );
  }
}
