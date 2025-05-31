import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:oso/commons/dtos/coordinate.dto.dart';

class CoordinateConverter extends TypeConverter<CoordinateDto, String> {
  const CoordinateConverter();

  @override
  CoordinateDto fromSql(String fromDb) {
    return CoordinateDto.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(CoordinateDto value) {
    return json.encode(value.toJson());
  }
}
