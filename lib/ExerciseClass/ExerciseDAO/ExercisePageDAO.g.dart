// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExercisePageDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExercisePageDAO _$ExercisePageDAOFromJson(Map<String, dynamic> json) {
  return ExercisePageDAO(
    (json['exerciseItemDaoList'] as List)
        ?.map((e) => e == null
            ? null
            : ExerciseItemWidgetDAO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ExercisePageDAOToJson(ExercisePageDAO instance) =>
    <String, dynamic>{
      'exerciseItemDaoList':
          instance.exerciseItemDaoList?.map((e) => e?.toJson())?.toList(),
    };
