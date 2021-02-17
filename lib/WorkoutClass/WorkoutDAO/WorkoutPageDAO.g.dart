// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkoutPageDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutPageDAO _$WorkoutPageDAOFromJson(Map<String, dynamic> json) {
  return WorkoutPageDAO(
    listOfWorkoutWidget: (json['listOfWorkoutWidget'] as List)
        ?.map((e) => e == null
            ? null
            : WorkoutItemWidgetDAO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WorkoutPageDAOToJson(WorkoutPageDAO instance) =>
    <String, dynamic>{
      'listOfWorkoutWidget':
          instance.listOfWorkoutWidget?.map((e) => e?.toJson())?.toList(),
    };
