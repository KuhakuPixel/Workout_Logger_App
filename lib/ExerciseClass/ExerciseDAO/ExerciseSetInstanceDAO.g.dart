// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExerciseSetInstanceDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSetInstanceDAO _$ExerciseSetInstanceDAOFromJson(
    Map<String, dynamic> json) {
  return ExerciseSetInstanceDAO(
    exerciseType:
        _$enumDecodeNullable(_$ExerciseTypeEnumMap, json['exerciseType']),
    exerciseSetIndex: json['exerciseSetIndex'] as int,
    weightValue: (json['weightValue'] as num)?.toDouble(),
    numberOfRepetition: json['numberOfRepetition'] as int,
  );
}

Map<String, dynamic> _$ExerciseSetInstanceDAOToJson(
        ExerciseSetInstanceDAO instance) =>
    <String, dynamic>{
      'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType],
      'exerciseSetIndex': instance.exerciseSetIndex,
      'numberOfRepetition': instance.numberOfRepetition,
      'weightValue': instance.weightValue,
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
