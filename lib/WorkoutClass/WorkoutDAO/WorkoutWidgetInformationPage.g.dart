// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkoutWidgetInformationPageDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutWidgetInformationPageDAO _$WorkoutInputPageDAOFromJson(Map<String, dynamic> json) {
  return WorkoutWidgetInformationPageDAO(
    workoutName: json['workoutName'] as String,
    exercisesInWorkout: (json['exercisesInWorkout'] as List)
        ?.map((e) => e == null
            ? null
            : ExerciseItemWidgetVolumeDAO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workoutPageType:
        _$enumDecodeNullable(_$WorkoutPageTypeEnumMap, json['workoutPageType']),
  );
}

Map<String, dynamic> _$WorkoutInputPageDAOToJson(
        WorkoutWidgetInformationPageDAO instance) =>
    <String, dynamic>{
      'workoutName': instance.workoutName,
      'exercisesInWorkout':
          instance.exercisesInWorkout?.map((e) => e?.toJson())?.toList(),
      'workoutPageType': _$WorkoutPageTypeEnumMap[instance.workoutPageType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$WorkoutPageTypeEnumMap = {
  WorkoutPageType.pageToAddNewWorkout: 'pageToAddNewWorkout',
  WorkoutPageType.workoutPageInfo: 'workoutPageInfo',
};
