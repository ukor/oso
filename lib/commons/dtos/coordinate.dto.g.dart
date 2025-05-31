// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinateDto _$CoordinateDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['longitude', 'latitude'],
  );
  return CoordinateDto(
    longitude: (json['longitude'] as num).toDouble(),
    latitude: (json['latitude'] as num).toDouble(),
    text: json['text'] as String?,
  );
}

Map<String, dynamic> _$CoordinateDtoToJson(CoordinateDto instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'text': instance.text,
    };
