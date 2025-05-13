// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleDto _$ExampleDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'age', 'dateOfBirth'],
  );
  return ExampleDto(
    name: json['name'] as String,
    age: (json['age'] as num).toInt(),
    dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  );
}

Map<String, dynamic> _$ExampleDtoToJson(ExampleDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };
