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
  static List<String> exerciseTypeList=ConvertExerciseTypeToStrings();
  ///return a enum value in a string format
  static String ConvertEnumToString({ExerciseType enumValue}) {
    return enumValue.toString().split(".")[1];
  }

  ///enum_:Enum Type
  static List<String> ConvertExerciseTypeToStrings() {
    List<String> convertedEnum = [];
    for (var value in ExerciseType.values) {
      convertedEnum.add(ConvertEnumToString(enumValue: value));
    }
    return convertedEnum;
  }
}
