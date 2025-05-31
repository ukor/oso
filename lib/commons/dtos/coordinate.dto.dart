import 'package:json_annotation/json_annotation.dart';

part 'coordinate.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CoordinateDto {
  @JsonKey(required: true)
  double longitude;

  @JsonKey(required: true)
  double latitude;

  @JsonKey(required: false)
  String? text;

  CoordinateDto({required this.longitude, required this.latitude, this.text});

  factory CoordinateDto.fromJson(Map<String, dynamic> json) {
    return _$CoordinateDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoordinateDtoToJson(this);
}
