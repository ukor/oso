import 'package:json_annotation/json_annotation.dart';

part 'example.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ExampleDto {
  const ExampleDto({
    required this.name,
    required this.age,
    required this.dateOfBirth,
  });

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final int age;

  @JsonKey(required: true)
  final DateTime dateOfBirth;

  get isBirthday {
    final now = DateTime.now();

    return now.day == dateOfBirth.day && now.month == dateOfBirth.month;
  }
}
