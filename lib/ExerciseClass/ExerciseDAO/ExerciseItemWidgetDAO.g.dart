// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExerciseItemWidgetDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseItemWidgetDAO _$ExerciseItemWidgetDAOFromJson(Map<String, dynamic> json) {
  return ExerciseItemWidgetDAO(
    json['exerciseName'] as String,
    _$enumDecodeNullable(_$ExerciseTypeEnumMap, json['exerciseType']),
    json['targetMuscle'] as String,
  );
}

Map<String, dynamic> _$ExerciseItemWidgetDAOToJson(ExerciseItemWidgetDAO instance) => <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType],
      'targetMuscle': instance.targetMuscle,
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

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

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
