import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/cupertino.dart';

///static class that will be used to monitor the state changes of the application
class StateManager {
  ///return search result
  ///only use this function to search through the widget that has a property that can be used as a name ,category and ect
  static List<ExerciseItemWidget> SearchExercises(
      {List<ExerciseItemWidget> itemCollections, String searchResult}) {
    //make sure to initialize local variable so it will not get null reference exception
    List<ExerciseItemWidget> searchedItemsResult = <ExerciseItemWidget>[];
    //RETURN DEFAULT IF THE SEARCH RESULT IS EMPTY
    if (searchResult == "") {
      return itemCollections;
    } else {
      for (int i = 0; i < itemCollections.length; i++) {
        //if found the searched result then add it so that value will be returned later
        if (itemCollections[i].exerciseName.toLowerCase() == searchResult) {
          searchedItemsResult.add(itemCollections[i]);
        }
      }
      return searchedItemsResult;
    }

  }
}
