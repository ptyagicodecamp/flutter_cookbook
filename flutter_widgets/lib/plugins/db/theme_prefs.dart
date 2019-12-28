import 'package:flutter_widgets/themes/db/themes_notifier_db.dart';
import 'package:moor/moor.dart';

part 'theme_prefs.g.dart';

// this will generate a table called "theme_prefs" for us. The rows of that table will
// be represented by a class called "ThemePref".
class ThemePrefs extends Table {
  // MyThemes id
  IntColumn get theme_id => integer()();
  TextColumn get theme_name => text()();
}

// Moor prepares database table
@UseMoor(tables: [ThemePrefs])
class MyDatabase extends _$MyDatabase {
//  MyDatabase(QueryExecutor e) : super(e);

  MyDatabase(QueryExecutor e) : super(e);

  // we tell the database where to store the data with this constructor
//  MyDatabase()
//      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) {
      return m.createAllTables();
    }, onUpgrade: (Migrator m, int from, int to) async {
      m.deleteTable(themePrefs.actualTableName);
      m.createAllTables();
    }, beforeOpen: (details) async {
      if (details.wasCreated) {
        await into(themePrefs).insert(ThemePrefsCompanion(
          theme_id: const Value(0),
          theme_name: Value(MyThemes.light.toString()),
        ));
      }
    });
  }

  Future<List<ThemePref>> get allThemePrefs => select(themePrefs).get();

  void activateTheme(MyThemes theme) {
    ThemePref pref =
        ThemePref(theme_id: theme.index, theme_name: theme.toString());
    into(themePrefs).insert(pref);
  }

  void deactivateTheme(int i) =>
      (delete(themePrefs)..where((t) => t.theme_id.equals(i))).go();

  //The stream will automatically emit new items whenever the underlying data changes.
  Stream<bool> isPresent(int id) {
    return select(themePrefs)
        .watch()
        .map((prefs) => prefs.any((pref) => pref.theme_id == id));
  }

  Future<ThemePref> isThemeActive(int id) {
    return (select(themePrefs)..where((theme) => theme.theme_id.equals(id)))
        .getSingle();
    // runs SELECT * FROM users WHERE id = ?, automatically binds the parameter
    // and parses the result row.
  }

  Future<ThemePref> getActiveTheme() {
    return select(themePrefs).getSingle();
  }
}
