import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:path_provider/path_provider.dart';

part 'app.database.g.dart';

@DriftDatabase(tables: [], daos: [])
class OsoDatabase extends _$OsoDatabase {
  final String environment;
  OsoDatabase({required this.environment})
    : super(_openConnection(environment));

  /// [databaseVersion]
  /// bump this whenever an existing database table is changed.
  final int _version = 1;

  @override
  int get schemaVersion => _version;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }
}

LazyDatabase _openConnection(String environment) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, '${environment}_oso.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cacheBase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
