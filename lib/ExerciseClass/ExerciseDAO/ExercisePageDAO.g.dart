// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExercisePageDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

//turn the map to object by using the fromJson function from the instance
ExercisePageDAO _$ExercisePageDAOFromJson(Map<String, dynamic> json) {
  List<dynamic> exerciseListMap = json['exerciseList'];

  //to be filled
  List<ExerciseItemWidget> exerciseItemWidgets = [];
  for (int i = 0; i < exerciseListMap.length; i++) {
    //construct each ExerciseItemWidgetDAO by using the json (oftype map) and then use that DAO to create ExerciseItemWidge
    ExerciseItemWidgetDAO exerciseItemWidgetDAO = new ExerciseItemWidgetDAO.fromJson(exerciseListMap[i]);
    exerciseItemWidgets.add(
      new ExerciseItemWidget(
        exerciseName: exerciseItemWidgetDAO.exerciseName,
        exerciseType: exerciseItemWidgetDAO.exerciseType,
        targetMuscle: exerciseItemWidgetDAO.targetMuscle,
      ),
    );
  }
  //construct back the DAO

  return ExercisePageDAO(exerciseItemWidgets);
}

//should turn to list of map first (list of object's json) for its member(by using the toJson function from the instance)
Map<String, dynamic> _$ExercisePageDAOToJson(ExercisePageDAO instance) {
  //return json
  return <String, dynamic>{
    //map every item in exerciseList to a Map<String,dynamic>
    'exerciseList': instance.exerciseItemDaoList.map<Map<String, dynamic>>((exerciseItemDAO) {
      return exerciseItemDAO.toJson();
    }).toList(),
  };
}
