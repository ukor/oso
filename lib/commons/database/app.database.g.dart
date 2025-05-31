// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.database.dart';

// ignore_for_file: type=lint
abstract class _$OsoDatabase extends GeneratedDatabase {
  _$OsoDatabase(QueryExecutor e) : super(e);
  $OsoDatabaseManager get managers => $OsoDatabaseManager(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

class $OsoDatabaseManager {
  final _$OsoDatabase _db;
  $OsoDatabaseManager(this._db);
}
