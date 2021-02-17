// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExerciseItemVolumeDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseItemWidgetVolumeDAO _$ExerciseItemWidgetVolumeDAOFromJson(
    Map<String, dynamic> json) {
  return ExerciseItemWidgetVolumeDAO(
    exerciseName: json['exerciseName'] as String,
    exerciseType:
        _$enumDecodeNullable(_$ExerciseTypeEnumMap, json['exerciseType']),
    targetMuscle: json['targetMuscle'] as String,
  )..exerciseSetsWidgets = (json['exerciseSetsWidgets'] as List)
      ?.map((e) => e == null
          ? null
          : ExerciseSetInstanceDAO.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$ExerciseItemWidgetVolumeDAOToJson(
        ExerciseItemWidgetVolumeDAO instance) =>
    <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType],
      'targetMuscle': instance.targetMuscle,
      'exerciseSetsWidgets':
          instance.exerciseSetsWidgets?.map((e) => e?.toJson())?.toList(),
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

const _$ExerciseTypeEnumMap = {
  ExerciseType.weighted: 'weighted',
  ExerciseType.bodyweight: 'bodyweight',
  ExerciseType.timed: 'timed',
};
