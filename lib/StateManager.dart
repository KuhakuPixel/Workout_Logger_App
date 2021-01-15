import 'package:WorkoutLoggerApp/ExerciseClass/ExerciseItemWidget.dart';
import 'package:flutter/cupertino.dart';

///static class that will be used to monitor the state changes of the application
class StateManager {
  ///return search result
  ///only use this function to search through the widget that has a property that can be used as a name ,category and ect
  static List<ExerciseItemWidget> SearchExercises({
    List<ExerciseItemWidget> itemCollections,
    String searchResult,
  }) {
    ///the item that will be visible according to the search result
    List<ExerciseItemWidget> searchedItemsResult = <ExerciseItemWidget>[];
    //RETURN DEFAULT IF THE SEARCH RESULT IS EMPTY
    if (searchResult == "") {
      //return original if search is empty
      return itemCollections;
    } else {
      //add the result item after being searched by the user one by one(iteration checking)
      for (int i = 0; i < itemCollections.length; i++) {
        //replace space to no space
        searchResult = searchResult.replaceAll(new RegExp(r' '), "");
        String exerciseName =
            itemCollections[i].exerciseName.replaceAll(new RegExp(r' '), "");
        //add the item if it contains a substring of the search result
        if (IsSubStringInString(searchResult, exerciseName)) {
          searchedItemsResult.add(itemCollections[i]);
        }
      }
    }
    return searchedItemsResult;
  }

  ///return true if subString is inside mainString
  static bool IsSubStringInString(String subString, String mainString) {
    List<String> subStringCharacters = ConvertStringToCharacters(subString);
    List<String> mainStringCharacters = ConvertStringToCharacters(mainString);

    //loop the main string
    for (int i = 0; i < mainStringCharacters.length; i++) {
      //make sure to not have an error of "index is out of the bound range"
      //for example: mainString:noobmaster ,subString:noob
      //at the third iteration it will throw an error
      if (i + subStringCharacters.length <= mainStringCharacters.length) {
        //loop the substring and check if the character are the same
        for (int j = 0; j < subStringCharacters.length; j++) {
          //main string will start from i since it will move one by one on the main string
          if (subStringCharacters[j].toLowerCase() !=
              mainStringCharacters[i + j].toLowerCase()) {
            //break out of the loop(stop secondary loop and move on to the next iteration of the main string)
            break;
          } else if (j == subStringCharacters.length - 1) {
            //will return true since we know that the code flow will reach here if only the mainString contain the subString

            return true;
          }
        }
      }
      //return false since it will return true if only the sub string is contained inside
      else {
        return false;
      }
    }

    return false;
  }

  static List<String> ConvertStringToCharacters(String input) {
    List<String> characters = <String>[];
    //split and add each char to the list
    input.split('').forEach((char) => characters.add(char));
    return characters;
  }
}
