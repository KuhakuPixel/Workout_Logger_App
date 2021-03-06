import 'package:flutter/foundation.dart';

enum ExerciseType {
  weighted,
  bodyweight,
  timed,
}

///"Upper Chest",
///"Lower Chest",
///"Traps",
///"Forearms",
///"Bicep",
///"Lats",
///"Upper ABS",
///"Lower ABS",
///"Oblique",
///"Quads",
///"Upper Back",
///"Lower Back",
///"Delts",
///"Tricep",
///"Hamstring",
///"Calves",
List<String> muscleList = [
  "Upper Chest",
  "Lower Chest",
  "Traps",
  "Forearms",
  "Bicep",
  "Lats",
  "Upper ABS",
  "Lower ABS",
  "Oblique",
  "Quads",
  "Upper Back",
  "Lower Back",
  "Delts",
  "Tricep",
  "Hamstring",
  "Calves",
];

class ExerciseConverterClass {
  static List<String> exerciseTypeList = ConvertExerciseTypeToStrings();

  ///return a enum value in a string format
  static String ConvertExerciseTypeEnumToString({ExerciseType enumValue}) {
    //because toString will return "Enum.Value"
    return enumValue.toString().split(".")[1];
  }

  ///enum_:Enum Type
  static List<String> ConvertExerciseTypeToStrings() {
    List<String> convertedEnum = [];
    for (var value in ExerciseType.values) {
      convertedEnum.add(ConvertExerciseTypeEnumToString(enumValue: value));
    }
    return convertedEnum;
  }

  static ExerciseType ConvertStringToExerciseType(String stringValue) {
    //loop until it found the matching stringValue and ExerciseType

    for (var exerciseTypeValue in ExerciseType.values) {
      if (ConvertExerciseTypeEnumToString(enumValue: exerciseTypeValue) == stringValue) {
        return exerciseTypeValue;
      }
    }

    //found nothing
    print("No matching enum is found");
    return null;
  }
}
