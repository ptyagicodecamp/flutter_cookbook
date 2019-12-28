// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_prefs.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ThemePref extends DataClass implements Insertable<ThemePref> {
  final int theme_id;
  final String theme_name;
  ThemePref({@required this.theme_id, @required this.theme_name});
  factory ThemePref.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ThemePref(
      theme_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}theme_id']),
      theme_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}theme_name']),
    );
  }
  factory ThemePref.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ThemePref(
      theme_id: serializer.fromJson<int>(json['theme_id']),
      theme_name: serializer.fromJson<String>(json['theme_name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'theme_id': serializer.toJson<int>(theme_id),
      'theme_name': serializer.toJson<String>(theme_name),
    };
  }

  @override
  ThemePrefsCompanion createCompanion(bool nullToAbsent) {
    return ThemePrefsCompanion(
      theme_id: theme_id == null && nullToAbsent
          ? const Value.absent()
          : Value(theme_id),
      theme_name: theme_name == null && nullToAbsent
          ? const Value.absent()
          : Value(theme_name),
    );
  }

  ThemePref copyWith({int theme_id, String theme_name}) => ThemePref(
        theme_id: theme_id ?? this.theme_id,
        theme_name: theme_name ?? this.theme_name,
      );
  @override
  String toString() {
    return (StringBuffer('ThemePref(')
          ..write('theme_id: $theme_id, ')
          ..write('theme_name: $theme_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(theme_id.hashCode, theme_name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ThemePref &&
          other.theme_id == this.theme_id &&
          other.theme_name == this.theme_name);
}

class ThemePrefsCompanion extends UpdateCompanion<ThemePref> {
  final Value<int> theme_id;
  final Value<String> theme_name;
  const ThemePrefsCompanion({
    this.theme_id = const Value.absent(),
    this.theme_name = const Value.absent(),
  });
  ThemePrefsCompanion.insert({
    @required int theme_id,
    @required String theme_name,
  })  : theme_id = Value(theme_id),
        theme_name = Value(theme_name);
  ThemePrefsCompanion copyWith(
      {Value<int> theme_id, Value<String> theme_name}) {
    return ThemePrefsCompanion(
      theme_id: theme_id ?? this.theme_id,
      theme_name: theme_name ?? this.theme_name,
    );
  }
}

class $ThemePrefsTable extends ThemePrefs
    with TableInfo<$ThemePrefsTable, ThemePref> {
  final GeneratedDatabase _db;
  final String _alias;
  $ThemePrefsTable(this._db, [this._alias]);
  final VerificationMeta _theme_idMeta = const VerificationMeta('theme_id');
  GeneratedIntColumn _theme_id;
  @override
  GeneratedIntColumn get theme_id => _theme_id ??= _constructThemeId();
  GeneratedIntColumn _constructThemeId() {
    return GeneratedIntColumn(
      'theme_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _theme_nameMeta = const VerificationMeta('theme_name');
  GeneratedTextColumn _theme_name;
  @override
  GeneratedTextColumn get theme_name => _theme_name ??= _constructThemeName();
  GeneratedTextColumn _constructThemeName() {
    return GeneratedTextColumn(
      'theme_name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [theme_id, theme_name];
  @override
  $ThemePrefsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'theme_prefs';
  @override
  final String actualTableName = 'theme_prefs';
  @override
  VerificationContext validateIntegrity(ThemePrefsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.theme_id.present) {
      context.handle(_theme_idMeta,
          theme_id.isAcceptableValue(d.theme_id.value, _theme_idMeta));
    } else if (theme_id.isRequired && isInserting) {
      context.missing(_theme_idMeta);
    }
    if (d.theme_name.present) {
      context.handle(_theme_nameMeta,
          theme_name.isAcceptableValue(d.theme_name.value, _theme_nameMeta));
    } else if (theme_name.isRequired && isInserting) {
      context.missing(_theme_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ThemePref map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ThemePref.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ThemePrefsCompanion d) {
    final map = <String, Variable>{};
    if (d.theme_id.present) {
      map['theme_id'] = Variable<int, IntType>(d.theme_id.value);
    }
    if (d.theme_name.present) {
      map['theme_name'] = Variable<String, StringType>(d.theme_name.value);
    }
    return map;
  }

  @override
  $ThemePrefsTable createAlias(String alias) {
    return $ThemePrefsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ThemePrefsTable _themePrefs;
  $ThemePrefsTable get themePrefs => _themePrefs ??= $ThemePrefsTable(this);
  @override
  List<TableInfo> get allTables => [themePrefs];
}
