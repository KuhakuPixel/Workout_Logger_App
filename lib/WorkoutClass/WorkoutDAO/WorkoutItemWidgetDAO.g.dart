// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkoutItemWidgetDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutItemWidgetDAO _$WorkoutItemWidgetDAOFromJson(Map<String, dynamic> json) {
  return WorkoutItemWidgetDAO(
    workoutName: json['workoutName'] as String,
    workoutInfoPage: json['workoutInfoPage'] == null
        ? null
        : WorkoutWidgetInformationPageDAO.fromJson(
            json['workoutInfoPage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorkoutItemWidgetDAOToJson(
        WorkoutItemWidgetDAO instance) =>
    <String, dynamic>{
      'workoutName': instance.workoutName,
      'workoutInfoPage': instance.workoutInfoPage?.toJson(),
    };
