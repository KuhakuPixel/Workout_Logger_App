import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutDAO/WorkoutItemWidgetDAO.dart';
import 'package:WorkoutLoggerApp/WorkoutClass/WorkoutWidgetInformationPage.dart';
import 'package:WorkoutLoggerApp/miscellaneousStuffs/ApplicationColorsPallete.dart';
import 'package:flutter/material.dart';

///Control the colors of the ExerciseItemWidget
class WorkoutItemWidgetProperty {
//decoration
  static Color textColor = Colors.amber[800];
  //ApplicationColorsPallete.ColorsPallete_["Light Grey 2"]
  static Color cardBorderColor = Colors.amber[800];
  static Color cardBackgroundColor =
      ApplicationColorsPallete.ColorsPallete_["BlackGreyish"];
}

class WorkoutItemWidget extends StatelessWidget {
  final String workoutName;

  ///this will be a page that the user can navigatte to to edit the workout
  final WorkoutWidgetInformationPage workoutInfoPage;
  //size property
  final double workoutCardHeight = 100;
  //card spacing margin in the container
  final double cardLeftPaddingValue = 10;
  final double cardRightPaddingValue = 0;
  final double cardTopPaddingValue = 10;
  final double cardBottomPaddingValue = 0;

  WorkoutItemWidget({
    @required this.workoutName,
    @required this.workoutInfoPage,
  }) {}

  ///instantiate  from DAO
  WorkoutItemWidget.fromDAO(WorkoutItemWidgetDAO dao)
      : workoutName = dao.workoutName,
        //assign the workoutInfoPage using the dao
        workoutInfoPage = new WorkoutWidgetInformationPage.fromDAO(
          dao.workoutInfoPage,
        );

  ///convert to DAO(used for saving locally)
  WorkoutItemWidgetDAO toDAO() {
    return new WorkoutItemWidgetDAO(
      workoutName: this.workoutName,
      workoutInfoPage: this.workoutInfoPage.toDAO(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          //the content of the item widget
          child: Container(
            child: Row(children: <Widget>[
              //workout name
              Column(
                children: <Widget>[
                  //exercise name title
                  Text(
                    this.workoutName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      letterSpacing: 0.4,
                      wordSpacing: 2,
                      color: WorkoutItemWidgetProperty.textColor,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              //edit button
              RawMaterialButton(
                //when pressed go to a new page to edit this workout property
                onPressed: () {
                  Navigator.push(
                    context,
                    //the page that will be directed to
                    //need to provide an annonymus function that will return an instance of page(widget)
                    MaterialPageRoute(
                      builder: (context) {
                        //return the page widget to be built.....
                        return this.workoutInfoPage;
                      },
                    ),
                  );
                },
                elevation: 2.0,
                fillColor: Colors.amber[800],
                child: Icon(
                  Icons.create_rounded,
                  size: 20.0,
                ),
                //padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            padding: EdgeInsets.only(
              left: this.cardLeftPaddingValue,
              right: this.cardRightPaddingValue,
              top: this.cardTopPaddingValue,
              bottom: this.cardBottomPaddingValue,
            ),
          ),

          //border property
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: WorkoutItemWidgetProperty.cardBorderColor,
              width: 2.5,
            ),
          ),
          color: WorkoutItemWidgetProperty.cardBackgroundColor
          //elevation:10000000000000,
          ),
      width: double.maxFinite,
      height: this.workoutCardHeight,
      //set padding size
    );
  }
}
