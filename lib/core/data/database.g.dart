// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AppUserTableTable extends AppUserTable
    with TableInfo<$AppUserTableTable, AppUserRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppUserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userNameMeta = const VerificationMeta(
    'userName',
  );
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
    'user_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasCompletedInitialSetupMeta =
      const VerificationMeta('hasCompletedInitialSetup');
  @override
  late final GeneratedColumn<bool> hasCompletedInitialSetup =
      GeneratedColumn<bool>(
        'has_completed_initial_setup',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_completed_initial_setup" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _userWeightMeta = const VerificationMeta(
    'userWeight',
  );
  @override
  late final GeneratedColumn<double> userWeight = GeneratedColumn<double>(
    'user_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userName,
    createdAt,
    hasCompletedInitialSetup,
    userWeight,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_user_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppUserRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(
        _userNameMeta,
        userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta),
      );
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('has_completed_initial_setup')) {
      context.handle(
        _hasCompletedInitialSetupMeta,
        hasCompletedInitialSetup.isAcceptableOrUnknown(
          data['has_completed_initial_setup']!,
          _hasCompletedInitialSetupMeta,
        ),
      );
    }
    if (data.containsKey('user_weight')) {
      context.handle(
        _userWeightMeta,
        userWeight.isAcceptableOrUnknown(data['user_weight']!, _userWeightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppUserRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppUserRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      hasCompletedInitialSetup: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_completed_initial_setup'],
      )!,
      userWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}user_weight'],
      ),
    );
  }

  @override
  $AppUserTableTable createAlias(String alias) {
    return $AppUserTableTable(attachedDatabase, alias);
  }
}

class AppUserRow extends DataClass implements Insertable<AppUserRow> {
  final String id;
  final String userName;
  final int createdAt;
  final bool hasCompletedInitialSetup;

  /// Body weight in lbs (canonical imperial), nullable until the user sets it.
  final double? userWeight;
  const AppUserRow({
    required this.id,
    required this.userName,
    required this.createdAt,
    required this.hasCompletedInitialSetup,
    this.userWeight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_name'] = Variable<String>(userName);
    map['created_at'] = Variable<int>(createdAt);
    map['has_completed_initial_setup'] = Variable<bool>(
      hasCompletedInitialSetup,
    );
    if (!nullToAbsent || userWeight != null) {
      map['user_weight'] = Variable<double>(userWeight);
    }
    return map;
  }

  AppUserTableCompanion toCompanion(bool nullToAbsent) {
    return AppUserTableCompanion(
      id: Value(id),
      userName: Value(userName),
      createdAt: Value(createdAt),
      hasCompletedInitialSetup: Value(hasCompletedInitialSetup),
      userWeight: userWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(userWeight),
    );
  }

  factory AppUserRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppUserRow(
      id: serializer.fromJson<String>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      hasCompletedInitialSetup: serializer.fromJson<bool>(
        json['hasCompletedInitialSetup'],
      ),
      userWeight: serializer.fromJson<double?>(json['userWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userName': serializer.toJson<String>(userName),
      'createdAt': serializer.toJson<int>(createdAt),
      'hasCompletedInitialSetup': serializer.toJson<bool>(
        hasCompletedInitialSetup,
      ),
      'userWeight': serializer.toJson<double?>(userWeight),
    };
  }

  AppUserRow copyWith({
    String? id,
    String? userName,
    int? createdAt,
    bool? hasCompletedInitialSetup,
    Value<double?> userWeight = const Value.absent(),
  }) => AppUserRow(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    createdAt: createdAt ?? this.createdAt,
    hasCompletedInitialSetup:
        hasCompletedInitialSetup ?? this.hasCompletedInitialSetup,
    userWeight: userWeight.present ? userWeight.value : this.userWeight,
  );
  AppUserRow copyWithCompanion(AppUserTableCompanion data) {
    return AppUserRow(
      id: data.id.present ? data.id.value : this.id,
      userName: data.userName.present ? data.userName.value : this.userName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      hasCompletedInitialSetup: data.hasCompletedInitialSetup.present
          ? data.hasCompletedInitialSetup.value
          : this.hasCompletedInitialSetup,
      userWeight: data.userWeight.present
          ? data.userWeight.value
          : this.userWeight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppUserRow(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('createdAt: $createdAt, ')
          ..write('hasCompletedInitialSetup: $hasCompletedInitialSetup, ')
          ..write('userWeight: $userWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userName,
    createdAt,
    hasCompletedInitialSetup,
    userWeight,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUserRow &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.createdAt == this.createdAt &&
          other.hasCompletedInitialSetup == this.hasCompletedInitialSetup &&
          other.userWeight == this.userWeight);
}

class AppUserTableCompanion extends UpdateCompanion<AppUserRow> {
  final Value<String> id;
  final Value<String> userName;
  final Value<int> createdAt;
  final Value<bool> hasCompletedInitialSetup;
  final Value<double?> userWeight;
  final Value<int> rowid;
  const AppUserTableCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.hasCompletedInitialSetup = const Value.absent(),
    this.userWeight = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppUserTableCompanion.insert({
    required String id,
    required String userName,
    required int createdAt,
    this.hasCompletedInitialSetup = const Value.absent(),
    this.userWeight = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userName = Value(userName),
       createdAt = Value(createdAt);
  static Insertable<AppUserRow> custom({
    Expression<String>? id,
    Expression<String>? userName,
    Expression<int>? createdAt,
    Expression<bool>? hasCompletedInitialSetup,
    Expression<double>? userWeight,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (createdAt != null) 'created_at': createdAt,
      if (hasCompletedInitialSetup != null)
        'has_completed_initial_setup': hasCompletedInitialSetup,
      if (userWeight != null) 'user_weight': userWeight,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppUserTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userName,
    Value<int>? createdAt,
    Value<bool>? hasCompletedInitialSetup,
    Value<double?>? userWeight,
    Value<int>? rowid,
  }) {
    return AppUserTableCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      createdAt: createdAt ?? this.createdAt,
      hasCompletedInitialSetup:
          hasCompletedInitialSetup ?? this.hasCompletedInitialSetup,
      userWeight: userWeight ?? this.userWeight,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (hasCompletedInitialSetup.present) {
      map['has_completed_initial_setup'] = Variable<bool>(
        hasCompletedInitialSetup.value,
      );
    }
    if (userWeight.present) {
      map['user_weight'] = Variable<double>(userWeight.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppUserTableCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('createdAt: $createdAt, ')
          ..write('hasCompletedInitialSetup: $hasCompletedInitialSetup, ')
          ..write('userWeight: $userWeight, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppMetadataTableTable extends AppMetadataTable
    with TableInfo<$AppMetadataTableTable, AppMetadataRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppMetadataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dataKeyMeta = const VerificationMeta(
    'dataKey',
  );
  @override
  late final GeneratedColumn<String> dataKey = GeneratedColumn<String>(
    'data_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataValueMeta = const VerificationMeta(
    'dataValue',
  );
  @override
  late final GeneratedColumn<String> dataValue = GeneratedColumn<String>(
    'data_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [dataKey, dataValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_metadata_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppMetadataRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('data_key')) {
      context.handle(
        _dataKeyMeta,
        dataKey.isAcceptableOrUnknown(data['data_key']!, _dataKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_dataKeyMeta);
    }
    if (data.containsKey('data_value')) {
      context.handle(
        _dataValueMeta,
        dataValue.isAcceptableOrUnknown(data['data_value']!, _dataValueMeta),
      );
    } else if (isInserting) {
      context.missing(_dataValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dataKey};
  @override
  AppMetadataRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppMetadataRow(
      dataKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_key'],
      )!,
      dataValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_value'],
      )!,
    );
  }

  @override
  $AppMetadataTableTable createAlias(String alias) {
    return $AppMetadataTableTable(attachedDatabase, alias);
  }
}

class AppMetadataRow extends DataClass implements Insertable<AppMetadataRow> {
  final String dataKey;
  final String dataValue;
  const AppMetadataRow({required this.dataKey, required this.dataValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['data_key'] = Variable<String>(dataKey);
    map['data_value'] = Variable<String>(dataValue);
    return map;
  }

  AppMetadataTableCompanion toCompanion(bool nullToAbsent) {
    return AppMetadataTableCompanion(
      dataKey: Value(dataKey),
      dataValue: Value(dataValue),
    );
  }

  factory AppMetadataRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppMetadataRow(
      dataKey: serializer.fromJson<String>(json['dataKey']),
      dataValue: serializer.fromJson<String>(json['dataValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dataKey': serializer.toJson<String>(dataKey),
      'dataValue': serializer.toJson<String>(dataValue),
    };
  }

  AppMetadataRow copyWith({String? dataKey, String? dataValue}) =>
      AppMetadataRow(
        dataKey: dataKey ?? this.dataKey,
        dataValue: dataValue ?? this.dataValue,
      );
  AppMetadataRow copyWithCompanion(AppMetadataTableCompanion data) {
    return AppMetadataRow(
      dataKey: data.dataKey.present ? data.dataKey.value : this.dataKey,
      dataValue: data.dataValue.present ? data.dataValue.value : this.dataValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppMetadataRow(')
          ..write('dataKey: $dataKey, ')
          ..write('dataValue: $dataValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dataKey, dataValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppMetadataRow &&
          other.dataKey == this.dataKey &&
          other.dataValue == this.dataValue);
}

class AppMetadataTableCompanion extends UpdateCompanion<AppMetadataRow> {
  final Value<String> dataKey;
  final Value<String> dataValue;
  final Value<int> rowid;
  const AppMetadataTableCompanion({
    this.dataKey = const Value.absent(),
    this.dataValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppMetadataTableCompanion.insert({
    required String dataKey,
    required String dataValue,
    this.rowid = const Value.absent(),
  }) : dataKey = Value(dataKey),
       dataValue = Value(dataValue);
  static Insertable<AppMetadataRow> custom({
    Expression<String>? dataKey,
    Expression<String>? dataValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dataKey != null) 'data_key': dataKey,
      if (dataValue != null) 'data_value': dataValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppMetadataTableCompanion copyWith({
    Value<String>? dataKey,
    Value<String>? dataValue,
    Value<int>? rowid,
  }) {
    return AppMetadataTableCompanion(
      dataKey: dataKey ?? this.dataKey,
      dataValue: dataValue ?? this.dataValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dataKey.present) {
      map['data_key'] = Variable<String>(dataKey.value);
    }
    if (dataValue.present) {
      map['data_value'] = Variable<String>(dataValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppMetadataTableCompanion(')
          ..write('dataKey: $dataKey, ')
          ..write('dataValue: $dataValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseTableTable extends ExerciseTable
    with TableInfo<$ExerciseTableTable, ExerciseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyPartMeta = const VerificationMeta(
    'bodyPart',
  );
  @override
  late final GeneratedColumn<String> bodyPart = GeneratedColumn<String>(
    'body_part',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFoundationMeta = const VerificationMeta(
    'isFoundation',
  );
  @override
  late final GeneratedColumn<bool> isFoundation = GeneratedColumn<bool>(
    'is_foundation',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_foundation" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    name,
    category,
    bodyPart,
    thumbnailPath,
    createdAt,
    isFoundation,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('body_part')) {
      context.handle(
        _bodyPartMeta,
        bodyPart.isAcceptableOrUnknown(data['body_part']!, _bodyPartMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyPartMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_foundation')) {
      context.handle(
        _isFoundationMeta,
        isFoundation.isAcceptableOrUnknown(
          data['is_foundation']!,
          _isFoundationMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {ownerUserId, name},
  ];
  @override
  ExerciseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      bodyPart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_part'],
      )!,
      thumbnailPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      isFoundation: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_foundation'],
      )!,
    );
  }

  @override
  $ExerciseTableTable createAlias(String alias) {
    return $ExerciseTableTable(attachedDatabase, alias);
  }
}

class ExerciseRow extends DataClass implements Insertable<ExerciseRow> {
  final String id;
  final String? ownerUserId;
  final String name;

  /// ExerciseCategory.name: 'strength' | 'cardio'.
  final String category;

  /// BodyPart.name.
  final String bodyPart;
  final String? thumbnailPath;
  final int createdAt;
  final bool isFoundation;
  const ExerciseRow({
    required this.id,
    this.ownerUserId,
    required this.name,
    required this.category,
    required this.bodyPart,
    this.thumbnailPath,
    required this.createdAt,
    required this.isFoundation,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['body_part'] = Variable<String>(bodyPart);
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['is_foundation'] = Variable<bool>(isFoundation);
    return map;
  }

  ExerciseTableCompanion toCompanion(bool nullToAbsent) {
    return ExerciseTableCompanion(
      id: Value(id),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      name: Value(name),
      category: Value(category),
      bodyPart: Value(bodyPart),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
      createdAt: Value(createdAt),
      isFoundation: Value(isFoundation),
    );
  }

  factory ExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseRow(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      bodyPart: serializer.fromJson<String>(json['bodyPart']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnailPath']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      isFoundation: serializer.fromJson<bool>(json['isFoundation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'bodyPart': serializer.toJson<String>(bodyPart),
      'thumbnailPath': serializer.toJson<String?>(thumbnailPath),
      'createdAt': serializer.toJson<int>(createdAt),
      'isFoundation': serializer.toJson<bool>(isFoundation),
    };
  }

  ExerciseRow copyWith({
    String? id,
    Value<String?> ownerUserId = const Value.absent(),
    String? name,
    String? category,
    String? bodyPart,
    Value<String?> thumbnailPath = const Value.absent(),
    int? createdAt,
    bool? isFoundation,
  }) => ExerciseRow(
    id: id ?? this.id,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    name: name ?? this.name,
    category: category ?? this.category,
    bodyPart: bodyPart ?? this.bodyPart,
    thumbnailPath: thumbnailPath.present
        ? thumbnailPath.value
        : this.thumbnailPath,
    createdAt: createdAt ?? this.createdAt,
    isFoundation: isFoundation ?? this.isFoundation,
  );
  ExerciseRow copyWithCompanion(ExerciseTableCompanion data) {
    return ExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      bodyPart: data.bodyPart.present ? data.bodyPart.value : this.bodyPart,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isFoundation: data.isFoundation.present
          ? data.isFoundation.value
          : this.isFoundation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRow(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('bodyPart: $bodyPart, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('isFoundation: $isFoundation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    name,
    category,
    bodyPart,
    thumbnailPath,
    createdAt,
    isFoundation,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseRow &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.name == this.name &&
          other.category == this.category &&
          other.bodyPart == this.bodyPart &&
          other.thumbnailPath == this.thumbnailPath &&
          other.createdAt == this.createdAt &&
          other.isFoundation == this.isFoundation);
}

class ExerciseTableCompanion extends UpdateCompanion<ExerciseRow> {
  final Value<String> id;
  final Value<String?> ownerUserId;
  final Value<String> name;
  final Value<String> category;
  final Value<String> bodyPart;
  final Value<String?> thumbnailPath;
  final Value<int> createdAt;
  final Value<bool> isFoundation;
  final Value<int> rowid;
  const ExerciseTableCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.bodyPart = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isFoundation = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseTableCompanion.insert({
    required String id,
    this.ownerUserId = const Value.absent(),
    required String name,
    required String category,
    required String bodyPart,
    this.thumbnailPath = const Value.absent(),
    required int createdAt,
    this.isFoundation = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       bodyPart = Value(bodyPart),
       createdAt = Value(createdAt);
  static Insertable<ExerciseRow> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? bodyPart,
    Expression<String>? thumbnailPath,
    Expression<int>? createdAt,
    Expression<bool>? isFoundation,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (bodyPart != null) 'body_part': bodyPart,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (createdAt != null) 'created_at': createdAt,
      if (isFoundation != null) 'is_foundation': isFoundation,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? ownerUserId,
    Value<String>? name,
    Value<String>? category,
    Value<String>? bodyPart,
    Value<String?>? thumbnailPath,
    Value<int>? createdAt,
    Value<bool>? isFoundation,
    Value<int>? rowid,
  }) {
    return ExerciseTableCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      name: name ?? this.name,
      category: category ?? this.category,
      bodyPart: bodyPart ?? this.bodyPart,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      createdAt: createdAt ?? this.createdAt,
      isFoundation: isFoundation ?? this.isFoundation,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (bodyPart.present) {
      map['body_part'] = Variable<String>(bodyPart.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (isFoundation.present) {
      map['is_foundation'] = Variable<bool>(isFoundation.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseTableCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('bodyPart: $bodyPart, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('isFoundation: $isFoundation, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserExerciseTableTable extends UserExerciseTable
    with TableInfo<$UserExerciseTableTable, UserExerciseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserExerciseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastPerformedAtMeta = const VerificationMeta(
    'lastPerformedAt',
  );
  @override
  late final GeneratedColumn<int> lastPerformedAt = GeneratedColumn<int>(
    'last_performed_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedOnMeta = const VerificationMeta(
    'deletedOn',
  );
  @override
  late final GeneratedColumn<int> deletedOn = GeneratedColumn<int>(
    'deleted_on',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    exerciseId,
    isFavorite,
    lastPerformedAt,
    createdAt,
    notes,
    deletedOn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_exercise_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserExerciseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('last_performed_at')) {
      context.handle(
        _lastPerformedAtMeta,
        lastPerformedAt.isAcceptableOrUnknown(
          data['last_performed_at']!,
          _lastPerformedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('deleted_on')) {
      context.handle(
        _deletedOnMeta,
        deletedOn.isAcceptableOrUnknown(data['deleted_on']!, _deletedOnMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, exerciseId},
  ];
  @override
  UserExerciseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserExerciseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      lastPerformedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_performed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      deletedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_on'],
      ),
    );
  }

  @override
  $UserExerciseTableTable createAlias(String alias) {
    return $UserExerciseTableTable(attachedDatabase, alias);
  }
}

class UserExerciseRow extends DataClass implements Insertable<UserExerciseRow> {
  final String id;
  final String userId;
  final String exerciseId;
  final bool isFavorite;
  final int? lastPerformedAt;
  final int createdAt;
  final String? notes;

  /// Soft delete — history that references this row stays intact.
  final int? deletedOn;
  const UserExerciseRow({
    required this.id,
    required this.userId,
    required this.exerciseId,
    required this.isFavorite,
    this.lastPerformedAt,
    required this.createdAt,
    this.notes,
    this.deletedOn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || lastPerformedAt != null) {
      map['last_performed_at'] = Variable<int>(lastPerformedAt);
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || deletedOn != null) {
      map['deleted_on'] = Variable<int>(deletedOn);
    }
    return map;
  }

  UserExerciseTableCompanion toCompanion(bool nullToAbsent) {
    return UserExerciseTableCompanion(
      id: Value(id),
      userId: Value(userId),
      exerciseId: Value(exerciseId),
      isFavorite: Value(isFavorite),
      lastPerformedAt: lastPerformedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPerformedAt),
      createdAt: Value(createdAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      deletedOn: deletedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedOn),
    );
  }

  factory UserExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserExerciseRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      lastPerformedAt: serializer.fromJson<int?>(json['lastPerformedAt']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      deletedOn: serializer.fromJson<int?>(json['deletedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'lastPerformedAt': serializer.toJson<int?>(lastPerformedAt),
      'createdAt': serializer.toJson<int>(createdAt),
      'notes': serializer.toJson<String?>(notes),
      'deletedOn': serializer.toJson<int?>(deletedOn),
    };
  }

  UserExerciseRow copyWith({
    String? id,
    String? userId,
    String? exerciseId,
    bool? isFavorite,
    Value<int?> lastPerformedAt = const Value.absent(),
    int? createdAt,
    Value<String?> notes = const Value.absent(),
    Value<int?> deletedOn = const Value.absent(),
  }) => UserExerciseRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    exerciseId: exerciseId ?? this.exerciseId,
    isFavorite: isFavorite ?? this.isFavorite,
    lastPerformedAt: lastPerformedAt.present
        ? lastPerformedAt.value
        : this.lastPerformedAt,
    createdAt: createdAt ?? this.createdAt,
    notes: notes.present ? notes.value : this.notes,
    deletedOn: deletedOn.present ? deletedOn.value : this.deletedOn,
  );
  UserExerciseRow copyWithCompanion(UserExerciseTableCompanion data) {
    return UserExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      lastPerformedAt: data.lastPerformedAt.present
          ? data.lastPerformedAt.value
          : this.lastPerformedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      deletedOn: data.deletedOn.present ? data.deletedOn.value : this.deletedOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserExerciseRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('lastPerformedAt: $lastPerformedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('notes: $notes, ')
          ..write('deletedOn: $deletedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    exerciseId,
    isFavorite,
    lastPerformedAt,
    createdAt,
    notes,
    deletedOn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserExerciseRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exerciseId == this.exerciseId &&
          other.isFavorite == this.isFavorite &&
          other.lastPerformedAt == this.lastPerformedAt &&
          other.createdAt == this.createdAt &&
          other.notes == this.notes &&
          other.deletedOn == this.deletedOn);
}

class UserExerciseTableCompanion extends UpdateCompanion<UserExerciseRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> exerciseId;
  final Value<bool> isFavorite;
  final Value<int?> lastPerformedAt;
  final Value<int> createdAt;
  final Value<String?> notes;
  final Value<int?> deletedOn;
  final Value<int> rowid;
  const UserExerciseTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.lastPerformedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.deletedOn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserExerciseTableCompanion.insert({
    required String id,
    required String userId,
    required String exerciseId,
    this.isFavorite = const Value.absent(),
    this.lastPerformedAt = const Value.absent(),
    required int createdAt,
    this.notes = const Value.absent(),
    this.deletedOn = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       exerciseId = Value(exerciseId),
       createdAt = Value(createdAt);
  static Insertable<UserExerciseRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? exerciseId,
    Expression<bool>? isFavorite,
    Expression<int>? lastPerformedAt,
    Expression<int>? createdAt,
    Expression<String>? notes,
    Expression<int>? deletedOn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (lastPerformedAt != null) 'last_performed_at': lastPerformedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (notes != null) 'notes': notes,
      if (deletedOn != null) 'deleted_on': deletedOn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserExerciseTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? exerciseId,
    Value<bool>? isFavorite,
    Value<int?>? lastPerformedAt,
    Value<int>? createdAt,
    Value<String?>? notes,
    Value<int?>? deletedOn,
    Value<int>? rowid,
  }) {
    return UserExerciseTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exerciseId: exerciseId ?? this.exerciseId,
      isFavorite: isFavorite ?? this.isFavorite,
      lastPerformedAt: lastPerformedAt ?? this.lastPerformedAt,
      createdAt: createdAt ?? this.createdAt,
      notes: notes ?? this.notes,
      deletedOn: deletedOn ?? this.deletedOn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (lastPerformedAt.present) {
      map['last_performed_at'] = Variable<int>(lastPerformedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (deletedOn.present) {
      map['deleted_on'] = Variable<int>(deletedOn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserExerciseTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('lastPerformedAt: $lastPerformedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('notes: $notes, ')
          ..write('deletedOn: $deletedOn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StrengthProfileTableTable extends StrengthProfileTable
    with TableInfo<$StrengthProfileTableTable, StrengthProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StrengthProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _strengthModalityMeta = const VerificationMeta(
    'strengthModality',
  );
  @override
  late final GeneratedColumn<String> strengthModality = GeneratedColumn<String>(
    'strength_modality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baselineWeightMeta = const VerificationMeta(
    'baselineWeight',
  );
  @override
  late final GeneratedColumn<double> baselineWeight = GeneratedColumn<double>(
    'baseline_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baselineRepsMeta = const VerificationMeta(
    'baselineReps',
  );
  @override
  late final GeneratedColumn<int> baselineReps = GeneratedColumn<int>(
    'baseline_reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baselineDurationSecondsMeta =
      const VerificationMeta('baselineDurationSeconds');
  @override
  late final GeneratedColumn<int> baselineDurationSeconds =
      GeneratedColumn<int>(
        'baseline_duration_seconds',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _volumeMultiplierMeta = const VerificationMeta(
    'volumeMultiplier',
  );
  @override
  late final GeneratedColumn<double> volumeMultiplier = GeneratedColumn<double>(
    'volume_multiplier',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userExerciseId,
    strengthModality,
    baselineWeight,
    baselineReps,
    baselineDurationSeconds,
    volumeMultiplier,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strength_profile_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StrengthProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('strength_modality')) {
      context.handle(
        _strengthModalityMeta,
        strengthModality.isAcceptableOrUnknown(
          data['strength_modality']!,
          _strengthModalityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_strengthModalityMeta);
    }
    if (data.containsKey('baseline_weight')) {
      context.handle(
        _baselineWeightMeta,
        baselineWeight.isAcceptableOrUnknown(
          data['baseline_weight']!,
          _baselineWeightMeta,
        ),
      );
    }
    if (data.containsKey('baseline_reps')) {
      context.handle(
        _baselineRepsMeta,
        baselineReps.isAcceptableOrUnknown(
          data['baseline_reps']!,
          _baselineRepsMeta,
        ),
      );
    }
    if (data.containsKey('baseline_duration_seconds')) {
      context.handle(
        _baselineDurationSecondsMeta,
        baselineDurationSeconds.isAcceptableOrUnknown(
          data['baseline_duration_seconds']!,
          _baselineDurationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('volume_multiplier')) {
      context.handle(
        _volumeMultiplierMeta,
        volumeMultiplier.isAcceptableOrUnknown(
          data['volume_multiplier']!,
          _volumeMultiplierMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userExerciseId};
  @override
  StrengthProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StrengthProfileRow(
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      strengthModality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength_modality'],
      )!,
      baselineWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}baseline_weight'],
      ),
      baselineReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baseline_reps'],
      ),
      baselineDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baseline_duration_seconds'],
      ),
      volumeMultiplier: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume_multiplier'],
      )!,
    );
  }

  @override
  $StrengthProfileTableTable createAlias(String alias) {
    return $StrengthProfileTableTable(attachedDatabase, alias);
  }
}

class StrengthProfileRow extends DataClass
    implements Insertable<StrengthProfileRow> {
  final String userExerciseId;

  /// StrengthModality.name.
  final String strengthModality;
  final double? baselineWeight;
  final int? baselineReps;
  final int? baselineDurationSeconds;
  final double volumeMultiplier;
  const StrengthProfileRow({
    required this.userExerciseId,
    required this.strengthModality,
    this.baselineWeight,
    this.baselineReps,
    this.baselineDurationSeconds,
    required this.volumeMultiplier,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['strength_modality'] = Variable<String>(strengthModality);
    if (!nullToAbsent || baselineWeight != null) {
      map['baseline_weight'] = Variable<double>(baselineWeight);
    }
    if (!nullToAbsent || baselineReps != null) {
      map['baseline_reps'] = Variable<int>(baselineReps);
    }
    if (!nullToAbsent || baselineDurationSeconds != null) {
      map['baseline_duration_seconds'] = Variable<int>(baselineDurationSeconds);
    }
    map['volume_multiplier'] = Variable<double>(volumeMultiplier);
    return map;
  }

  StrengthProfileTableCompanion toCompanion(bool nullToAbsent) {
    return StrengthProfileTableCompanion(
      userExerciseId: Value(userExerciseId),
      strengthModality: Value(strengthModality),
      baselineWeight: baselineWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineWeight),
      baselineReps: baselineReps == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineReps),
      baselineDurationSeconds: baselineDurationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineDurationSeconds),
      volumeMultiplier: Value(volumeMultiplier),
    );
  }

  factory StrengthProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StrengthProfileRow(
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      strengthModality: serializer.fromJson<String>(json['strengthModality']),
      baselineWeight: serializer.fromJson<double?>(json['baselineWeight']),
      baselineReps: serializer.fromJson<int?>(json['baselineReps']),
      baselineDurationSeconds: serializer.fromJson<int?>(
        json['baselineDurationSeconds'],
      ),
      volumeMultiplier: serializer.fromJson<double>(json['volumeMultiplier']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'strengthModality': serializer.toJson<String>(strengthModality),
      'baselineWeight': serializer.toJson<double?>(baselineWeight),
      'baselineReps': serializer.toJson<int?>(baselineReps),
      'baselineDurationSeconds': serializer.toJson<int?>(
        baselineDurationSeconds,
      ),
      'volumeMultiplier': serializer.toJson<double>(volumeMultiplier),
    };
  }

  StrengthProfileRow copyWith({
    String? userExerciseId,
    String? strengthModality,
    Value<double?> baselineWeight = const Value.absent(),
    Value<int?> baselineReps = const Value.absent(),
    Value<int?> baselineDurationSeconds = const Value.absent(),
    double? volumeMultiplier,
  }) => StrengthProfileRow(
    userExerciseId: userExerciseId ?? this.userExerciseId,
    strengthModality: strengthModality ?? this.strengthModality,
    baselineWeight: baselineWeight.present
        ? baselineWeight.value
        : this.baselineWeight,
    baselineReps: baselineReps.present ? baselineReps.value : this.baselineReps,
    baselineDurationSeconds: baselineDurationSeconds.present
        ? baselineDurationSeconds.value
        : this.baselineDurationSeconds,
    volumeMultiplier: volumeMultiplier ?? this.volumeMultiplier,
  );
  StrengthProfileRow copyWithCompanion(StrengthProfileTableCompanion data) {
    return StrengthProfileRow(
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      strengthModality: data.strengthModality.present
          ? data.strengthModality.value
          : this.strengthModality,
      baselineWeight: data.baselineWeight.present
          ? data.baselineWeight.value
          : this.baselineWeight,
      baselineReps: data.baselineReps.present
          ? data.baselineReps.value
          : this.baselineReps,
      baselineDurationSeconds: data.baselineDurationSeconds.present
          ? data.baselineDurationSeconds.value
          : this.baselineDurationSeconds,
      volumeMultiplier: data.volumeMultiplier.present
          ? data.volumeMultiplier.value
          : this.volumeMultiplier,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StrengthProfileRow(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('strengthModality: $strengthModality, ')
          ..write('baselineWeight: $baselineWeight, ')
          ..write('baselineReps: $baselineReps, ')
          ..write('baselineDurationSeconds: $baselineDurationSeconds, ')
          ..write('volumeMultiplier: $volumeMultiplier')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userExerciseId,
    strengthModality,
    baselineWeight,
    baselineReps,
    baselineDurationSeconds,
    volumeMultiplier,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StrengthProfileRow &&
          other.userExerciseId == this.userExerciseId &&
          other.strengthModality == this.strengthModality &&
          other.baselineWeight == this.baselineWeight &&
          other.baselineReps == this.baselineReps &&
          other.baselineDurationSeconds == this.baselineDurationSeconds &&
          other.volumeMultiplier == this.volumeMultiplier);
}

class StrengthProfileTableCompanion
    extends UpdateCompanion<StrengthProfileRow> {
  final Value<String> userExerciseId;
  final Value<String> strengthModality;
  final Value<double?> baselineWeight;
  final Value<int?> baselineReps;
  final Value<int?> baselineDurationSeconds;
  final Value<double> volumeMultiplier;
  final Value<int> rowid;
  const StrengthProfileTableCompanion({
    this.userExerciseId = const Value.absent(),
    this.strengthModality = const Value.absent(),
    this.baselineWeight = const Value.absent(),
    this.baselineReps = const Value.absent(),
    this.baselineDurationSeconds = const Value.absent(),
    this.volumeMultiplier = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StrengthProfileTableCompanion.insert({
    required String userExerciseId,
    required String strengthModality,
    this.baselineWeight = const Value.absent(),
    this.baselineReps = const Value.absent(),
    this.baselineDurationSeconds = const Value.absent(),
    this.volumeMultiplier = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userExerciseId = Value(userExerciseId),
       strengthModality = Value(strengthModality);
  static Insertable<StrengthProfileRow> custom({
    Expression<String>? userExerciseId,
    Expression<String>? strengthModality,
    Expression<double>? baselineWeight,
    Expression<int>? baselineReps,
    Expression<int>? baselineDurationSeconds,
    Expression<double>? volumeMultiplier,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (strengthModality != null) 'strength_modality': strengthModality,
      if (baselineWeight != null) 'baseline_weight': baselineWeight,
      if (baselineReps != null) 'baseline_reps': baselineReps,
      if (baselineDurationSeconds != null)
        'baseline_duration_seconds': baselineDurationSeconds,
      if (volumeMultiplier != null) 'volume_multiplier': volumeMultiplier,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StrengthProfileTableCompanion copyWith({
    Value<String>? userExerciseId,
    Value<String>? strengthModality,
    Value<double?>? baselineWeight,
    Value<int?>? baselineReps,
    Value<int?>? baselineDurationSeconds,
    Value<double>? volumeMultiplier,
    Value<int>? rowid,
  }) {
    return StrengthProfileTableCompanion(
      userExerciseId: userExerciseId ?? this.userExerciseId,
      strengthModality: strengthModality ?? this.strengthModality,
      baselineWeight: baselineWeight ?? this.baselineWeight,
      baselineReps: baselineReps ?? this.baselineReps,
      baselineDurationSeconds:
          baselineDurationSeconds ?? this.baselineDurationSeconds,
      volumeMultiplier: volumeMultiplier ?? this.volumeMultiplier,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (strengthModality.present) {
      map['strength_modality'] = Variable<String>(strengthModality.value);
    }
    if (baselineWeight.present) {
      map['baseline_weight'] = Variable<double>(baselineWeight.value);
    }
    if (baselineReps.present) {
      map['baseline_reps'] = Variable<int>(baselineReps.value);
    }
    if (baselineDurationSeconds.present) {
      map['baseline_duration_seconds'] = Variable<int>(
        baselineDurationSeconds.value,
      );
    }
    if (volumeMultiplier.present) {
      map['volume_multiplier'] = Variable<double>(volumeMultiplier.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StrengthProfileTableCompanion(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('strengthModality: $strengthModality, ')
          ..write('baselineWeight: $baselineWeight, ')
          ..write('baselineReps: $baselineReps, ')
          ..write('baselineDurationSeconds: $baselineDurationSeconds, ')
          ..write('volumeMultiplier: $volumeMultiplier, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardioProfileTableTable extends CardioProfileTable
    with TableInfo<$CardioProfileTableTable, CardioProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardioProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _cardioModalityMeta = const VerificationMeta(
    'cardioModality',
  );
  @override
  late final GeneratedColumn<String> cardioModality = GeneratedColumn<String>(
    'cardio_modality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baselineSpeedMeta = const VerificationMeta(
    'baselineSpeed',
  );
  @override
  late final GeneratedColumn<double> baselineSpeed = GeneratedColumn<double>(
    'baseline_speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baselineDistanceMeta = const VerificationMeta(
    'baselineDistance',
  );
  @override
  late final GeneratedColumn<double> baselineDistance = GeneratedColumn<double>(
    'baseline_distance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _baselineDurationSecondsMeta =
      const VerificationMeta('baselineDurationSeconds');
  @override
  late final GeneratedColumn<int> baselineDurationSeconds =
      GeneratedColumn<int>(
        'baseline_duration_seconds',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _baselineRepsMeta = const VerificationMeta(
    'baselineReps',
  );
  @override
  late final GeneratedColumn<int> baselineReps = GeneratedColumn<int>(
    'baseline_reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userExerciseId,
    cardioModality,
    baselineSpeed,
    baselineDistance,
    baselineDurationSeconds,
    baselineReps,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cardio_profile_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardioProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('cardio_modality')) {
      context.handle(
        _cardioModalityMeta,
        cardioModality.isAcceptableOrUnknown(
          data['cardio_modality']!,
          _cardioModalityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cardioModalityMeta);
    }
    if (data.containsKey('baseline_speed')) {
      context.handle(
        _baselineSpeedMeta,
        baselineSpeed.isAcceptableOrUnknown(
          data['baseline_speed']!,
          _baselineSpeedMeta,
        ),
      );
    }
    if (data.containsKey('baseline_distance')) {
      context.handle(
        _baselineDistanceMeta,
        baselineDistance.isAcceptableOrUnknown(
          data['baseline_distance']!,
          _baselineDistanceMeta,
        ),
      );
    }
    if (data.containsKey('baseline_duration_seconds')) {
      context.handle(
        _baselineDurationSecondsMeta,
        baselineDurationSeconds.isAcceptableOrUnknown(
          data['baseline_duration_seconds']!,
          _baselineDurationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('baseline_reps')) {
      context.handle(
        _baselineRepsMeta,
        baselineReps.isAcceptableOrUnknown(
          data['baseline_reps']!,
          _baselineRepsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userExerciseId};
  @override
  CardioProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardioProfileRow(
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      cardioModality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cardio_modality'],
      )!,
      baselineSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}baseline_speed'],
      ),
      baselineDistance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}baseline_distance'],
      ),
      baselineDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baseline_duration_seconds'],
      ),
      baselineReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baseline_reps'],
      ),
    );
  }

  @override
  $CardioProfileTableTable createAlias(String alias) {
    return $CardioProfileTableTable(attachedDatabase, alias);
  }
}

class CardioProfileRow extends DataClass
    implements Insertable<CardioProfileRow> {
  final String userExerciseId;

  /// CardioModality.name.
  final String cardioModality;
  final double? baselineSpeed;
  final double? baselineDistance;
  final int? baselineDurationSeconds;
  final int? baselineReps;
  const CardioProfileRow({
    required this.userExerciseId,
    required this.cardioModality,
    this.baselineSpeed,
    this.baselineDistance,
    this.baselineDurationSeconds,
    this.baselineReps,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['cardio_modality'] = Variable<String>(cardioModality);
    if (!nullToAbsent || baselineSpeed != null) {
      map['baseline_speed'] = Variable<double>(baselineSpeed);
    }
    if (!nullToAbsent || baselineDistance != null) {
      map['baseline_distance'] = Variable<double>(baselineDistance);
    }
    if (!nullToAbsent || baselineDurationSeconds != null) {
      map['baseline_duration_seconds'] = Variable<int>(baselineDurationSeconds);
    }
    if (!nullToAbsent || baselineReps != null) {
      map['baseline_reps'] = Variable<int>(baselineReps);
    }
    return map;
  }

  CardioProfileTableCompanion toCompanion(bool nullToAbsent) {
    return CardioProfileTableCompanion(
      userExerciseId: Value(userExerciseId),
      cardioModality: Value(cardioModality),
      baselineSpeed: baselineSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineSpeed),
      baselineDistance: baselineDistance == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineDistance),
      baselineDurationSeconds: baselineDurationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineDurationSeconds),
      baselineReps: baselineReps == null && nullToAbsent
          ? const Value.absent()
          : Value(baselineReps),
    );
  }

  factory CardioProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardioProfileRow(
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      cardioModality: serializer.fromJson<String>(json['cardioModality']),
      baselineSpeed: serializer.fromJson<double?>(json['baselineSpeed']),
      baselineDistance: serializer.fromJson<double?>(json['baselineDistance']),
      baselineDurationSeconds: serializer.fromJson<int?>(
        json['baselineDurationSeconds'],
      ),
      baselineReps: serializer.fromJson<int?>(json['baselineReps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'cardioModality': serializer.toJson<String>(cardioModality),
      'baselineSpeed': serializer.toJson<double?>(baselineSpeed),
      'baselineDistance': serializer.toJson<double?>(baselineDistance),
      'baselineDurationSeconds': serializer.toJson<int?>(
        baselineDurationSeconds,
      ),
      'baselineReps': serializer.toJson<int?>(baselineReps),
    };
  }

  CardioProfileRow copyWith({
    String? userExerciseId,
    String? cardioModality,
    Value<double?> baselineSpeed = const Value.absent(),
    Value<double?> baselineDistance = const Value.absent(),
    Value<int?> baselineDurationSeconds = const Value.absent(),
    Value<int?> baselineReps = const Value.absent(),
  }) => CardioProfileRow(
    userExerciseId: userExerciseId ?? this.userExerciseId,
    cardioModality: cardioModality ?? this.cardioModality,
    baselineSpeed: baselineSpeed.present
        ? baselineSpeed.value
        : this.baselineSpeed,
    baselineDistance: baselineDistance.present
        ? baselineDistance.value
        : this.baselineDistance,
    baselineDurationSeconds: baselineDurationSeconds.present
        ? baselineDurationSeconds.value
        : this.baselineDurationSeconds,
    baselineReps: baselineReps.present ? baselineReps.value : this.baselineReps,
  );
  CardioProfileRow copyWithCompanion(CardioProfileTableCompanion data) {
    return CardioProfileRow(
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      cardioModality: data.cardioModality.present
          ? data.cardioModality.value
          : this.cardioModality,
      baselineSpeed: data.baselineSpeed.present
          ? data.baselineSpeed.value
          : this.baselineSpeed,
      baselineDistance: data.baselineDistance.present
          ? data.baselineDistance.value
          : this.baselineDistance,
      baselineDurationSeconds: data.baselineDurationSeconds.present
          ? data.baselineDurationSeconds.value
          : this.baselineDurationSeconds,
      baselineReps: data.baselineReps.present
          ? data.baselineReps.value
          : this.baselineReps,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardioProfileRow(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('cardioModality: $cardioModality, ')
          ..write('baselineSpeed: $baselineSpeed, ')
          ..write('baselineDistance: $baselineDistance, ')
          ..write('baselineDurationSeconds: $baselineDurationSeconds, ')
          ..write('baselineReps: $baselineReps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userExerciseId,
    cardioModality,
    baselineSpeed,
    baselineDistance,
    baselineDurationSeconds,
    baselineReps,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardioProfileRow &&
          other.userExerciseId == this.userExerciseId &&
          other.cardioModality == this.cardioModality &&
          other.baselineSpeed == this.baselineSpeed &&
          other.baselineDistance == this.baselineDistance &&
          other.baselineDurationSeconds == this.baselineDurationSeconds &&
          other.baselineReps == this.baselineReps);
}

class CardioProfileTableCompanion extends UpdateCompanion<CardioProfileRow> {
  final Value<String> userExerciseId;
  final Value<String> cardioModality;
  final Value<double?> baselineSpeed;
  final Value<double?> baselineDistance;
  final Value<int?> baselineDurationSeconds;
  final Value<int?> baselineReps;
  final Value<int> rowid;
  const CardioProfileTableCompanion({
    this.userExerciseId = const Value.absent(),
    this.cardioModality = const Value.absent(),
    this.baselineSpeed = const Value.absent(),
    this.baselineDistance = const Value.absent(),
    this.baselineDurationSeconds = const Value.absent(),
    this.baselineReps = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardioProfileTableCompanion.insert({
    required String userExerciseId,
    required String cardioModality,
    this.baselineSpeed = const Value.absent(),
    this.baselineDistance = const Value.absent(),
    this.baselineDurationSeconds = const Value.absent(),
    this.baselineReps = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userExerciseId = Value(userExerciseId),
       cardioModality = Value(cardioModality);
  static Insertable<CardioProfileRow> custom({
    Expression<String>? userExerciseId,
    Expression<String>? cardioModality,
    Expression<double>? baselineSpeed,
    Expression<double>? baselineDistance,
    Expression<int>? baselineDurationSeconds,
    Expression<int>? baselineReps,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (cardioModality != null) 'cardio_modality': cardioModality,
      if (baselineSpeed != null) 'baseline_speed': baselineSpeed,
      if (baselineDistance != null) 'baseline_distance': baselineDistance,
      if (baselineDurationSeconds != null)
        'baseline_duration_seconds': baselineDurationSeconds,
      if (baselineReps != null) 'baseline_reps': baselineReps,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardioProfileTableCompanion copyWith({
    Value<String>? userExerciseId,
    Value<String>? cardioModality,
    Value<double?>? baselineSpeed,
    Value<double?>? baselineDistance,
    Value<int?>? baselineDurationSeconds,
    Value<int?>? baselineReps,
    Value<int>? rowid,
  }) {
    return CardioProfileTableCompanion(
      userExerciseId: userExerciseId ?? this.userExerciseId,
      cardioModality: cardioModality ?? this.cardioModality,
      baselineSpeed: baselineSpeed ?? this.baselineSpeed,
      baselineDistance: baselineDistance ?? this.baselineDistance,
      baselineDurationSeconds:
          baselineDurationSeconds ?? this.baselineDurationSeconds,
      baselineReps: baselineReps ?? this.baselineReps,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (cardioModality.present) {
      map['cardio_modality'] = Variable<String>(cardioModality.value);
    }
    if (baselineSpeed.present) {
      map['baseline_speed'] = Variable<double>(baselineSpeed.value);
    }
    if (baselineDistance.present) {
      map['baseline_distance'] = Variable<double>(baselineDistance.value);
    }
    if (baselineDurationSeconds.present) {
      map['baseline_duration_seconds'] = Variable<int>(
        baselineDurationSeconds.value,
      );
    }
    if (baselineReps.present) {
      map['baseline_reps'] = Variable<int>(baselineReps.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardioProfileTableCompanion(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('cardioModality: $cardioModality, ')
          ..write('baselineSpeed: $baselineSpeed, ')
          ..write('baselineDistance: $baselineDistance, ')
          ..write('baselineDurationSeconds: $baselineDurationSeconds, ')
          ..write('baselineReps: $baselineReps, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgressionPolicyTableTable extends ProgressionPolicyTable
    with TableInfo<$ProgressionPolicyTableTable, ProgressionPolicyRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressionPolicyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _autoIncrementEnabledMeta =
      const VerificationMeta('autoIncrementEnabled');
  @override
  late final GeneratedColumn<bool> autoIncrementEnabled = GeneratedColumn<bool>(
    'auto_increment_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_increment_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _autoIncrementIntervalMeta =
      const VerificationMeta('autoIncrementInterval');
  @override
  late final GeneratedColumn<int> autoIncrementInterval = GeneratedColumn<int>(
    'auto_increment_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _weightDeltaMeta = const VerificationMeta(
    'weightDelta',
  );
  @override
  late final GeneratedColumn<double> weightDelta = GeneratedColumn<double>(
    'weight_delta',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(5.0),
  );
  static const VerificationMeta _repsDeltaMeta = const VerificationMeta(
    'repsDelta',
  );
  @override
  late final GeneratedColumn<int> repsDelta = GeneratedColumn<int>(
    'reps_delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _durationDeltaSecondsMeta =
      const VerificationMeta('durationDeltaSeconds');
  @override
  late final GeneratedColumn<int> durationDeltaSeconds = GeneratedColumn<int>(
    'duration_delta_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(15),
  );
  static const VerificationMeta _distanceDeltaMeta = const VerificationMeta(
    'distanceDelta',
  );
  @override
  late final GeneratedColumn<double> distanceDelta = GeneratedColumn<double>(
    'distance_delta',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.25),
  );
  static const VerificationMeta _speedDeltaMeta = const VerificationMeta(
    'speedDelta',
  );
  @override
  late final GeneratedColumn<double> speedDelta = GeneratedColumn<double>(
    'speed_delta',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.5),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userExerciseId,
    autoIncrementEnabled,
    autoIncrementInterval,
    weightDelta,
    repsDelta,
    durationDeltaSeconds,
    distanceDelta,
    speedDelta,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progression_policy_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgressionPolicyRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('auto_increment_enabled')) {
      context.handle(
        _autoIncrementEnabledMeta,
        autoIncrementEnabled.isAcceptableOrUnknown(
          data['auto_increment_enabled']!,
          _autoIncrementEnabledMeta,
        ),
      );
    }
    if (data.containsKey('auto_increment_interval')) {
      context.handle(
        _autoIncrementIntervalMeta,
        autoIncrementInterval.isAcceptableOrUnknown(
          data['auto_increment_interval']!,
          _autoIncrementIntervalMeta,
        ),
      );
    }
    if (data.containsKey('weight_delta')) {
      context.handle(
        _weightDeltaMeta,
        weightDelta.isAcceptableOrUnknown(
          data['weight_delta']!,
          _weightDeltaMeta,
        ),
      );
    }
    if (data.containsKey('reps_delta')) {
      context.handle(
        _repsDeltaMeta,
        repsDelta.isAcceptableOrUnknown(data['reps_delta']!, _repsDeltaMeta),
      );
    }
    if (data.containsKey('duration_delta_seconds')) {
      context.handle(
        _durationDeltaSecondsMeta,
        durationDeltaSeconds.isAcceptableOrUnknown(
          data['duration_delta_seconds']!,
          _durationDeltaSecondsMeta,
        ),
      );
    }
    if (data.containsKey('distance_delta')) {
      context.handle(
        _distanceDeltaMeta,
        distanceDelta.isAcceptableOrUnknown(
          data['distance_delta']!,
          _distanceDeltaMeta,
        ),
      );
    }
    if (data.containsKey('speed_delta')) {
      context.handle(
        _speedDeltaMeta,
        speedDelta.isAcceptableOrUnknown(data['speed_delta']!, _speedDeltaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userExerciseId};
  @override
  ProgressionPolicyRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressionPolicyRow(
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      autoIncrementEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_increment_enabled'],
      )!,
      autoIncrementInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}auto_increment_interval'],
      )!,
      weightDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_delta'],
      )!,
      repsDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps_delta'],
      )!,
      durationDeltaSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_delta_seconds'],
      )!,
      distanceDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_delta'],
      )!,
      speedDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed_delta'],
      )!,
    );
  }

  @override
  $ProgressionPolicyTableTable createAlias(String alias) {
    return $ProgressionPolicyTableTable(attachedDatabase, alias);
  }
}

class ProgressionPolicyRow extends DataClass
    implements Insertable<ProgressionPolicyRow> {
  final String userExerciseId;
  final bool autoIncrementEnabled;
  final int autoIncrementInterval;
  final double weightDelta;
  final int repsDelta;
  final int durationDeltaSeconds;
  final double distanceDelta;
  final double speedDelta;
  const ProgressionPolicyRow({
    required this.userExerciseId,
    required this.autoIncrementEnabled,
    required this.autoIncrementInterval,
    required this.weightDelta,
    required this.repsDelta,
    required this.durationDeltaSeconds,
    required this.distanceDelta,
    required this.speedDelta,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['auto_increment_enabled'] = Variable<bool>(autoIncrementEnabled);
    map['auto_increment_interval'] = Variable<int>(autoIncrementInterval);
    map['weight_delta'] = Variable<double>(weightDelta);
    map['reps_delta'] = Variable<int>(repsDelta);
    map['duration_delta_seconds'] = Variable<int>(durationDeltaSeconds);
    map['distance_delta'] = Variable<double>(distanceDelta);
    map['speed_delta'] = Variable<double>(speedDelta);
    return map;
  }

  ProgressionPolicyTableCompanion toCompanion(bool nullToAbsent) {
    return ProgressionPolicyTableCompanion(
      userExerciseId: Value(userExerciseId),
      autoIncrementEnabled: Value(autoIncrementEnabled),
      autoIncrementInterval: Value(autoIncrementInterval),
      weightDelta: Value(weightDelta),
      repsDelta: Value(repsDelta),
      durationDeltaSeconds: Value(durationDeltaSeconds),
      distanceDelta: Value(distanceDelta),
      speedDelta: Value(speedDelta),
    );
  }

  factory ProgressionPolicyRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressionPolicyRow(
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      autoIncrementEnabled: serializer.fromJson<bool>(
        json['autoIncrementEnabled'],
      ),
      autoIncrementInterval: serializer.fromJson<int>(
        json['autoIncrementInterval'],
      ),
      weightDelta: serializer.fromJson<double>(json['weightDelta']),
      repsDelta: serializer.fromJson<int>(json['repsDelta']),
      durationDeltaSeconds: serializer.fromJson<int>(
        json['durationDeltaSeconds'],
      ),
      distanceDelta: serializer.fromJson<double>(json['distanceDelta']),
      speedDelta: serializer.fromJson<double>(json['speedDelta']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'autoIncrementEnabled': serializer.toJson<bool>(autoIncrementEnabled),
      'autoIncrementInterval': serializer.toJson<int>(autoIncrementInterval),
      'weightDelta': serializer.toJson<double>(weightDelta),
      'repsDelta': serializer.toJson<int>(repsDelta),
      'durationDeltaSeconds': serializer.toJson<int>(durationDeltaSeconds),
      'distanceDelta': serializer.toJson<double>(distanceDelta),
      'speedDelta': serializer.toJson<double>(speedDelta),
    };
  }

  ProgressionPolicyRow copyWith({
    String? userExerciseId,
    bool? autoIncrementEnabled,
    int? autoIncrementInterval,
    double? weightDelta,
    int? repsDelta,
    int? durationDeltaSeconds,
    double? distanceDelta,
    double? speedDelta,
  }) => ProgressionPolicyRow(
    userExerciseId: userExerciseId ?? this.userExerciseId,
    autoIncrementEnabled: autoIncrementEnabled ?? this.autoIncrementEnabled,
    autoIncrementInterval: autoIncrementInterval ?? this.autoIncrementInterval,
    weightDelta: weightDelta ?? this.weightDelta,
    repsDelta: repsDelta ?? this.repsDelta,
    durationDeltaSeconds: durationDeltaSeconds ?? this.durationDeltaSeconds,
    distanceDelta: distanceDelta ?? this.distanceDelta,
    speedDelta: speedDelta ?? this.speedDelta,
  );
  ProgressionPolicyRow copyWithCompanion(ProgressionPolicyTableCompanion data) {
    return ProgressionPolicyRow(
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      autoIncrementEnabled: data.autoIncrementEnabled.present
          ? data.autoIncrementEnabled.value
          : this.autoIncrementEnabled,
      autoIncrementInterval: data.autoIncrementInterval.present
          ? data.autoIncrementInterval.value
          : this.autoIncrementInterval,
      weightDelta: data.weightDelta.present
          ? data.weightDelta.value
          : this.weightDelta,
      repsDelta: data.repsDelta.present ? data.repsDelta.value : this.repsDelta,
      durationDeltaSeconds: data.durationDeltaSeconds.present
          ? data.durationDeltaSeconds.value
          : this.durationDeltaSeconds,
      distanceDelta: data.distanceDelta.present
          ? data.distanceDelta.value
          : this.distanceDelta,
      speedDelta: data.speedDelta.present
          ? data.speedDelta.value
          : this.speedDelta,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgressionPolicyRow(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('autoIncrementEnabled: $autoIncrementEnabled, ')
          ..write('autoIncrementInterval: $autoIncrementInterval, ')
          ..write('weightDelta: $weightDelta, ')
          ..write('repsDelta: $repsDelta, ')
          ..write('durationDeltaSeconds: $durationDeltaSeconds, ')
          ..write('distanceDelta: $distanceDelta, ')
          ..write('speedDelta: $speedDelta')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userExerciseId,
    autoIncrementEnabled,
    autoIncrementInterval,
    weightDelta,
    repsDelta,
    durationDeltaSeconds,
    distanceDelta,
    speedDelta,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressionPolicyRow &&
          other.userExerciseId == this.userExerciseId &&
          other.autoIncrementEnabled == this.autoIncrementEnabled &&
          other.autoIncrementInterval == this.autoIncrementInterval &&
          other.weightDelta == this.weightDelta &&
          other.repsDelta == this.repsDelta &&
          other.durationDeltaSeconds == this.durationDeltaSeconds &&
          other.distanceDelta == this.distanceDelta &&
          other.speedDelta == this.speedDelta);
}

class ProgressionPolicyTableCompanion
    extends UpdateCompanion<ProgressionPolicyRow> {
  final Value<String> userExerciseId;
  final Value<bool> autoIncrementEnabled;
  final Value<int> autoIncrementInterval;
  final Value<double> weightDelta;
  final Value<int> repsDelta;
  final Value<int> durationDeltaSeconds;
  final Value<double> distanceDelta;
  final Value<double> speedDelta;
  final Value<int> rowid;
  const ProgressionPolicyTableCompanion({
    this.userExerciseId = const Value.absent(),
    this.autoIncrementEnabled = const Value.absent(),
    this.autoIncrementInterval = const Value.absent(),
    this.weightDelta = const Value.absent(),
    this.repsDelta = const Value.absent(),
    this.durationDeltaSeconds = const Value.absent(),
    this.distanceDelta = const Value.absent(),
    this.speedDelta = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressionPolicyTableCompanion.insert({
    required String userExerciseId,
    this.autoIncrementEnabled = const Value.absent(),
    this.autoIncrementInterval = const Value.absent(),
    this.weightDelta = const Value.absent(),
    this.repsDelta = const Value.absent(),
    this.durationDeltaSeconds = const Value.absent(),
    this.distanceDelta = const Value.absent(),
    this.speedDelta = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userExerciseId = Value(userExerciseId);
  static Insertable<ProgressionPolicyRow> custom({
    Expression<String>? userExerciseId,
    Expression<bool>? autoIncrementEnabled,
    Expression<int>? autoIncrementInterval,
    Expression<double>? weightDelta,
    Expression<int>? repsDelta,
    Expression<int>? durationDeltaSeconds,
    Expression<double>? distanceDelta,
    Expression<double>? speedDelta,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (autoIncrementEnabled != null)
        'auto_increment_enabled': autoIncrementEnabled,
      if (autoIncrementInterval != null)
        'auto_increment_interval': autoIncrementInterval,
      if (weightDelta != null) 'weight_delta': weightDelta,
      if (repsDelta != null) 'reps_delta': repsDelta,
      if (durationDeltaSeconds != null)
        'duration_delta_seconds': durationDeltaSeconds,
      if (distanceDelta != null) 'distance_delta': distanceDelta,
      if (speedDelta != null) 'speed_delta': speedDelta,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressionPolicyTableCompanion copyWith({
    Value<String>? userExerciseId,
    Value<bool>? autoIncrementEnabled,
    Value<int>? autoIncrementInterval,
    Value<double>? weightDelta,
    Value<int>? repsDelta,
    Value<int>? durationDeltaSeconds,
    Value<double>? distanceDelta,
    Value<double>? speedDelta,
    Value<int>? rowid,
  }) {
    return ProgressionPolicyTableCompanion(
      userExerciseId: userExerciseId ?? this.userExerciseId,
      autoIncrementEnabled: autoIncrementEnabled ?? this.autoIncrementEnabled,
      autoIncrementInterval:
          autoIncrementInterval ?? this.autoIncrementInterval,
      weightDelta: weightDelta ?? this.weightDelta,
      repsDelta: repsDelta ?? this.repsDelta,
      durationDeltaSeconds: durationDeltaSeconds ?? this.durationDeltaSeconds,
      distanceDelta: distanceDelta ?? this.distanceDelta,
      speedDelta: speedDelta ?? this.speedDelta,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (autoIncrementEnabled.present) {
      map['auto_increment_enabled'] = Variable<bool>(
        autoIncrementEnabled.value,
      );
    }
    if (autoIncrementInterval.present) {
      map['auto_increment_interval'] = Variable<int>(
        autoIncrementInterval.value,
      );
    }
    if (weightDelta.present) {
      map['weight_delta'] = Variable<double>(weightDelta.value);
    }
    if (repsDelta.present) {
      map['reps_delta'] = Variable<int>(repsDelta.value);
    }
    if (durationDeltaSeconds.present) {
      map['duration_delta_seconds'] = Variable<int>(durationDeltaSeconds.value);
    }
    if (distanceDelta.present) {
      map['distance_delta'] = Variable<double>(distanceDelta.value);
    }
    if (speedDelta.present) {
      map['speed_delta'] = Variable<double>(speedDelta.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressionPolicyTableCompanion(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('autoIncrementEnabled: $autoIncrementEnabled, ')
          ..write('autoIncrementInterval: $autoIncrementInterval, ')
          ..write('weightDelta: $weightDelta, ')
          ..write('repsDelta: $repsDelta, ')
          ..write('durationDeltaSeconds: $durationDeltaSeconds, ')
          ..write('distanceDelta: $distanceDelta, ')
          ..write('speedDelta: $speedDelta, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineTableTable extends RoutineTable
    with TableInfo<$RoutineTableTable, RoutineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastCompletedAtMeta = const VerificationMeta(
    'lastCompletedAt',
  );
  @override
  late final GeneratedColumn<int> lastCompletedAt = GeneratedColumn<int>(
    'last_completed_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    lastCompletedAt,
    isFavorite,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_completed_at')) {
      context.handle(
        _lastCompletedAtMeta,
        lastCompletedAt.isAcceptableOrUnknown(
          data['last_completed_at']!,
          _lastCompletedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, name},
  ];
  @override
  RoutineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lastCompletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_completed_at'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoutineTableTable createAlias(String alias) {
    return $RoutineTableTable(attachedDatabase, alias);
  }
}

class RoutineRow extends DataClass implements Insertable<RoutineRow> {
  final String id;
  final String userId;
  final String name;
  final int? lastCompletedAt;
  final bool isFavorite;
  final int createdAt;
  const RoutineRow({
    required this.id,
    required this.userId,
    required this.name,
    this.lastCompletedAt,
    required this.isFavorite,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lastCompletedAt != null) {
      map['last_completed_at'] = Variable<int>(lastCompletedAt);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  RoutineTableCompanion toCompanion(bool nullToAbsent) {
    return RoutineTableCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      lastCompletedAt: lastCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedAt),
      isFavorite: Value(isFavorite),
      createdAt: Value(createdAt),
    );
  }

  factory RoutineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      lastCompletedAt: serializer.fromJson<int?>(json['lastCompletedAt']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'lastCompletedAt': serializer.toJson<int?>(lastCompletedAt),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  RoutineRow copyWith({
    String? id,
    String? userId,
    String? name,
    Value<int?> lastCompletedAt = const Value.absent(),
    bool? isFavorite,
    int? createdAt,
  }) => RoutineRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    lastCompletedAt: lastCompletedAt.present
        ? lastCompletedAt.value
        : this.lastCompletedAt,
    isFavorite: isFavorite ?? this.isFavorite,
    createdAt: createdAt ?? this.createdAt,
  );
  RoutineRow copyWithCompanion(RoutineTableCompanion data) {
    return RoutineRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      lastCompletedAt: data.lastCompletedAt.present
          ? data.lastCompletedAt.value
          : this.lastCompletedAt,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, name, lastCompletedAt, isFavorite, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.lastCompletedAt == this.lastCompletedAt &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt);
}

class RoutineTableCompanion extends UpdateCompanion<RoutineRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<int?> lastCompletedAt;
  final Value<bool> isFavorite;
  final Value<int> createdAt;
  final Value<int> rowid;
  const RoutineTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineTableCompanion.insert({
    required String id,
    required String userId,
    required String name,
    this.lastCompletedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<RoutineRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<int>? lastCompletedAt,
    Expression<bool>? isFavorite,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (lastCompletedAt != null) 'last_completed_at': lastCompletedAt,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<int?>? lastCompletedAt,
    Value<bool>? isFavorite,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return RoutineTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      lastCompletedAt: lastCompletedAt ?? this.lastCompletedAt,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastCompletedAt.present) {
      map['last_completed_at'] = Variable<int>(lastCompletedAt.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineExerciseTableTable extends RoutineExerciseTable
    with TableInfo<$RoutineExerciseTableTable, RoutineExerciseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineExerciseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routine_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _exPositionMeta = const VerificationMeta(
    'exPosition',
  );
  @override
  late final GeneratedColumn<int> exPosition = GeneratedColumn<int>(
    'ex_position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    routineId,
    userExerciseId,
    exPosition,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_exercise_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineExerciseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('ex_position')) {
      context.handle(
        _exPositionMeta,
        exPosition.isAcceptableOrUnknown(data['ex_position']!, _exPositionMeta),
      );
    } else if (isInserting) {
      context.missing(_exPositionMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineExerciseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineExerciseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      )!,
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      exPosition: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex_position'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $RoutineExerciseTableTable createAlias(String alias) {
    return $RoutineExerciseTableTable(attachedDatabase, alias);
  }
}

class RoutineExerciseRow extends DataClass
    implements Insertable<RoutineExerciseRow> {
  final String id;
  final String userId;
  final String routineId;
  final String userExerciseId;
  final int exPosition;
  final String? notes;
  const RoutineExerciseRow({
    required this.id,
    required this.userId,
    required this.routineId,
    required this.userExerciseId,
    required this.exPosition,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['routine_id'] = Variable<String>(routineId);
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['ex_position'] = Variable<int>(exPosition);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RoutineExerciseTableCompanion toCompanion(bool nullToAbsent) {
    return RoutineExerciseTableCompanion(
      id: Value(id),
      userId: Value(userId),
      routineId: Value(routineId),
      userExerciseId: Value(userExerciseId),
      exPosition: Value(exPosition),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory RoutineExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineExerciseRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      routineId: serializer.fromJson<String>(json['routineId']),
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      exPosition: serializer.fromJson<int>(json['exPosition']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'routineId': serializer.toJson<String>(routineId),
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'exPosition': serializer.toJson<int>(exPosition),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  RoutineExerciseRow copyWith({
    String? id,
    String? userId,
    String? routineId,
    String? userExerciseId,
    int? exPosition,
    Value<String?> notes = const Value.absent(),
  }) => RoutineExerciseRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    routineId: routineId ?? this.routineId,
    userExerciseId: userExerciseId ?? this.userExerciseId,
    exPosition: exPosition ?? this.exPosition,
    notes: notes.present ? notes.value : this.notes,
  );
  RoutineExerciseRow copyWithCompanion(RoutineExerciseTableCompanion data) {
    return RoutineExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      exPosition: data.exPosition.present
          ? data.exPosition.value
          : this.exPosition,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineExerciseRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('routineId: $routineId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('exPosition: $exPosition, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, routineId, userExerciseId, exPosition, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineExerciseRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.routineId == this.routineId &&
          other.userExerciseId == this.userExerciseId &&
          other.exPosition == this.exPosition &&
          other.notes == this.notes);
}

class RoutineExerciseTableCompanion
    extends UpdateCompanion<RoutineExerciseRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> routineId;
  final Value<String> userExerciseId;
  final Value<int> exPosition;
  final Value<String?> notes;
  final Value<int> rowid;
  const RoutineExerciseTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.routineId = const Value.absent(),
    this.userExerciseId = const Value.absent(),
    this.exPosition = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineExerciseTableCompanion.insert({
    required String id,
    required String userId,
    required String routineId,
    required String userExerciseId,
    required int exPosition,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       routineId = Value(routineId),
       userExerciseId = Value(userExerciseId),
       exPosition = Value(exPosition);
  static Insertable<RoutineExerciseRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? routineId,
    Expression<String>? userExerciseId,
    Expression<int>? exPosition,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (routineId != null) 'routine_id': routineId,
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (exPosition != null) 'ex_position': exPosition,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineExerciseTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? routineId,
    Value<String>? userExerciseId,
    Value<int>? exPosition,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return RoutineExerciseTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      routineId: routineId ?? this.routineId,
      userExerciseId: userExerciseId ?? this.userExerciseId,
      exPosition: exPosition ?? this.exPosition,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (exPosition.present) {
      map['ex_position'] = Variable<int>(exPosition.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineExerciseTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('routineId: $routineId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('exPosition: $exPosition, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutLogTableTable extends WorkoutLogTable
    with TableInfo<$WorkoutLogTableTable, WorkoutLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routine_table (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _routineNameSnapshotMeta =
      const VerificationMeta('routineNameSnapshot');
  @override
  late final GeneratedColumn<String> routineNameSnapshot =
      GeneratedColumn<String>(
        'routine_name_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isAdhocMeta = const VerificationMeta(
    'isAdhoc',
  );
  @override
  late final GeneratedColumn<bool> isAdhoc = GeneratedColumn<bool>(
    'is_adhoc',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_adhoc" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _performedAtMeta = const VerificationMeta(
    'performedAt',
  );
  @override
  late final GeneratedColumn<int> performedAt = GeneratedColumn<int>(
    'performed_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    routineId,
    routineNameSnapshot,
    isAdhoc,
    performedAt,
    durationSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_log_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    }
    if (data.containsKey('routine_name_snapshot')) {
      context.handle(
        _routineNameSnapshotMeta,
        routineNameSnapshot.isAcceptableOrUnknown(
          data['routine_name_snapshot']!,
          _routineNameSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('is_adhoc')) {
      context.handle(
        _isAdhocMeta,
        isAdhoc.isAcceptableOrUnknown(data['is_adhoc']!, _isAdhocMeta),
      );
    }
    if (data.containsKey('performed_at')) {
      context.handle(
        _performedAtMeta,
        performedAt.isAcceptableOrUnknown(
          data['performed_at']!,
          _performedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_performedAtMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      ),
      routineNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_name_snapshot'],
      ),
      isAdhoc: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_adhoc'],
      )!,
      performedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}performed_at'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
    );
  }

  @override
  $WorkoutLogTableTable createAlias(String alias) {
    return $WorkoutLogTableTable(attachedDatabase, alias);
  }
}

class WorkoutLogRow extends DataClass implements Insertable<WorkoutLogRow> {
  final String id;
  final String userId;
  final String? routineId;
  final String? routineNameSnapshot;
  final bool isAdhoc;
  final int performedAt;
  final int? durationSeconds;
  const WorkoutLogRow({
    required this.id,
    required this.userId,
    this.routineId,
    this.routineNameSnapshot,
    required this.isAdhoc,
    required this.performedAt,
    this.durationSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || routineId != null) {
      map['routine_id'] = Variable<String>(routineId);
    }
    if (!nullToAbsent || routineNameSnapshot != null) {
      map['routine_name_snapshot'] = Variable<String>(routineNameSnapshot);
    }
    map['is_adhoc'] = Variable<bool>(isAdhoc);
    map['performed_at'] = Variable<int>(performedAt);
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    return map;
  }

  WorkoutLogTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutLogTableCompanion(
      id: Value(id),
      userId: Value(userId),
      routineId: routineId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineId),
      routineNameSnapshot: routineNameSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(routineNameSnapshot),
      isAdhoc: Value(isAdhoc),
      performedAt: Value(performedAt),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
    );
  }

  factory WorkoutLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutLogRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      routineId: serializer.fromJson<String?>(json['routineId']),
      routineNameSnapshot: serializer.fromJson<String?>(
        json['routineNameSnapshot'],
      ),
      isAdhoc: serializer.fromJson<bool>(json['isAdhoc']),
      performedAt: serializer.fromJson<int>(json['performedAt']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'routineId': serializer.toJson<String?>(routineId),
      'routineNameSnapshot': serializer.toJson<String?>(routineNameSnapshot),
      'isAdhoc': serializer.toJson<bool>(isAdhoc),
      'performedAt': serializer.toJson<int>(performedAt),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
    };
  }

  WorkoutLogRow copyWith({
    String? id,
    String? userId,
    Value<String?> routineId = const Value.absent(),
    Value<String?> routineNameSnapshot = const Value.absent(),
    bool? isAdhoc,
    int? performedAt,
    Value<int?> durationSeconds = const Value.absent(),
  }) => WorkoutLogRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    routineId: routineId.present ? routineId.value : this.routineId,
    routineNameSnapshot: routineNameSnapshot.present
        ? routineNameSnapshot.value
        : this.routineNameSnapshot,
    isAdhoc: isAdhoc ?? this.isAdhoc,
    performedAt: performedAt ?? this.performedAt,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
  );
  WorkoutLogRow copyWithCompanion(WorkoutLogTableCompanion data) {
    return WorkoutLogRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      routineNameSnapshot: data.routineNameSnapshot.present
          ? data.routineNameSnapshot.value
          : this.routineNameSnapshot,
      isAdhoc: data.isAdhoc.present ? data.isAdhoc.value : this.isAdhoc,
      performedAt: data.performedAt.present
          ? data.performedAt.value
          : this.performedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLogRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('routineId: $routineId, ')
          ..write('routineNameSnapshot: $routineNameSnapshot, ')
          ..write('isAdhoc: $isAdhoc, ')
          ..write('performedAt: $performedAt, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    routineId,
    routineNameSnapshot,
    isAdhoc,
    performedAt,
    durationSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutLogRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.routineId == this.routineId &&
          other.routineNameSnapshot == this.routineNameSnapshot &&
          other.isAdhoc == this.isAdhoc &&
          other.performedAt == this.performedAt &&
          other.durationSeconds == this.durationSeconds);
}

class WorkoutLogTableCompanion extends UpdateCompanion<WorkoutLogRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> routineId;
  final Value<String?> routineNameSnapshot;
  final Value<bool> isAdhoc;
  final Value<int> performedAt;
  final Value<int?> durationSeconds;
  final Value<int> rowid;
  const WorkoutLogTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.routineId = const Value.absent(),
    this.routineNameSnapshot = const Value.absent(),
    this.isAdhoc = const Value.absent(),
    this.performedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutLogTableCompanion.insert({
    required String id,
    required String userId,
    this.routineId = const Value.absent(),
    this.routineNameSnapshot = const Value.absent(),
    this.isAdhoc = const Value.absent(),
    required int performedAt,
    this.durationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       performedAt = Value(performedAt);
  static Insertable<WorkoutLogRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? routineId,
    Expression<String>? routineNameSnapshot,
    Expression<bool>? isAdhoc,
    Expression<int>? performedAt,
    Expression<int>? durationSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (routineId != null) 'routine_id': routineId,
      if (routineNameSnapshot != null)
        'routine_name_snapshot': routineNameSnapshot,
      if (isAdhoc != null) 'is_adhoc': isAdhoc,
      if (performedAt != null) 'performed_at': performedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutLogTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String?>? routineId,
    Value<String?>? routineNameSnapshot,
    Value<bool>? isAdhoc,
    Value<int>? performedAt,
    Value<int?>? durationSeconds,
    Value<int>? rowid,
  }) {
    return WorkoutLogTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      routineId: routineId ?? this.routineId,
      routineNameSnapshot: routineNameSnapshot ?? this.routineNameSnapshot,
      isAdhoc: isAdhoc ?? this.isAdhoc,
      performedAt: performedAt ?? this.performedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (routineNameSnapshot.present) {
      map['routine_name_snapshot'] = Variable<String>(
        routineNameSnapshot.value,
      );
    }
    if (isAdhoc.present) {
      map['is_adhoc'] = Variable<bool>(isAdhoc.value);
    }
    if (performedAt.present) {
      map['performed_at'] = Variable<int>(performedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLogTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('routineId: $routineId, ')
          ..write('routineNameSnapshot: $routineNameSnapshot, ')
          ..write('isAdhoc: $isAdhoc, ')
          ..write('performedAt: $performedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisePerformanceLogTableTable extends ExercisePerformanceLogTable
    with
        TableInfo<
          $ExercisePerformanceLogTableTable,
          ExercisePerformanceLogRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisePerformanceLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _workoutLogIdMeta = const VerificationMeta(
    'workoutLogId',
  );
  @override
  late final GeneratedColumn<String> workoutLogId = GeneratedColumn<String>(
    'workout_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_log_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _routineExerciseIdMeta = const VerificationMeta(
    'routineExerciseId',
  );
  @override
  late final GeneratedColumn<String> routineExerciseId =
      GeneratedColumn<String>(
        'routine_exercise_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES routine_exercise_table (id) ON DELETE SET NULL',
        ),
      );
  static const VerificationMeta _wasPartOfRoutineMeta = const VerificationMeta(
    'wasPartOfRoutine',
  );
  @override
  late final GeneratedColumn<bool> wasPartOfRoutine = GeneratedColumn<bool>(
    'was_part_of_routine',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_part_of_routine" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _autoIncrementCountSessionMeta =
      const VerificationMeta('autoIncrementCountSession');
  @override
  late final GeneratedColumn<int> autoIncrementCountSession =
      GeneratedColumn<int>(
        'auto_increment_count_session',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _performedAtMeta = const VerificationMeta(
    'performedAt',
  );
  @override
  late final GeneratedColumn<int> performedAt = GeneratedColumn<int>(
    'performed_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    workoutLogId,
    userExerciseId,
    routineExerciseId,
    wasPartOfRoutine,
    autoIncrementCountSession,
    performedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_performance_log_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExercisePerformanceLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_log_id')) {
      context.handle(
        _workoutLogIdMeta,
        workoutLogId.isAcceptableOrUnknown(
          data['workout_log_id']!,
          _workoutLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutLogIdMeta);
    }
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('routine_exercise_id')) {
      context.handle(
        _routineExerciseIdMeta,
        routineExerciseId.isAcceptableOrUnknown(
          data['routine_exercise_id']!,
          _routineExerciseIdMeta,
        ),
      );
    }
    if (data.containsKey('was_part_of_routine')) {
      context.handle(
        _wasPartOfRoutineMeta,
        wasPartOfRoutine.isAcceptableOrUnknown(
          data['was_part_of_routine']!,
          _wasPartOfRoutineMeta,
        ),
      );
    }
    if (data.containsKey('auto_increment_count_session')) {
      context.handle(
        _autoIncrementCountSessionMeta,
        autoIncrementCountSession.isAcceptableOrUnknown(
          data['auto_increment_count_session']!,
          _autoIncrementCountSessionMeta,
        ),
      );
    }
    if (data.containsKey('performed_at')) {
      context.handle(
        _performedAtMeta,
        performedAt.isAcceptableOrUnknown(
          data['performed_at']!,
          _performedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_performedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExercisePerformanceLogRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisePerformanceLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      workoutLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_log_id'],
      )!,
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      routineExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_exercise_id'],
      ),
      wasPartOfRoutine: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_part_of_routine'],
      )!,
      autoIncrementCountSession: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}auto_increment_count_session'],
      ),
      performedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}performed_at'],
      )!,
    );
  }

  @override
  $ExercisePerformanceLogTableTable createAlias(String alias) {
    return $ExercisePerformanceLogTableTable(attachedDatabase, alias);
  }
}

class ExercisePerformanceLogRow extends DataClass
    implements Insertable<ExercisePerformanceLogRow> {
  final String id;
  final String userId;
  final String workoutLogId;
  final String userExerciseId;
  final String? routineExerciseId;
  final bool wasPartOfRoutine;
  final int? autoIncrementCountSession;
  final int performedAt;
  const ExercisePerformanceLogRow({
    required this.id,
    required this.userId,
    required this.workoutLogId,
    required this.userExerciseId,
    this.routineExerciseId,
    required this.wasPartOfRoutine,
    this.autoIncrementCountSession,
    required this.performedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['workout_log_id'] = Variable<String>(workoutLogId);
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    if (!nullToAbsent || routineExerciseId != null) {
      map['routine_exercise_id'] = Variable<String>(routineExerciseId);
    }
    map['was_part_of_routine'] = Variable<bool>(wasPartOfRoutine);
    if (!nullToAbsent || autoIncrementCountSession != null) {
      map['auto_increment_count_session'] = Variable<int>(
        autoIncrementCountSession,
      );
    }
    map['performed_at'] = Variable<int>(performedAt);
    return map;
  }

  ExercisePerformanceLogTableCompanion toCompanion(bool nullToAbsent) {
    return ExercisePerformanceLogTableCompanion(
      id: Value(id),
      userId: Value(userId),
      workoutLogId: Value(workoutLogId),
      userExerciseId: Value(userExerciseId),
      routineExerciseId: routineExerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineExerciseId),
      wasPartOfRoutine: Value(wasPartOfRoutine),
      autoIncrementCountSession:
          autoIncrementCountSession == null && nullToAbsent
          ? const Value.absent()
          : Value(autoIncrementCountSession),
      performedAt: Value(performedAt),
    );
  }

  factory ExercisePerformanceLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisePerformanceLogRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      workoutLogId: serializer.fromJson<String>(json['workoutLogId']),
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      routineExerciseId: serializer.fromJson<String?>(
        json['routineExerciseId'],
      ),
      wasPartOfRoutine: serializer.fromJson<bool>(json['wasPartOfRoutine']),
      autoIncrementCountSession: serializer.fromJson<int?>(
        json['autoIncrementCountSession'],
      ),
      performedAt: serializer.fromJson<int>(json['performedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'workoutLogId': serializer.toJson<String>(workoutLogId),
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'routineExerciseId': serializer.toJson<String?>(routineExerciseId),
      'wasPartOfRoutine': serializer.toJson<bool>(wasPartOfRoutine),
      'autoIncrementCountSession': serializer.toJson<int?>(
        autoIncrementCountSession,
      ),
      'performedAt': serializer.toJson<int>(performedAt),
    };
  }

  ExercisePerformanceLogRow copyWith({
    String? id,
    String? userId,
    String? workoutLogId,
    String? userExerciseId,
    Value<String?> routineExerciseId = const Value.absent(),
    bool? wasPartOfRoutine,
    Value<int?> autoIncrementCountSession = const Value.absent(),
    int? performedAt,
  }) => ExercisePerformanceLogRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    workoutLogId: workoutLogId ?? this.workoutLogId,
    userExerciseId: userExerciseId ?? this.userExerciseId,
    routineExerciseId: routineExerciseId.present
        ? routineExerciseId.value
        : this.routineExerciseId,
    wasPartOfRoutine: wasPartOfRoutine ?? this.wasPartOfRoutine,
    autoIncrementCountSession: autoIncrementCountSession.present
        ? autoIncrementCountSession.value
        : this.autoIncrementCountSession,
    performedAt: performedAt ?? this.performedAt,
  );
  ExercisePerformanceLogRow copyWithCompanion(
    ExercisePerformanceLogTableCompanion data,
  ) {
    return ExercisePerformanceLogRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      workoutLogId: data.workoutLogId.present
          ? data.workoutLogId.value
          : this.workoutLogId,
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      routineExerciseId: data.routineExerciseId.present
          ? data.routineExerciseId.value
          : this.routineExerciseId,
      wasPartOfRoutine: data.wasPartOfRoutine.present
          ? data.wasPartOfRoutine.value
          : this.wasPartOfRoutine,
      autoIncrementCountSession: data.autoIncrementCountSession.present
          ? data.autoIncrementCountSession.value
          : this.autoIncrementCountSession,
      performedAt: data.performedAt.present
          ? data.performedAt.value
          : this.performedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExercisePerformanceLogRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutLogId: $workoutLogId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('routineExerciseId: $routineExerciseId, ')
          ..write('wasPartOfRoutine: $wasPartOfRoutine, ')
          ..write('autoIncrementCountSession: $autoIncrementCountSession, ')
          ..write('performedAt: $performedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    workoutLogId,
    userExerciseId,
    routineExerciseId,
    wasPartOfRoutine,
    autoIncrementCountSession,
    performedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisePerformanceLogRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.workoutLogId == this.workoutLogId &&
          other.userExerciseId == this.userExerciseId &&
          other.routineExerciseId == this.routineExerciseId &&
          other.wasPartOfRoutine == this.wasPartOfRoutine &&
          other.autoIncrementCountSession == this.autoIncrementCountSession &&
          other.performedAt == this.performedAt);
}

class ExercisePerformanceLogTableCompanion
    extends UpdateCompanion<ExercisePerformanceLogRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> workoutLogId;
  final Value<String> userExerciseId;
  final Value<String?> routineExerciseId;
  final Value<bool> wasPartOfRoutine;
  final Value<int?> autoIncrementCountSession;
  final Value<int> performedAt;
  final Value<int> rowid;
  const ExercisePerformanceLogTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutLogId = const Value.absent(),
    this.userExerciseId = const Value.absent(),
    this.routineExerciseId = const Value.absent(),
    this.wasPartOfRoutine = const Value.absent(),
    this.autoIncrementCountSession = const Value.absent(),
    this.performedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisePerformanceLogTableCompanion.insert({
    required String id,
    required String userId,
    required String workoutLogId,
    required String userExerciseId,
    this.routineExerciseId = const Value.absent(),
    this.wasPartOfRoutine = const Value.absent(),
    this.autoIncrementCountSession = const Value.absent(),
    required int performedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       workoutLogId = Value(workoutLogId),
       userExerciseId = Value(userExerciseId),
       performedAt = Value(performedAt);
  static Insertable<ExercisePerformanceLogRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutLogId,
    Expression<String>? userExerciseId,
    Expression<String>? routineExerciseId,
    Expression<bool>? wasPartOfRoutine,
    Expression<int>? autoIncrementCountSession,
    Expression<int>? performedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutLogId != null) 'workout_log_id': workoutLogId,
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (routineExerciseId != null) 'routine_exercise_id': routineExerciseId,
      if (wasPartOfRoutine != null) 'was_part_of_routine': wasPartOfRoutine,
      if (autoIncrementCountSession != null)
        'auto_increment_count_session': autoIncrementCountSession,
      if (performedAt != null) 'performed_at': performedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisePerformanceLogTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? workoutLogId,
    Value<String>? userExerciseId,
    Value<String?>? routineExerciseId,
    Value<bool>? wasPartOfRoutine,
    Value<int?>? autoIncrementCountSession,
    Value<int>? performedAt,
    Value<int>? rowid,
  }) {
    return ExercisePerformanceLogTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutLogId: workoutLogId ?? this.workoutLogId,
      userExerciseId: userExerciseId ?? this.userExerciseId,
      routineExerciseId: routineExerciseId ?? this.routineExerciseId,
      wasPartOfRoutine: wasPartOfRoutine ?? this.wasPartOfRoutine,
      autoIncrementCountSession:
          autoIncrementCountSession ?? this.autoIncrementCountSession,
      performedAt: performedAt ?? this.performedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutLogId.present) {
      map['workout_log_id'] = Variable<String>(workoutLogId.value);
    }
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (routineExerciseId.present) {
      map['routine_exercise_id'] = Variable<String>(routineExerciseId.value);
    }
    if (wasPartOfRoutine.present) {
      map['was_part_of_routine'] = Variable<bool>(wasPartOfRoutine.value);
    }
    if (autoIncrementCountSession.present) {
      map['auto_increment_count_session'] = Variable<int>(
        autoIncrementCountSession.value,
      );
    }
    if (performedAt.present) {
      map['performed_at'] = Variable<int>(performedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisePerformanceLogTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutLogId: $workoutLogId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('routineExerciseId: $routineExerciseId, ')
          ..write('wasPartOfRoutine: $wasPartOfRoutine, ')
          ..write('autoIncrementCountSession: $autoIncrementCountSession, ')
          ..write('performedAt: $performedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SetLogTableTable extends SetLogTable
    with TableInfo<$SetLogTableTable, SetLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _exercisePerformanceLogIdMeta =
      const VerificationMeta('exercisePerformanceLogId');
  @override
  late final GeneratedColumn<String> exercisePerformanceLogId =
      GeneratedColumn<String>(
        'exercise_performance_log_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercise_performance_log_table (id) ON DELETE CASCADE',
        ),
      );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restTimeSecondsMeta = const VerificationMeta(
    'restTimeSeconds',
  );
  @override
  late final GeneratedColumn<int> restTimeSeconds = GeneratedColumn<int>(
    'rest_time_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    exercisePerformanceLogId,
    setNumber,
    weight,
    reps,
    durationSeconds,
    distance,
    speed,
    restTimeSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_log_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise_performance_log_id')) {
      context.handle(
        _exercisePerformanceLogIdMeta,
        exercisePerformanceLogId.isAcceptableOrUnknown(
          data['exercise_performance_log_id']!,
          _exercisePerformanceLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exercisePerformanceLogIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('rest_time_seconds')) {
      context.handle(
        _restTimeSecondsMeta,
        restTimeSeconds.isAcceptableOrUnknown(
          data['rest_time_seconds']!,
          _restTimeSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {exercisePerformanceLogId, setNumber},
  ];
  @override
  SetLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      exercisePerformanceLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_performance_log_id'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      ),
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      ),
      restTimeSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_time_seconds'],
      ),
    );
  }

  @override
  $SetLogTableTable createAlias(String alias) {
    return $SetLogTableTable(attachedDatabase, alias);
  }
}

class SetLogRow extends DataClass implements Insertable<SetLogRow> {
  final String id;
  final String userId;
  final String exercisePerformanceLogId;
  final int setNumber;
  final double? weight;
  final int? reps;
  final int? durationSeconds;
  final double? distance;
  final double? speed;
  final int? restTimeSeconds;
  const SetLogRow({
    required this.id,
    required this.userId,
    required this.exercisePerformanceLogId,
    required this.setNumber,
    this.weight,
    this.reps,
    this.durationSeconds,
    this.distance,
    this.speed,
    this.restTimeSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['exercise_performance_log_id'] = Variable<String>(
      exercisePerformanceLogId,
    );
    map['set_number'] = Variable<int>(setNumber);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<double>(distance);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    if (!nullToAbsent || restTimeSeconds != null) {
      map['rest_time_seconds'] = Variable<int>(restTimeSeconds);
    }
    return map;
  }

  SetLogTableCompanion toCompanion(bool nullToAbsent) {
    return SetLogTableCompanion(
      id: Value(id),
      userId: Value(userId),
      exercisePerformanceLogId: Value(exercisePerformanceLogId),
      setNumber: Value(setNumber),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      distance: distance == null && nullToAbsent
          ? const Value.absent()
          : Value(distance),
      speed: speed == null && nullToAbsent
          ? const Value.absent()
          : Value(speed),
      restTimeSeconds: restTimeSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(restTimeSeconds),
    );
  }

  factory SetLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetLogRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      exercisePerformanceLogId: serializer.fromJson<String>(
        json['exercisePerformanceLogId'],
      ),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      weight: serializer.fromJson<double?>(json['weight']),
      reps: serializer.fromJson<int?>(json['reps']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      distance: serializer.fromJson<double?>(json['distance']),
      speed: serializer.fromJson<double?>(json['speed']),
      restTimeSeconds: serializer.fromJson<int?>(json['restTimeSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'exercisePerformanceLogId': serializer.toJson<String>(
        exercisePerformanceLogId,
      ),
      'setNumber': serializer.toJson<int>(setNumber),
      'weight': serializer.toJson<double?>(weight),
      'reps': serializer.toJson<int?>(reps),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'distance': serializer.toJson<double?>(distance),
      'speed': serializer.toJson<double?>(speed),
      'restTimeSeconds': serializer.toJson<int?>(restTimeSeconds),
    };
  }

  SetLogRow copyWith({
    String? id,
    String? userId,
    String? exercisePerformanceLogId,
    int? setNumber,
    Value<double?> weight = const Value.absent(),
    Value<int?> reps = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<double?> distance = const Value.absent(),
    Value<double?> speed = const Value.absent(),
    Value<int?> restTimeSeconds = const Value.absent(),
  }) => SetLogRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    exercisePerformanceLogId:
        exercisePerformanceLogId ?? this.exercisePerformanceLogId,
    setNumber: setNumber ?? this.setNumber,
    weight: weight.present ? weight.value : this.weight,
    reps: reps.present ? reps.value : this.reps,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    distance: distance.present ? distance.value : this.distance,
    speed: speed.present ? speed.value : this.speed,
    restTimeSeconds: restTimeSeconds.present
        ? restTimeSeconds.value
        : this.restTimeSeconds,
  );
  SetLogRow copyWithCompanion(SetLogTableCompanion data) {
    return SetLogRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exercisePerformanceLogId: data.exercisePerformanceLogId.present
          ? data.exercisePerformanceLogId.value
          : this.exercisePerformanceLogId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      weight: data.weight.present ? data.weight.value : this.weight,
      reps: data.reps.present ? data.reps.value : this.reps,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      distance: data.distance.present ? data.distance.value : this.distance,
      speed: data.speed.present ? data.speed.value : this.speed,
      restTimeSeconds: data.restTimeSeconds.present
          ? data.restTimeSeconds.value
          : this.restTimeSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetLogRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exercisePerformanceLogId: $exercisePerformanceLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('distance: $distance, ')
          ..write('speed: $speed, ')
          ..write('restTimeSeconds: $restTimeSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    exercisePerformanceLogId,
    setNumber,
    weight,
    reps,
    durationSeconds,
    distance,
    speed,
    restTimeSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetLogRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exercisePerformanceLogId == this.exercisePerformanceLogId &&
          other.setNumber == this.setNumber &&
          other.weight == this.weight &&
          other.reps == this.reps &&
          other.durationSeconds == this.durationSeconds &&
          other.distance == this.distance &&
          other.speed == this.speed &&
          other.restTimeSeconds == this.restTimeSeconds);
}

class SetLogTableCompanion extends UpdateCompanion<SetLogRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> exercisePerformanceLogId;
  final Value<int> setNumber;
  final Value<double?> weight;
  final Value<int?> reps;
  final Value<int?> durationSeconds;
  final Value<double?> distance;
  final Value<double?> speed;
  final Value<int?> restTimeSeconds;
  final Value<int> rowid;
  const SetLogTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exercisePerformanceLogId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.distance = const Value.absent(),
    this.speed = const Value.absent(),
    this.restTimeSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetLogTableCompanion.insert({
    required String id,
    required String userId,
    required String exercisePerformanceLogId,
    required int setNumber,
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.distance = const Value.absent(),
    this.speed = const Value.absent(),
    this.restTimeSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       exercisePerformanceLogId = Value(exercisePerformanceLogId),
       setNumber = Value(setNumber);
  static Insertable<SetLogRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? exercisePerformanceLogId,
    Expression<int>? setNumber,
    Expression<double>? weight,
    Expression<int>? reps,
    Expression<int>? durationSeconds,
    Expression<double>? distance,
    Expression<double>? speed,
    Expression<int>? restTimeSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exercisePerformanceLogId != null)
        'exercise_performance_log_id': exercisePerformanceLogId,
      if (setNumber != null) 'set_number': setNumber,
      if (weight != null) 'weight': weight,
      if (reps != null) 'reps': reps,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (distance != null) 'distance': distance,
      if (speed != null) 'speed': speed,
      if (restTimeSeconds != null) 'rest_time_seconds': restTimeSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetLogTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? exercisePerformanceLogId,
    Value<int>? setNumber,
    Value<double?>? weight,
    Value<int?>? reps,
    Value<int?>? durationSeconds,
    Value<double?>? distance,
    Value<double?>? speed,
    Value<int?>? restTimeSeconds,
    Value<int>? rowid,
  }) {
    return SetLogTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exercisePerformanceLogId:
          exercisePerformanceLogId ?? this.exercisePerformanceLogId,
      setNumber: setNumber ?? this.setNumber,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      distance: distance ?? this.distance,
      speed: speed ?? this.speed,
      restTimeSeconds: restTimeSeconds ?? this.restTimeSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (exercisePerformanceLogId.present) {
      map['exercise_performance_log_id'] = Variable<String>(
        exercisePerformanceLogId.value,
      );
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (restTimeSeconds.present) {
      map['rest_time_seconds'] = Variable<int>(restTimeSeconds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetLogTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exercisePerformanceLogId: $exercisePerformanceLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('distance: $distance, ')
          ..write('speed: $speed, ')
          ..write('restTimeSeconds: $restTimeSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActiveWorkoutDraftTableTable extends ActiveWorkoutDraftTable
    with TableInfo<$ActiveWorkoutDraftTableTable, ActiveWorkoutDraftRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActiveWorkoutDraftTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
  payloadJson =
      GeneratedColumn<String>(
        'payload_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<String, dynamic>>(
        $ActiveWorkoutDraftTableTable.$converterpayloadJson,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    routineId,
    userExerciseId,
    startedAt,
    payloadJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'active_workout_draft_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActiveWorkoutDraftRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActiveWorkoutDraftRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActiveWorkoutDraftRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      )!,
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}started_at'],
      )!,
      payloadJson: $ActiveWorkoutDraftTableTable.$converterpayloadJson.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}payload_json'],
        )!,
      ),
    );
  }

  @override
  $ActiveWorkoutDraftTableTable createAlias(String alias) {
    return $ActiveWorkoutDraftTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterpayloadJson =
      const JsonMapConverter();
}

class ActiveWorkoutDraftRow extends DataClass
    implements Insertable<ActiveWorkoutDraftRow> {
  final int id;
  final String userId;

  /// Routine id, or the 'ad-hoc' sentinel.
  final String routineId;
  final String userExerciseId;
  final int startedAt;
  final Map<String, dynamic> payloadJson;
  const ActiveWorkoutDraftRow({
    required this.id,
    required this.userId,
    required this.routineId,
    required this.userExerciseId,
    required this.startedAt,
    required this.payloadJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['routine_id'] = Variable<String>(routineId);
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['started_at'] = Variable<int>(startedAt);
    {
      map['payload_json'] = Variable<String>(
        $ActiveWorkoutDraftTableTable.$converterpayloadJson.toSql(payloadJson),
      );
    }
    return map;
  }

  ActiveWorkoutDraftTableCompanion toCompanion(bool nullToAbsent) {
    return ActiveWorkoutDraftTableCompanion(
      id: Value(id),
      userId: Value(userId),
      routineId: Value(routineId),
      userExerciseId: Value(userExerciseId),
      startedAt: Value(startedAt),
      payloadJson: Value(payloadJson),
    );
  }

  factory ActiveWorkoutDraftRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActiveWorkoutDraftRow(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      routineId: serializer.fromJson<String>(json['routineId']),
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      startedAt: serializer.fromJson<int>(json['startedAt']),
      payloadJson: serializer.fromJson<Map<String, dynamic>>(
        json['payloadJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'routineId': serializer.toJson<String>(routineId),
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'startedAt': serializer.toJson<int>(startedAt),
      'payloadJson': serializer.toJson<Map<String, dynamic>>(payloadJson),
    };
  }

  ActiveWorkoutDraftRow copyWith({
    int? id,
    String? userId,
    String? routineId,
    String? userExerciseId,
    int? startedAt,
    Map<String, dynamic>? payloadJson,
  }) => ActiveWorkoutDraftRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    routineId: routineId ?? this.routineId,
    userExerciseId: userExerciseId ?? this.userExerciseId,
    startedAt: startedAt ?? this.startedAt,
    payloadJson: payloadJson ?? this.payloadJson,
  );
  ActiveWorkoutDraftRow copyWithCompanion(
    ActiveWorkoutDraftTableCompanion data,
  ) {
    return ActiveWorkoutDraftRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActiveWorkoutDraftRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('routineId: $routineId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('startedAt: $startedAt, ')
          ..write('payloadJson: $payloadJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    routineId,
    userExerciseId,
    startedAt,
    payloadJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActiveWorkoutDraftRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.routineId == this.routineId &&
          other.userExerciseId == this.userExerciseId &&
          other.startedAt == this.startedAt &&
          other.payloadJson == this.payloadJson);
}

class ActiveWorkoutDraftTableCompanion
    extends UpdateCompanion<ActiveWorkoutDraftRow> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> routineId;
  final Value<String> userExerciseId;
  final Value<int> startedAt;
  final Value<Map<String, dynamic>> payloadJson;
  const ActiveWorkoutDraftTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.routineId = const Value.absent(),
    this.userExerciseId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.payloadJson = const Value.absent(),
  });
  ActiveWorkoutDraftTableCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String routineId,
    required String userExerciseId,
    required int startedAt,
    required Map<String, dynamic> payloadJson,
  }) : userId = Value(userId),
       routineId = Value(routineId),
       userExerciseId = Value(userExerciseId),
       startedAt = Value(startedAt),
       payloadJson = Value(payloadJson);
  static Insertable<ActiveWorkoutDraftRow> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? routineId,
    Expression<String>? userExerciseId,
    Expression<int>? startedAt,
    Expression<String>? payloadJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (routineId != null) 'routine_id': routineId,
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (startedAt != null) 'started_at': startedAt,
      if (payloadJson != null) 'payload_json': payloadJson,
    });
  }

  ActiveWorkoutDraftTableCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? routineId,
    Value<String>? userExerciseId,
    Value<int>? startedAt,
    Value<Map<String, dynamic>>? payloadJson,
  }) {
    return ActiveWorkoutDraftTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      routineId: routineId ?? this.routineId,
      userExerciseId: userExerciseId ?? this.userExerciseId,
      startedAt: startedAt ?? this.startedAt,
      payloadJson: payloadJson ?? this.payloadJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<int>(startedAt.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(
        $ActiveWorkoutDraftTableTable.$converterpayloadJson.toSql(
          payloadJson.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActiveWorkoutDraftTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('routineId: $routineId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('startedAt: $startedAt, ')
          ..write('payloadJson: $payloadJson')
          ..write(')'))
        .toString();
  }
}

class $HistoryStatsRollupTableTable extends HistoryStatsRollupTable
    with TableInfo<$HistoryStatsRollupTableTable, HistoryStatsRollupRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryStatsRollupTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dayEpochMeta = const VerificationMeta(
    'dayEpoch',
  );
  @override
  late final GeneratedColumn<int> dayEpoch = GeneratedColumn<int>(
    'day_epoch',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setCountMeta = const VerificationMeta(
    'setCount',
  );
  @override
  late final GeneratedColumn<int> setCount = GeneratedColumn<int>(
    'set_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalVolumeMeta = const VerificationMeta(
    'totalVolume',
  );
  @override
  late final GeneratedColumn<double> totalVolume = GeneratedColumn<double>(
    'total_volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalRepsMeta = const VerificationMeta(
    'totalReps',
  );
  @override
  late final GeneratedColumn<int> totalReps = GeneratedColumn<int>(
    'total_reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxWeightMeta = const VerificationMeta(
    'maxWeight',
  );
  @override
  late final GeneratedColumn<double> maxWeight = GeneratedColumn<double>(
    'max_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minWeightMeta = const VerificationMeta(
    'minWeight',
  );
  @override
  late final GeneratedColumn<double> minWeight = GeneratedColumn<double>(
    'min_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oneRepMaxMeta = const VerificationMeta(
    'oneRepMax',
  );
  @override
  late final GeneratedColumn<double> oneRepMax = GeneratedColumn<double>(
    'one_rep_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalDurationSecondsMeta =
      const VerificationMeta('totalDurationSeconds');
  @override
  late final GeneratedColumn<int> totalDurationSeconds = GeneratedColumn<int>(
    'total_duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalDistanceMeta = const VerificationMeta(
    'totalDistance',
  );
  @override
  late final GeneratedColumn<double> totalDistance = GeneratedColumn<double>(
    'total_distance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maxSpeedMeta = const VerificationMeta(
    'maxSpeed',
  );
  @override
  late final GeneratedColumn<double> maxSpeed = GeneratedColumn<double>(
    'max_speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avgSpeedMeta = const VerificationMeta(
    'avgSpeed',
  );
  @override
  late final GeneratedColumn<double> avgSpeed = GeneratedColumn<double>(
    'avg_speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    userExerciseId,
    dayEpoch,
    setCount,
    totalVolume,
    totalReps,
    maxWeight,
    minWeight,
    oneRepMax,
    totalDurationSeconds,
    totalDistance,
    maxSpeed,
    avgSpeed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_stats_rollup_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryStatsRollupRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('day_epoch')) {
      context.handle(
        _dayEpochMeta,
        dayEpoch.isAcceptableOrUnknown(data['day_epoch']!, _dayEpochMeta),
      );
    } else if (isInserting) {
      context.missing(_dayEpochMeta);
    }
    if (data.containsKey('set_count')) {
      context.handle(
        _setCountMeta,
        setCount.isAcceptableOrUnknown(data['set_count']!, _setCountMeta),
      );
    }
    if (data.containsKey('total_volume')) {
      context.handle(
        _totalVolumeMeta,
        totalVolume.isAcceptableOrUnknown(
          data['total_volume']!,
          _totalVolumeMeta,
        ),
      );
    }
    if (data.containsKey('total_reps')) {
      context.handle(
        _totalRepsMeta,
        totalReps.isAcceptableOrUnknown(data['total_reps']!, _totalRepsMeta),
      );
    }
    if (data.containsKey('max_weight')) {
      context.handle(
        _maxWeightMeta,
        maxWeight.isAcceptableOrUnknown(data['max_weight']!, _maxWeightMeta),
      );
    }
    if (data.containsKey('min_weight')) {
      context.handle(
        _minWeightMeta,
        minWeight.isAcceptableOrUnknown(data['min_weight']!, _minWeightMeta),
      );
    }
    if (data.containsKey('one_rep_max')) {
      context.handle(
        _oneRepMaxMeta,
        oneRepMax.isAcceptableOrUnknown(data['one_rep_max']!, _oneRepMaxMeta),
      );
    }
    if (data.containsKey('total_duration_seconds')) {
      context.handle(
        _totalDurationSecondsMeta,
        totalDurationSeconds.isAcceptableOrUnknown(
          data['total_duration_seconds']!,
          _totalDurationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('total_distance')) {
      context.handle(
        _totalDistanceMeta,
        totalDistance.isAcceptableOrUnknown(
          data['total_distance']!,
          _totalDistanceMeta,
        ),
      );
    }
    if (data.containsKey('max_speed')) {
      context.handle(
        _maxSpeedMeta,
        maxSpeed.isAcceptableOrUnknown(data['max_speed']!, _maxSpeedMeta),
      );
    }
    if (data.containsKey('avg_speed')) {
      context.handle(
        _avgSpeedMeta,
        avgSpeed.isAcceptableOrUnknown(data['avg_speed']!, _avgSpeedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userExerciseId, dayEpoch};
  @override
  HistoryStatsRollupRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryStatsRollupRow(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      dayEpoch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_epoch'],
      )!,
      setCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_count'],
      )!,
      totalVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_volume'],
      )!,
      totalReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_reps'],
      )!,
      maxWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_weight'],
      ),
      minWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min_weight'],
      ),
      oneRepMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}one_rep_max'],
      ),
      totalDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_duration_seconds'],
      ),
      totalDistance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_distance'],
      ),
      maxSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_speed'],
      ),
      avgSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}avg_speed'],
      ),
    );
  }

  @override
  $HistoryStatsRollupTableTable createAlias(String alias) {
    return $HistoryStatsRollupTableTable(attachedDatabase, alias);
  }
}

class HistoryStatsRollupRow extends DataClass
    implements Insertable<HistoryStatsRollupRow> {
  final String userId;
  final String userExerciseId;

  /// Local-midnight epoch-ms of the training day.
  final int dayEpoch;
  final int setCount;
  final double totalVolume;
  final int totalReps;
  final double? maxWeight;
  final double? minWeight;
  final double? oneRepMax;
  final int? totalDurationSeconds;
  final double? totalDistance;
  final double? maxSpeed;
  final double? avgSpeed;
  const HistoryStatsRollupRow({
    required this.userId,
    required this.userExerciseId,
    required this.dayEpoch,
    required this.setCount,
    required this.totalVolume,
    required this.totalReps,
    this.maxWeight,
    this.minWeight,
    this.oneRepMax,
    this.totalDurationSeconds,
    this.totalDistance,
    this.maxSpeed,
    this.avgSpeed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['day_epoch'] = Variable<int>(dayEpoch);
    map['set_count'] = Variable<int>(setCount);
    map['total_volume'] = Variable<double>(totalVolume);
    map['total_reps'] = Variable<int>(totalReps);
    if (!nullToAbsent || maxWeight != null) {
      map['max_weight'] = Variable<double>(maxWeight);
    }
    if (!nullToAbsent || minWeight != null) {
      map['min_weight'] = Variable<double>(minWeight);
    }
    if (!nullToAbsent || oneRepMax != null) {
      map['one_rep_max'] = Variable<double>(oneRepMax);
    }
    if (!nullToAbsent || totalDurationSeconds != null) {
      map['total_duration_seconds'] = Variable<int>(totalDurationSeconds);
    }
    if (!nullToAbsent || totalDistance != null) {
      map['total_distance'] = Variable<double>(totalDistance);
    }
    if (!nullToAbsent || maxSpeed != null) {
      map['max_speed'] = Variable<double>(maxSpeed);
    }
    if (!nullToAbsent || avgSpeed != null) {
      map['avg_speed'] = Variable<double>(avgSpeed);
    }
    return map;
  }

  HistoryStatsRollupTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryStatsRollupTableCompanion(
      userId: Value(userId),
      userExerciseId: Value(userExerciseId),
      dayEpoch: Value(dayEpoch),
      setCount: Value(setCount),
      totalVolume: Value(totalVolume),
      totalReps: Value(totalReps),
      maxWeight: maxWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeight),
      minWeight: minWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(minWeight),
      oneRepMax: oneRepMax == null && nullToAbsent
          ? const Value.absent()
          : Value(oneRepMax),
      totalDurationSeconds: totalDurationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDurationSeconds),
      totalDistance: totalDistance == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDistance),
      maxSpeed: maxSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(maxSpeed),
      avgSpeed: avgSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(avgSpeed),
    );
  }

  factory HistoryStatsRollupRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryStatsRollupRow(
      userId: serializer.fromJson<String>(json['userId']),
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      dayEpoch: serializer.fromJson<int>(json['dayEpoch']),
      setCount: serializer.fromJson<int>(json['setCount']),
      totalVolume: serializer.fromJson<double>(json['totalVolume']),
      totalReps: serializer.fromJson<int>(json['totalReps']),
      maxWeight: serializer.fromJson<double?>(json['maxWeight']),
      minWeight: serializer.fromJson<double?>(json['minWeight']),
      oneRepMax: serializer.fromJson<double?>(json['oneRepMax']),
      totalDurationSeconds: serializer.fromJson<int?>(
        json['totalDurationSeconds'],
      ),
      totalDistance: serializer.fromJson<double?>(json['totalDistance']),
      maxSpeed: serializer.fromJson<double?>(json['maxSpeed']),
      avgSpeed: serializer.fromJson<double?>(json['avgSpeed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'dayEpoch': serializer.toJson<int>(dayEpoch),
      'setCount': serializer.toJson<int>(setCount),
      'totalVolume': serializer.toJson<double>(totalVolume),
      'totalReps': serializer.toJson<int>(totalReps),
      'maxWeight': serializer.toJson<double?>(maxWeight),
      'minWeight': serializer.toJson<double?>(minWeight),
      'oneRepMax': serializer.toJson<double?>(oneRepMax),
      'totalDurationSeconds': serializer.toJson<int?>(totalDurationSeconds),
      'totalDistance': serializer.toJson<double?>(totalDistance),
      'maxSpeed': serializer.toJson<double?>(maxSpeed),
      'avgSpeed': serializer.toJson<double?>(avgSpeed),
    };
  }

  HistoryStatsRollupRow copyWith({
    String? userId,
    String? userExerciseId,
    int? dayEpoch,
    int? setCount,
    double? totalVolume,
    int? totalReps,
    Value<double?> maxWeight = const Value.absent(),
    Value<double?> minWeight = const Value.absent(),
    Value<double?> oneRepMax = const Value.absent(),
    Value<int?> totalDurationSeconds = const Value.absent(),
    Value<double?> totalDistance = const Value.absent(),
    Value<double?> maxSpeed = const Value.absent(),
    Value<double?> avgSpeed = const Value.absent(),
  }) => HistoryStatsRollupRow(
    userId: userId ?? this.userId,
    userExerciseId: userExerciseId ?? this.userExerciseId,
    dayEpoch: dayEpoch ?? this.dayEpoch,
    setCount: setCount ?? this.setCount,
    totalVolume: totalVolume ?? this.totalVolume,
    totalReps: totalReps ?? this.totalReps,
    maxWeight: maxWeight.present ? maxWeight.value : this.maxWeight,
    minWeight: minWeight.present ? minWeight.value : this.minWeight,
    oneRepMax: oneRepMax.present ? oneRepMax.value : this.oneRepMax,
    totalDurationSeconds: totalDurationSeconds.present
        ? totalDurationSeconds.value
        : this.totalDurationSeconds,
    totalDistance: totalDistance.present
        ? totalDistance.value
        : this.totalDistance,
    maxSpeed: maxSpeed.present ? maxSpeed.value : this.maxSpeed,
    avgSpeed: avgSpeed.present ? avgSpeed.value : this.avgSpeed,
  );
  HistoryStatsRollupRow copyWithCompanion(
    HistoryStatsRollupTableCompanion data,
  ) {
    return HistoryStatsRollupRow(
      userId: data.userId.present ? data.userId.value : this.userId,
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      dayEpoch: data.dayEpoch.present ? data.dayEpoch.value : this.dayEpoch,
      setCount: data.setCount.present ? data.setCount.value : this.setCount,
      totalVolume: data.totalVolume.present
          ? data.totalVolume.value
          : this.totalVolume,
      totalReps: data.totalReps.present ? data.totalReps.value : this.totalReps,
      maxWeight: data.maxWeight.present ? data.maxWeight.value : this.maxWeight,
      minWeight: data.minWeight.present ? data.minWeight.value : this.minWeight,
      oneRepMax: data.oneRepMax.present ? data.oneRepMax.value : this.oneRepMax,
      totalDurationSeconds: data.totalDurationSeconds.present
          ? data.totalDurationSeconds.value
          : this.totalDurationSeconds,
      totalDistance: data.totalDistance.present
          ? data.totalDistance.value
          : this.totalDistance,
      maxSpeed: data.maxSpeed.present ? data.maxSpeed.value : this.maxSpeed,
      avgSpeed: data.avgSpeed.present ? data.avgSpeed.value : this.avgSpeed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryStatsRollupRow(')
          ..write('userId: $userId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('dayEpoch: $dayEpoch, ')
          ..write('setCount: $setCount, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalReps: $totalReps, ')
          ..write('maxWeight: $maxWeight, ')
          ..write('minWeight: $minWeight, ')
          ..write('oneRepMax: $oneRepMax, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('maxSpeed: $maxSpeed, ')
          ..write('avgSpeed: $avgSpeed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    userExerciseId,
    dayEpoch,
    setCount,
    totalVolume,
    totalReps,
    maxWeight,
    minWeight,
    oneRepMax,
    totalDurationSeconds,
    totalDistance,
    maxSpeed,
    avgSpeed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryStatsRollupRow &&
          other.userId == this.userId &&
          other.userExerciseId == this.userExerciseId &&
          other.dayEpoch == this.dayEpoch &&
          other.setCount == this.setCount &&
          other.totalVolume == this.totalVolume &&
          other.totalReps == this.totalReps &&
          other.maxWeight == this.maxWeight &&
          other.minWeight == this.minWeight &&
          other.oneRepMax == this.oneRepMax &&
          other.totalDurationSeconds == this.totalDurationSeconds &&
          other.totalDistance == this.totalDistance &&
          other.maxSpeed == this.maxSpeed &&
          other.avgSpeed == this.avgSpeed);
}

class HistoryStatsRollupTableCompanion
    extends UpdateCompanion<HistoryStatsRollupRow> {
  final Value<String> userId;
  final Value<String> userExerciseId;
  final Value<int> dayEpoch;
  final Value<int> setCount;
  final Value<double> totalVolume;
  final Value<int> totalReps;
  final Value<double?> maxWeight;
  final Value<double?> minWeight;
  final Value<double?> oneRepMax;
  final Value<int?> totalDurationSeconds;
  final Value<double?> totalDistance;
  final Value<double?> maxSpeed;
  final Value<double?> avgSpeed;
  final Value<int> rowid;
  const HistoryStatsRollupTableCompanion({
    this.userId = const Value.absent(),
    this.userExerciseId = const Value.absent(),
    this.dayEpoch = const Value.absent(),
    this.setCount = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalReps = const Value.absent(),
    this.maxWeight = const Value.absent(),
    this.minWeight = const Value.absent(),
    this.oneRepMax = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.maxSpeed = const Value.absent(),
    this.avgSpeed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistoryStatsRollupTableCompanion.insert({
    required String userId,
    required String userExerciseId,
    required int dayEpoch,
    this.setCount = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalReps = const Value.absent(),
    this.maxWeight = const Value.absent(),
    this.minWeight = const Value.absent(),
    this.oneRepMax = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.maxSpeed = const Value.absent(),
    this.avgSpeed = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       userExerciseId = Value(userExerciseId),
       dayEpoch = Value(dayEpoch);
  static Insertable<HistoryStatsRollupRow> custom({
    Expression<String>? userId,
    Expression<String>? userExerciseId,
    Expression<int>? dayEpoch,
    Expression<int>? setCount,
    Expression<double>? totalVolume,
    Expression<int>? totalReps,
    Expression<double>? maxWeight,
    Expression<double>? minWeight,
    Expression<double>? oneRepMax,
    Expression<int>? totalDurationSeconds,
    Expression<double>? totalDistance,
    Expression<double>? maxSpeed,
    Expression<double>? avgSpeed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (dayEpoch != null) 'day_epoch': dayEpoch,
      if (setCount != null) 'set_count': setCount,
      if (totalVolume != null) 'total_volume': totalVolume,
      if (totalReps != null) 'total_reps': totalReps,
      if (maxWeight != null) 'max_weight': maxWeight,
      if (minWeight != null) 'min_weight': minWeight,
      if (oneRepMax != null) 'one_rep_max': oneRepMax,
      if (totalDurationSeconds != null)
        'total_duration_seconds': totalDurationSeconds,
      if (totalDistance != null) 'total_distance': totalDistance,
      if (maxSpeed != null) 'max_speed': maxSpeed,
      if (avgSpeed != null) 'avg_speed': avgSpeed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistoryStatsRollupTableCompanion copyWith({
    Value<String>? userId,
    Value<String>? userExerciseId,
    Value<int>? dayEpoch,
    Value<int>? setCount,
    Value<double>? totalVolume,
    Value<int>? totalReps,
    Value<double?>? maxWeight,
    Value<double?>? minWeight,
    Value<double?>? oneRepMax,
    Value<int?>? totalDurationSeconds,
    Value<double?>? totalDistance,
    Value<double?>? maxSpeed,
    Value<double?>? avgSpeed,
    Value<int>? rowid,
  }) {
    return HistoryStatsRollupTableCompanion(
      userId: userId ?? this.userId,
      userExerciseId: userExerciseId ?? this.userExerciseId,
      dayEpoch: dayEpoch ?? this.dayEpoch,
      setCount: setCount ?? this.setCount,
      totalVolume: totalVolume ?? this.totalVolume,
      totalReps: totalReps ?? this.totalReps,
      maxWeight: maxWeight ?? this.maxWeight,
      minWeight: minWeight ?? this.minWeight,
      oneRepMax: oneRepMax ?? this.oneRepMax,
      totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
      totalDistance: totalDistance ?? this.totalDistance,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      avgSpeed: avgSpeed ?? this.avgSpeed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (dayEpoch.present) {
      map['day_epoch'] = Variable<int>(dayEpoch.value);
    }
    if (setCount.present) {
      map['set_count'] = Variable<int>(setCount.value);
    }
    if (totalVolume.present) {
      map['total_volume'] = Variable<double>(totalVolume.value);
    }
    if (totalReps.present) {
      map['total_reps'] = Variable<int>(totalReps.value);
    }
    if (maxWeight.present) {
      map['max_weight'] = Variable<double>(maxWeight.value);
    }
    if (minWeight.present) {
      map['min_weight'] = Variable<double>(minWeight.value);
    }
    if (oneRepMax.present) {
      map['one_rep_max'] = Variable<double>(oneRepMax.value);
    }
    if (totalDurationSeconds.present) {
      map['total_duration_seconds'] = Variable<int>(totalDurationSeconds.value);
    }
    if (totalDistance.present) {
      map['total_distance'] = Variable<double>(totalDistance.value);
    }
    if (maxSpeed.present) {
      map['max_speed'] = Variable<double>(maxSpeed.value);
    }
    if (avgSpeed.present) {
      map['avg_speed'] = Variable<double>(avgSpeed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryStatsRollupTableCompanion(')
          ..write('userId: $userId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('dayEpoch: $dayEpoch, ')
          ..write('setCount: $setCount, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalReps: $totalReps, ')
          ..write('maxWeight: $maxWeight, ')
          ..write('minWeight: $minWeight, ')
          ..write('oneRepMax: $oneRepMax, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('maxSpeed: $maxSpeed, ')
          ..write('avgSpeed: $avgSpeed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseOverallAggregateTableTable extends ExerciseOverallAggregateTable
    with
        TableInfo<
          $ExerciseOverallAggregateTableTable,
          ExerciseOverallAggregateRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseOverallAggregateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _timesCompletedMeta = const VerificationMeta(
    'timesCompleted',
  );
  @override
  late final GeneratedColumn<int> timesCompleted = GeneratedColumn<int>(
    'times_completed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _firstCompletedOnMeta = const VerificationMeta(
    'firstCompletedOn',
  );
  @override
  late final GeneratedColumn<int> firstCompletedOn = GeneratedColumn<int>(
    'first_completed_on',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastCompletedOnMeta = const VerificationMeta(
    'lastCompletedOn',
  );
  @override
  late final GeneratedColumn<int> lastCompletedOn = GeneratedColumn<int>(
    'last_completed_on',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalVolumeMeta = const VerificationMeta(
    'totalVolume',
  );
  @override
  late final GeneratedColumn<double> totalVolume = GeneratedColumn<double>(
    'total_volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalRepsMeta = const VerificationMeta(
    'totalReps',
  );
  @override
  late final GeneratedColumn<int> totalReps = GeneratedColumn<int>(
    'total_reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalSetsMeta = const VerificationMeta(
    'totalSets',
  );
  @override
  late final GeneratedColumn<int> totalSets = GeneratedColumn<int>(
    'total_sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalDurationSecondsMeta =
      const VerificationMeta('totalDurationSeconds');
  @override
  late final GeneratedColumn<int> totalDurationSeconds = GeneratedColumn<int>(
    'total_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalDistanceMeta = const VerificationMeta(
    'totalDistance',
  );
  @override
  late final GeneratedColumn<double> totalDistance = GeneratedColumn<double>(
    'total_distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pbMaxWeightMeta = const VerificationMeta(
    'pbMaxWeight',
  );
  @override
  late final GeneratedColumn<double> pbMaxWeight = GeneratedColumn<double>(
    'pb_max_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pbOneRepMaxMeta = const VerificationMeta(
    'pbOneRepMax',
  );
  @override
  late final GeneratedColumn<double> pbOneRepMax = GeneratedColumn<double>(
    'pb_one_rep_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pbMaxRepsSetMeta = const VerificationMeta(
    'pbMaxRepsSet',
  );
  @override
  late final GeneratedColumn<int> pbMaxRepsSet = GeneratedColumn<int>(
    'pb_max_reps_set',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pbMaxVolumeSessionMeta =
      const VerificationMeta('pbMaxVolumeSession');
  @override
  late final GeneratedColumn<double> pbMaxVolumeSession =
      GeneratedColumn<double>(
        'pb_max_volume_session',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pbMaxDistanceMeta = const VerificationMeta(
    'pbMaxDistance',
  );
  @override
  late final GeneratedColumn<double> pbMaxDistance = GeneratedColumn<double>(
    'pb_max_distance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pbMaxSpeedMeta = const VerificationMeta(
    'pbMaxSpeed',
  );
  @override
  late final GeneratedColumn<double> pbMaxSpeed = GeneratedColumn<double>(
    'pb_max_speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pbMaxDurationSecondsMeta =
      const VerificationMeta('pbMaxDurationSeconds');
  @override
  late final GeneratedColumn<int> pbMaxDurationSeconds = GeneratedColumn<int>(
    'pb_max_duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userExerciseId,
    userId,
    timesCompleted,
    firstCompletedOn,
    lastCompletedOn,
    totalVolume,
    totalReps,
    totalSets,
    totalDurationSeconds,
    totalDistance,
    pbMaxWeight,
    pbOneRepMax,
    pbMaxRepsSet,
    pbMaxVolumeSession,
    pbMaxDistance,
    pbMaxSpeed,
    pbMaxDurationSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_overall_aggregate_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseOverallAggregateRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userExerciseIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('times_completed')) {
      context.handle(
        _timesCompletedMeta,
        timesCompleted.isAcceptableOrUnknown(
          data['times_completed']!,
          _timesCompletedMeta,
        ),
      );
    }
    if (data.containsKey('first_completed_on')) {
      context.handle(
        _firstCompletedOnMeta,
        firstCompletedOn.isAcceptableOrUnknown(
          data['first_completed_on']!,
          _firstCompletedOnMeta,
        ),
      );
    }
    if (data.containsKey('last_completed_on')) {
      context.handle(
        _lastCompletedOnMeta,
        lastCompletedOn.isAcceptableOrUnknown(
          data['last_completed_on']!,
          _lastCompletedOnMeta,
        ),
      );
    }
    if (data.containsKey('total_volume')) {
      context.handle(
        _totalVolumeMeta,
        totalVolume.isAcceptableOrUnknown(
          data['total_volume']!,
          _totalVolumeMeta,
        ),
      );
    }
    if (data.containsKey('total_reps')) {
      context.handle(
        _totalRepsMeta,
        totalReps.isAcceptableOrUnknown(data['total_reps']!, _totalRepsMeta),
      );
    }
    if (data.containsKey('total_sets')) {
      context.handle(
        _totalSetsMeta,
        totalSets.isAcceptableOrUnknown(data['total_sets']!, _totalSetsMeta),
      );
    }
    if (data.containsKey('total_duration_seconds')) {
      context.handle(
        _totalDurationSecondsMeta,
        totalDurationSeconds.isAcceptableOrUnknown(
          data['total_duration_seconds']!,
          _totalDurationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('total_distance')) {
      context.handle(
        _totalDistanceMeta,
        totalDistance.isAcceptableOrUnknown(
          data['total_distance']!,
          _totalDistanceMeta,
        ),
      );
    }
    if (data.containsKey('pb_max_weight')) {
      context.handle(
        _pbMaxWeightMeta,
        pbMaxWeight.isAcceptableOrUnknown(
          data['pb_max_weight']!,
          _pbMaxWeightMeta,
        ),
      );
    }
    if (data.containsKey('pb_one_rep_max')) {
      context.handle(
        _pbOneRepMaxMeta,
        pbOneRepMax.isAcceptableOrUnknown(
          data['pb_one_rep_max']!,
          _pbOneRepMaxMeta,
        ),
      );
    }
    if (data.containsKey('pb_max_reps_set')) {
      context.handle(
        _pbMaxRepsSetMeta,
        pbMaxRepsSet.isAcceptableOrUnknown(
          data['pb_max_reps_set']!,
          _pbMaxRepsSetMeta,
        ),
      );
    }
    if (data.containsKey('pb_max_volume_session')) {
      context.handle(
        _pbMaxVolumeSessionMeta,
        pbMaxVolumeSession.isAcceptableOrUnknown(
          data['pb_max_volume_session']!,
          _pbMaxVolumeSessionMeta,
        ),
      );
    }
    if (data.containsKey('pb_max_distance')) {
      context.handle(
        _pbMaxDistanceMeta,
        pbMaxDistance.isAcceptableOrUnknown(
          data['pb_max_distance']!,
          _pbMaxDistanceMeta,
        ),
      );
    }
    if (data.containsKey('pb_max_speed')) {
      context.handle(
        _pbMaxSpeedMeta,
        pbMaxSpeed.isAcceptableOrUnknown(
          data['pb_max_speed']!,
          _pbMaxSpeedMeta,
        ),
      );
    }
    if (data.containsKey('pb_max_duration_seconds')) {
      context.handle(
        _pbMaxDurationSecondsMeta,
        pbMaxDurationSeconds.isAcceptableOrUnknown(
          data['pb_max_duration_seconds']!,
          _pbMaxDurationSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userExerciseId};
  @override
  ExerciseOverallAggregateRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseOverallAggregateRow(
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      timesCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}times_completed'],
      )!,
      firstCompletedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_completed_on'],
      ),
      lastCompletedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_completed_on'],
      ),
      totalVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_volume'],
      )!,
      totalReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_reps'],
      )!,
      totalSets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sets'],
      )!,
      totalDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_duration_seconds'],
      )!,
      totalDistance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_distance'],
      )!,
      pbMaxWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pb_max_weight'],
      ),
      pbOneRepMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pb_one_rep_max'],
      ),
      pbMaxRepsSet: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pb_max_reps_set'],
      ),
      pbMaxVolumeSession: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pb_max_volume_session'],
      ),
      pbMaxDistance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pb_max_distance'],
      ),
      pbMaxSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pb_max_speed'],
      ),
      pbMaxDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pb_max_duration_seconds'],
      ),
    );
  }

  @override
  $ExerciseOverallAggregateTableTable createAlias(String alias) {
    return $ExerciseOverallAggregateTableTable(attachedDatabase, alias);
  }
}

class ExerciseOverallAggregateRow extends DataClass
    implements Insertable<ExerciseOverallAggregateRow> {
  final String userExerciseId;
  final String userId;
  final int timesCompleted;
  final int? firstCompletedOn;
  final int? lastCompletedOn;
  final double totalVolume;
  final int totalReps;
  final int totalSets;
  final int totalDurationSeconds;
  final double totalDistance;
  final double? pbMaxWeight;
  final double? pbOneRepMax;
  final int? pbMaxRepsSet;
  final double? pbMaxVolumeSession;
  final double? pbMaxDistance;
  final double? pbMaxSpeed;
  final int? pbMaxDurationSeconds;
  const ExerciseOverallAggregateRow({
    required this.userExerciseId,
    required this.userId,
    required this.timesCompleted,
    this.firstCompletedOn,
    this.lastCompletedOn,
    required this.totalVolume,
    required this.totalReps,
    required this.totalSets,
    required this.totalDurationSeconds,
    required this.totalDistance,
    this.pbMaxWeight,
    this.pbOneRepMax,
    this.pbMaxRepsSet,
    this.pbMaxVolumeSession,
    this.pbMaxDistance,
    this.pbMaxSpeed,
    this.pbMaxDurationSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_exercise_id'] = Variable<String>(userExerciseId);
    map['user_id'] = Variable<String>(userId);
    map['times_completed'] = Variable<int>(timesCompleted);
    if (!nullToAbsent || firstCompletedOn != null) {
      map['first_completed_on'] = Variable<int>(firstCompletedOn);
    }
    if (!nullToAbsent || lastCompletedOn != null) {
      map['last_completed_on'] = Variable<int>(lastCompletedOn);
    }
    map['total_volume'] = Variable<double>(totalVolume);
    map['total_reps'] = Variable<int>(totalReps);
    map['total_sets'] = Variable<int>(totalSets);
    map['total_duration_seconds'] = Variable<int>(totalDurationSeconds);
    map['total_distance'] = Variable<double>(totalDistance);
    if (!nullToAbsent || pbMaxWeight != null) {
      map['pb_max_weight'] = Variable<double>(pbMaxWeight);
    }
    if (!nullToAbsent || pbOneRepMax != null) {
      map['pb_one_rep_max'] = Variable<double>(pbOneRepMax);
    }
    if (!nullToAbsent || pbMaxRepsSet != null) {
      map['pb_max_reps_set'] = Variable<int>(pbMaxRepsSet);
    }
    if (!nullToAbsent || pbMaxVolumeSession != null) {
      map['pb_max_volume_session'] = Variable<double>(pbMaxVolumeSession);
    }
    if (!nullToAbsent || pbMaxDistance != null) {
      map['pb_max_distance'] = Variable<double>(pbMaxDistance);
    }
    if (!nullToAbsent || pbMaxSpeed != null) {
      map['pb_max_speed'] = Variable<double>(pbMaxSpeed);
    }
    if (!nullToAbsent || pbMaxDurationSeconds != null) {
      map['pb_max_duration_seconds'] = Variable<int>(pbMaxDurationSeconds);
    }
    return map;
  }

  ExerciseOverallAggregateTableCompanion toCompanion(bool nullToAbsent) {
    return ExerciseOverallAggregateTableCompanion(
      userExerciseId: Value(userExerciseId),
      userId: Value(userId),
      timesCompleted: Value(timesCompleted),
      firstCompletedOn: firstCompletedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(firstCompletedOn),
      lastCompletedOn: lastCompletedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedOn),
      totalVolume: Value(totalVolume),
      totalReps: Value(totalReps),
      totalSets: Value(totalSets),
      totalDurationSeconds: Value(totalDurationSeconds),
      totalDistance: Value(totalDistance),
      pbMaxWeight: pbMaxWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(pbMaxWeight),
      pbOneRepMax: pbOneRepMax == null && nullToAbsent
          ? const Value.absent()
          : Value(pbOneRepMax),
      pbMaxRepsSet: pbMaxRepsSet == null && nullToAbsent
          ? const Value.absent()
          : Value(pbMaxRepsSet),
      pbMaxVolumeSession: pbMaxVolumeSession == null && nullToAbsent
          ? const Value.absent()
          : Value(pbMaxVolumeSession),
      pbMaxDistance: pbMaxDistance == null && nullToAbsent
          ? const Value.absent()
          : Value(pbMaxDistance),
      pbMaxSpeed: pbMaxSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(pbMaxSpeed),
      pbMaxDurationSeconds: pbMaxDurationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(pbMaxDurationSeconds),
    );
  }

  factory ExerciseOverallAggregateRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseOverallAggregateRow(
      userExerciseId: serializer.fromJson<String>(json['userExerciseId']),
      userId: serializer.fromJson<String>(json['userId']),
      timesCompleted: serializer.fromJson<int>(json['timesCompleted']),
      firstCompletedOn: serializer.fromJson<int?>(json['firstCompletedOn']),
      lastCompletedOn: serializer.fromJson<int?>(json['lastCompletedOn']),
      totalVolume: serializer.fromJson<double>(json['totalVolume']),
      totalReps: serializer.fromJson<int>(json['totalReps']),
      totalSets: serializer.fromJson<int>(json['totalSets']),
      totalDurationSeconds: serializer.fromJson<int>(
        json['totalDurationSeconds'],
      ),
      totalDistance: serializer.fromJson<double>(json['totalDistance']),
      pbMaxWeight: serializer.fromJson<double?>(json['pbMaxWeight']),
      pbOneRepMax: serializer.fromJson<double?>(json['pbOneRepMax']),
      pbMaxRepsSet: serializer.fromJson<int?>(json['pbMaxRepsSet']),
      pbMaxVolumeSession: serializer.fromJson<double?>(
        json['pbMaxVolumeSession'],
      ),
      pbMaxDistance: serializer.fromJson<double?>(json['pbMaxDistance']),
      pbMaxSpeed: serializer.fromJson<double?>(json['pbMaxSpeed']),
      pbMaxDurationSeconds: serializer.fromJson<int?>(
        json['pbMaxDurationSeconds'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userExerciseId': serializer.toJson<String>(userExerciseId),
      'userId': serializer.toJson<String>(userId),
      'timesCompleted': serializer.toJson<int>(timesCompleted),
      'firstCompletedOn': serializer.toJson<int?>(firstCompletedOn),
      'lastCompletedOn': serializer.toJson<int?>(lastCompletedOn),
      'totalVolume': serializer.toJson<double>(totalVolume),
      'totalReps': serializer.toJson<int>(totalReps),
      'totalSets': serializer.toJson<int>(totalSets),
      'totalDurationSeconds': serializer.toJson<int>(totalDurationSeconds),
      'totalDistance': serializer.toJson<double>(totalDistance),
      'pbMaxWeight': serializer.toJson<double?>(pbMaxWeight),
      'pbOneRepMax': serializer.toJson<double?>(pbOneRepMax),
      'pbMaxRepsSet': serializer.toJson<int?>(pbMaxRepsSet),
      'pbMaxVolumeSession': serializer.toJson<double?>(pbMaxVolumeSession),
      'pbMaxDistance': serializer.toJson<double?>(pbMaxDistance),
      'pbMaxSpeed': serializer.toJson<double?>(pbMaxSpeed),
      'pbMaxDurationSeconds': serializer.toJson<int?>(pbMaxDurationSeconds),
    };
  }

  ExerciseOverallAggregateRow copyWith({
    String? userExerciseId,
    String? userId,
    int? timesCompleted,
    Value<int?> firstCompletedOn = const Value.absent(),
    Value<int?> lastCompletedOn = const Value.absent(),
    double? totalVolume,
    int? totalReps,
    int? totalSets,
    int? totalDurationSeconds,
    double? totalDistance,
    Value<double?> pbMaxWeight = const Value.absent(),
    Value<double?> pbOneRepMax = const Value.absent(),
    Value<int?> pbMaxRepsSet = const Value.absent(),
    Value<double?> pbMaxVolumeSession = const Value.absent(),
    Value<double?> pbMaxDistance = const Value.absent(),
    Value<double?> pbMaxSpeed = const Value.absent(),
    Value<int?> pbMaxDurationSeconds = const Value.absent(),
  }) => ExerciseOverallAggregateRow(
    userExerciseId: userExerciseId ?? this.userExerciseId,
    userId: userId ?? this.userId,
    timesCompleted: timesCompleted ?? this.timesCompleted,
    firstCompletedOn: firstCompletedOn.present
        ? firstCompletedOn.value
        : this.firstCompletedOn,
    lastCompletedOn: lastCompletedOn.present
        ? lastCompletedOn.value
        : this.lastCompletedOn,
    totalVolume: totalVolume ?? this.totalVolume,
    totalReps: totalReps ?? this.totalReps,
    totalSets: totalSets ?? this.totalSets,
    totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
    totalDistance: totalDistance ?? this.totalDistance,
    pbMaxWeight: pbMaxWeight.present ? pbMaxWeight.value : this.pbMaxWeight,
    pbOneRepMax: pbOneRepMax.present ? pbOneRepMax.value : this.pbOneRepMax,
    pbMaxRepsSet: pbMaxRepsSet.present ? pbMaxRepsSet.value : this.pbMaxRepsSet,
    pbMaxVolumeSession: pbMaxVolumeSession.present
        ? pbMaxVolumeSession.value
        : this.pbMaxVolumeSession,
    pbMaxDistance: pbMaxDistance.present
        ? pbMaxDistance.value
        : this.pbMaxDistance,
    pbMaxSpeed: pbMaxSpeed.present ? pbMaxSpeed.value : this.pbMaxSpeed,
    pbMaxDurationSeconds: pbMaxDurationSeconds.present
        ? pbMaxDurationSeconds.value
        : this.pbMaxDurationSeconds,
  );
  ExerciseOverallAggregateRow copyWithCompanion(
    ExerciseOverallAggregateTableCompanion data,
  ) {
    return ExerciseOverallAggregateRow(
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      userId: data.userId.present ? data.userId.value : this.userId,
      timesCompleted: data.timesCompleted.present
          ? data.timesCompleted.value
          : this.timesCompleted,
      firstCompletedOn: data.firstCompletedOn.present
          ? data.firstCompletedOn.value
          : this.firstCompletedOn,
      lastCompletedOn: data.lastCompletedOn.present
          ? data.lastCompletedOn.value
          : this.lastCompletedOn,
      totalVolume: data.totalVolume.present
          ? data.totalVolume.value
          : this.totalVolume,
      totalReps: data.totalReps.present ? data.totalReps.value : this.totalReps,
      totalSets: data.totalSets.present ? data.totalSets.value : this.totalSets,
      totalDurationSeconds: data.totalDurationSeconds.present
          ? data.totalDurationSeconds.value
          : this.totalDurationSeconds,
      totalDistance: data.totalDistance.present
          ? data.totalDistance.value
          : this.totalDistance,
      pbMaxWeight: data.pbMaxWeight.present
          ? data.pbMaxWeight.value
          : this.pbMaxWeight,
      pbOneRepMax: data.pbOneRepMax.present
          ? data.pbOneRepMax.value
          : this.pbOneRepMax,
      pbMaxRepsSet: data.pbMaxRepsSet.present
          ? data.pbMaxRepsSet.value
          : this.pbMaxRepsSet,
      pbMaxVolumeSession: data.pbMaxVolumeSession.present
          ? data.pbMaxVolumeSession.value
          : this.pbMaxVolumeSession,
      pbMaxDistance: data.pbMaxDistance.present
          ? data.pbMaxDistance.value
          : this.pbMaxDistance,
      pbMaxSpeed: data.pbMaxSpeed.present
          ? data.pbMaxSpeed.value
          : this.pbMaxSpeed,
      pbMaxDurationSeconds: data.pbMaxDurationSeconds.present
          ? data.pbMaxDurationSeconds.value
          : this.pbMaxDurationSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseOverallAggregateRow(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('userId: $userId, ')
          ..write('timesCompleted: $timesCompleted, ')
          ..write('firstCompletedOn: $firstCompletedOn, ')
          ..write('lastCompletedOn: $lastCompletedOn, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalReps: $totalReps, ')
          ..write('totalSets: $totalSets, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('pbMaxWeight: $pbMaxWeight, ')
          ..write('pbOneRepMax: $pbOneRepMax, ')
          ..write('pbMaxRepsSet: $pbMaxRepsSet, ')
          ..write('pbMaxVolumeSession: $pbMaxVolumeSession, ')
          ..write('pbMaxDistance: $pbMaxDistance, ')
          ..write('pbMaxSpeed: $pbMaxSpeed, ')
          ..write('pbMaxDurationSeconds: $pbMaxDurationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userExerciseId,
    userId,
    timesCompleted,
    firstCompletedOn,
    lastCompletedOn,
    totalVolume,
    totalReps,
    totalSets,
    totalDurationSeconds,
    totalDistance,
    pbMaxWeight,
    pbOneRepMax,
    pbMaxRepsSet,
    pbMaxVolumeSession,
    pbMaxDistance,
    pbMaxSpeed,
    pbMaxDurationSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseOverallAggregateRow &&
          other.userExerciseId == this.userExerciseId &&
          other.userId == this.userId &&
          other.timesCompleted == this.timesCompleted &&
          other.firstCompletedOn == this.firstCompletedOn &&
          other.lastCompletedOn == this.lastCompletedOn &&
          other.totalVolume == this.totalVolume &&
          other.totalReps == this.totalReps &&
          other.totalSets == this.totalSets &&
          other.totalDurationSeconds == this.totalDurationSeconds &&
          other.totalDistance == this.totalDistance &&
          other.pbMaxWeight == this.pbMaxWeight &&
          other.pbOneRepMax == this.pbOneRepMax &&
          other.pbMaxRepsSet == this.pbMaxRepsSet &&
          other.pbMaxVolumeSession == this.pbMaxVolumeSession &&
          other.pbMaxDistance == this.pbMaxDistance &&
          other.pbMaxSpeed == this.pbMaxSpeed &&
          other.pbMaxDurationSeconds == this.pbMaxDurationSeconds);
}

class ExerciseOverallAggregateTableCompanion
    extends UpdateCompanion<ExerciseOverallAggregateRow> {
  final Value<String> userExerciseId;
  final Value<String> userId;
  final Value<int> timesCompleted;
  final Value<int?> firstCompletedOn;
  final Value<int?> lastCompletedOn;
  final Value<double> totalVolume;
  final Value<int> totalReps;
  final Value<int> totalSets;
  final Value<int> totalDurationSeconds;
  final Value<double> totalDistance;
  final Value<double?> pbMaxWeight;
  final Value<double?> pbOneRepMax;
  final Value<int?> pbMaxRepsSet;
  final Value<double?> pbMaxVolumeSession;
  final Value<double?> pbMaxDistance;
  final Value<double?> pbMaxSpeed;
  final Value<int?> pbMaxDurationSeconds;
  final Value<int> rowid;
  const ExerciseOverallAggregateTableCompanion({
    this.userExerciseId = const Value.absent(),
    this.userId = const Value.absent(),
    this.timesCompleted = const Value.absent(),
    this.firstCompletedOn = const Value.absent(),
    this.lastCompletedOn = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalReps = const Value.absent(),
    this.totalSets = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.pbMaxWeight = const Value.absent(),
    this.pbOneRepMax = const Value.absent(),
    this.pbMaxRepsSet = const Value.absent(),
    this.pbMaxVolumeSession = const Value.absent(),
    this.pbMaxDistance = const Value.absent(),
    this.pbMaxSpeed = const Value.absent(),
    this.pbMaxDurationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseOverallAggregateTableCompanion.insert({
    required String userExerciseId,
    required String userId,
    this.timesCompleted = const Value.absent(),
    this.firstCompletedOn = const Value.absent(),
    this.lastCompletedOn = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalReps = const Value.absent(),
    this.totalSets = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.pbMaxWeight = const Value.absent(),
    this.pbOneRepMax = const Value.absent(),
    this.pbMaxRepsSet = const Value.absent(),
    this.pbMaxVolumeSession = const Value.absent(),
    this.pbMaxDistance = const Value.absent(),
    this.pbMaxSpeed = const Value.absent(),
    this.pbMaxDurationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userExerciseId = Value(userExerciseId),
       userId = Value(userId);
  static Insertable<ExerciseOverallAggregateRow> custom({
    Expression<String>? userExerciseId,
    Expression<String>? userId,
    Expression<int>? timesCompleted,
    Expression<int>? firstCompletedOn,
    Expression<int>? lastCompletedOn,
    Expression<double>? totalVolume,
    Expression<int>? totalReps,
    Expression<int>? totalSets,
    Expression<int>? totalDurationSeconds,
    Expression<double>? totalDistance,
    Expression<double>? pbMaxWeight,
    Expression<double>? pbOneRepMax,
    Expression<int>? pbMaxRepsSet,
    Expression<double>? pbMaxVolumeSession,
    Expression<double>? pbMaxDistance,
    Expression<double>? pbMaxSpeed,
    Expression<int>? pbMaxDurationSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (userId != null) 'user_id': userId,
      if (timesCompleted != null) 'times_completed': timesCompleted,
      if (firstCompletedOn != null) 'first_completed_on': firstCompletedOn,
      if (lastCompletedOn != null) 'last_completed_on': lastCompletedOn,
      if (totalVolume != null) 'total_volume': totalVolume,
      if (totalReps != null) 'total_reps': totalReps,
      if (totalSets != null) 'total_sets': totalSets,
      if (totalDurationSeconds != null)
        'total_duration_seconds': totalDurationSeconds,
      if (totalDistance != null) 'total_distance': totalDistance,
      if (pbMaxWeight != null) 'pb_max_weight': pbMaxWeight,
      if (pbOneRepMax != null) 'pb_one_rep_max': pbOneRepMax,
      if (pbMaxRepsSet != null) 'pb_max_reps_set': pbMaxRepsSet,
      if (pbMaxVolumeSession != null)
        'pb_max_volume_session': pbMaxVolumeSession,
      if (pbMaxDistance != null) 'pb_max_distance': pbMaxDistance,
      if (pbMaxSpeed != null) 'pb_max_speed': pbMaxSpeed,
      if (pbMaxDurationSeconds != null)
        'pb_max_duration_seconds': pbMaxDurationSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseOverallAggregateTableCompanion copyWith({
    Value<String>? userExerciseId,
    Value<String>? userId,
    Value<int>? timesCompleted,
    Value<int?>? firstCompletedOn,
    Value<int?>? lastCompletedOn,
    Value<double>? totalVolume,
    Value<int>? totalReps,
    Value<int>? totalSets,
    Value<int>? totalDurationSeconds,
    Value<double>? totalDistance,
    Value<double?>? pbMaxWeight,
    Value<double?>? pbOneRepMax,
    Value<int?>? pbMaxRepsSet,
    Value<double?>? pbMaxVolumeSession,
    Value<double?>? pbMaxDistance,
    Value<double?>? pbMaxSpeed,
    Value<int?>? pbMaxDurationSeconds,
    Value<int>? rowid,
  }) {
    return ExerciseOverallAggregateTableCompanion(
      userExerciseId: userExerciseId ?? this.userExerciseId,
      userId: userId ?? this.userId,
      timesCompleted: timesCompleted ?? this.timesCompleted,
      firstCompletedOn: firstCompletedOn ?? this.firstCompletedOn,
      lastCompletedOn: lastCompletedOn ?? this.lastCompletedOn,
      totalVolume: totalVolume ?? this.totalVolume,
      totalReps: totalReps ?? this.totalReps,
      totalSets: totalSets ?? this.totalSets,
      totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
      totalDistance: totalDistance ?? this.totalDistance,
      pbMaxWeight: pbMaxWeight ?? this.pbMaxWeight,
      pbOneRepMax: pbOneRepMax ?? this.pbOneRepMax,
      pbMaxRepsSet: pbMaxRepsSet ?? this.pbMaxRepsSet,
      pbMaxVolumeSession: pbMaxVolumeSession ?? this.pbMaxVolumeSession,
      pbMaxDistance: pbMaxDistance ?? this.pbMaxDistance,
      pbMaxSpeed: pbMaxSpeed ?? this.pbMaxSpeed,
      pbMaxDurationSeconds: pbMaxDurationSeconds ?? this.pbMaxDurationSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (timesCompleted.present) {
      map['times_completed'] = Variable<int>(timesCompleted.value);
    }
    if (firstCompletedOn.present) {
      map['first_completed_on'] = Variable<int>(firstCompletedOn.value);
    }
    if (lastCompletedOn.present) {
      map['last_completed_on'] = Variable<int>(lastCompletedOn.value);
    }
    if (totalVolume.present) {
      map['total_volume'] = Variable<double>(totalVolume.value);
    }
    if (totalReps.present) {
      map['total_reps'] = Variable<int>(totalReps.value);
    }
    if (totalSets.present) {
      map['total_sets'] = Variable<int>(totalSets.value);
    }
    if (totalDurationSeconds.present) {
      map['total_duration_seconds'] = Variable<int>(totalDurationSeconds.value);
    }
    if (totalDistance.present) {
      map['total_distance'] = Variable<double>(totalDistance.value);
    }
    if (pbMaxWeight.present) {
      map['pb_max_weight'] = Variable<double>(pbMaxWeight.value);
    }
    if (pbOneRepMax.present) {
      map['pb_one_rep_max'] = Variable<double>(pbOneRepMax.value);
    }
    if (pbMaxRepsSet.present) {
      map['pb_max_reps_set'] = Variable<int>(pbMaxRepsSet.value);
    }
    if (pbMaxVolumeSession.present) {
      map['pb_max_volume_session'] = Variable<double>(pbMaxVolumeSession.value);
    }
    if (pbMaxDistance.present) {
      map['pb_max_distance'] = Variable<double>(pbMaxDistance.value);
    }
    if (pbMaxSpeed.present) {
      map['pb_max_speed'] = Variable<double>(pbMaxSpeed.value);
    }
    if (pbMaxDurationSeconds.present) {
      map['pb_max_duration_seconds'] = Variable<int>(
        pbMaxDurationSeconds.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseOverallAggregateTableCompanion(')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('userId: $userId, ')
          ..write('timesCompleted: $timesCompleted, ')
          ..write('firstCompletedOn: $firstCompletedOn, ')
          ..write('lastCompletedOn: $lastCompletedOn, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalReps: $totalReps, ')
          ..write('totalSets: $totalSets, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('pbMaxWeight: $pbMaxWeight, ')
          ..write('pbOneRepMax: $pbOneRepMax, ')
          ..write('pbMaxRepsSet: $pbMaxRepsSet, ')
          ..write('pbMaxVolumeSession: $pbMaxVolumeSession, ')
          ..write('pbMaxDistance: $pbMaxDistance, ')
          ..write('pbMaxSpeed: $pbMaxSpeed, ')
          ..write('pbMaxDurationSeconds: $pbMaxDurationSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonalRecordEventTableTable extends PersonalRecordEventTable
    with TableInfo<$PersonalRecordEventTableTable, PersonalRecordEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalRecordEventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userExerciseIdMeta = const VerificationMeta(
    'userExerciseId',
  );
  @override
  late final GeneratedColumn<String> userExerciseId = GeneratedColumn<String>(
    'user_exercise_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_exercise_table (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _exerciseNameSnapshotMeta =
      const VerificationMeta('exerciseNameSnapshot');
  @override
  late final GeneratedColumn<String> exerciseNameSnapshot =
      GeneratedColumn<String>(
        'exercise_name_snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _metricMeta = const VerificationMeta('metric');
  @override
  late final GeneratedColumn<String> metric = GeneratedColumn<String>(
    'metric',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _previousValueMeta = const VerificationMeta(
    'previousValue',
  );
  @override
  late final GeneratedColumn<double> previousValue = GeneratedColumn<double>(
    'previous_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _achievedAtMeta = const VerificationMeta(
    'achievedAt',
  );
  @override
  late final GeneratedColumn<int> achievedAt = GeneratedColumn<int>(
    'achieved_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    userExerciseId,
    exerciseNameSnapshot,
    metric,
    value,
    previousValue,
    achievedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personal_record_event_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonalRecordEventRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_exercise_id')) {
      context.handle(
        _userExerciseIdMeta,
        userExerciseId.isAcceptableOrUnknown(
          data['user_exercise_id']!,
          _userExerciseIdMeta,
        ),
      );
    }
    if (data.containsKey('exercise_name_snapshot')) {
      context.handle(
        _exerciseNameSnapshotMeta,
        exerciseNameSnapshot.isAcceptableOrUnknown(
          data['exercise_name_snapshot']!,
          _exerciseNameSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseNameSnapshotMeta);
    }
    if (data.containsKey('metric')) {
      context.handle(
        _metricMeta,
        metric.isAcceptableOrUnknown(data['metric']!, _metricMeta),
      );
    } else if (isInserting) {
      context.missing(_metricMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('previous_value')) {
      context.handle(
        _previousValueMeta,
        previousValue.isAcceptableOrUnknown(
          data['previous_value']!,
          _previousValueMeta,
        ),
      );
    }
    if (data.containsKey('achieved_at')) {
      context.handle(
        _achievedAtMeta,
        achievedAt.isAcceptableOrUnknown(data['achieved_at']!, _achievedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_achievedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonalRecordEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonalRecordEventRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      userExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_exercise_id'],
      ),
      exerciseNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_name_snapshot'],
      )!,
      metric: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metric'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      previousValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}previous_value'],
      ),
      achievedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}achieved_at'],
      )!,
    );
  }

  @override
  $PersonalRecordEventTableTable createAlias(String alias) {
    return $PersonalRecordEventTableTable(attachedDatabase, alias);
  }
}

class PersonalRecordEventRow extends DataClass
    implements Insertable<PersonalRecordEventRow> {
  final String id;
  final String userId;
  final String? userExerciseId;
  final String exerciseNameSnapshot;

  /// TrackedMetricsPr.name (e.g. 'maxWeight', 'oneRepMax').
  final String metric;
  final double value;
  final double? previousValue;
  final int achievedAt;
  const PersonalRecordEventRow({
    required this.id,
    required this.userId,
    this.userExerciseId,
    required this.exerciseNameSnapshot,
    required this.metric,
    required this.value,
    this.previousValue,
    required this.achievedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || userExerciseId != null) {
      map['user_exercise_id'] = Variable<String>(userExerciseId);
    }
    map['exercise_name_snapshot'] = Variable<String>(exerciseNameSnapshot);
    map['metric'] = Variable<String>(metric);
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || previousValue != null) {
      map['previous_value'] = Variable<double>(previousValue);
    }
    map['achieved_at'] = Variable<int>(achievedAt);
    return map;
  }

  PersonalRecordEventTableCompanion toCompanion(bool nullToAbsent) {
    return PersonalRecordEventTableCompanion(
      id: Value(id),
      userId: Value(userId),
      userExerciseId: userExerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(userExerciseId),
      exerciseNameSnapshot: Value(exerciseNameSnapshot),
      metric: Value(metric),
      value: Value(value),
      previousValue: previousValue == null && nullToAbsent
          ? const Value.absent()
          : Value(previousValue),
      achievedAt: Value(achievedAt),
    );
  }

  factory PersonalRecordEventRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonalRecordEventRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      userExerciseId: serializer.fromJson<String?>(json['userExerciseId']),
      exerciseNameSnapshot: serializer.fromJson<String>(
        json['exerciseNameSnapshot'],
      ),
      metric: serializer.fromJson<String>(json['metric']),
      value: serializer.fromJson<double>(json['value']),
      previousValue: serializer.fromJson<double?>(json['previousValue']),
      achievedAt: serializer.fromJson<int>(json['achievedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'userExerciseId': serializer.toJson<String?>(userExerciseId),
      'exerciseNameSnapshot': serializer.toJson<String>(exerciseNameSnapshot),
      'metric': serializer.toJson<String>(metric),
      'value': serializer.toJson<double>(value),
      'previousValue': serializer.toJson<double?>(previousValue),
      'achievedAt': serializer.toJson<int>(achievedAt),
    };
  }

  PersonalRecordEventRow copyWith({
    String? id,
    String? userId,
    Value<String?> userExerciseId = const Value.absent(),
    String? exerciseNameSnapshot,
    String? metric,
    double? value,
    Value<double?> previousValue = const Value.absent(),
    int? achievedAt,
  }) => PersonalRecordEventRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    userExerciseId: userExerciseId.present
        ? userExerciseId.value
        : this.userExerciseId,
    exerciseNameSnapshot: exerciseNameSnapshot ?? this.exerciseNameSnapshot,
    metric: metric ?? this.metric,
    value: value ?? this.value,
    previousValue: previousValue.present
        ? previousValue.value
        : this.previousValue,
    achievedAt: achievedAt ?? this.achievedAt,
  );
  PersonalRecordEventRow copyWithCompanion(
    PersonalRecordEventTableCompanion data,
  ) {
    return PersonalRecordEventRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      userExerciseId: data.userExerciseId.present
          ? data.userExerciseId.value
          : this.userExerciseId,
      exerciseNameSnapshot: data.exerciseNameSnapshot.present
          ? data.exerciseNameSnapshot.value
          : this.exerciseNameSnapshot,
      metric: data.metric.present ? data.metric.value : this.metric,
      value: data.value.present ? data.value.value : this.value,
      previousValue: data.previousValue.present
          ? data.previousValue.value
          : this.previousValue,
      achievedAt: data.achievedAt.present
          ? data.achievedAt.value
          : this.achievedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonalRecordEventRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('exerciseNameSnapshot: $exerciseNameSnapshot, ')
          ..write('metric: $metric, ')
          ..write('value: $value, ')
          ..write('previousValue: $previousValue, ')
          ..write('achievedAt: $achievedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    userExerciseId,
    exerciseNameSnapshot,
    metric,
    value,
    previousValue,
    achievedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalRecordEventRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.userExerciseId == this.userExerciseId &&
          other.exerciseNameSnapshot == this.exerciseNameSnapshot &&
          other.metric == this.metric &&
          other.value == this.value &&
          other.previousValue == this.previousValue &&
          other.achievedAt == this.achievedAt);
}

class PersonalRecordEventTableCompanion
    extends UpdateCompanion<PersonalRecordEventRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> userExerciseId;
  final Value<String> exerciseNameSnapshot;
  final Value<String> metric;
  final Value<double> value;
  final Value<double?> previousValue;
  final Value<int> achievedAt;
  final Value<int> rowid;
  const PersonalRecordEventTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.userExerciseId = const Value.absent(),
    this.exerciseNameSnapshot = const Value.absent(),
    this.metric = const Value.absent(),
    this.value = const Value.absent(),
    this.previousValue = const Value.absent(),
    this.achievedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonalRecordEventTableCompanion.insert({
    required String id,
    required String userId,
    this.userExerciseId = const Value.absent(),
    required String exerciseNameSnapshot,
    required String metric,
    required double value,
    this.previousValue = const Value.absent(),
    required int achievedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       exerciseNameSnapshot = Value(exerciseNameSnapshot),
       metric = Value(metric),
       value = Value(value),
       achievedAt = Value(achievedAt);
  static Insertable<PersonalRecordEventRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? userExerciseId,
    Expression<String>? exerciseNameSnapshot,
    Expression<String>? metric,
    Expression<double>? value,
    Expression<double>? previousValue,
    Expression<int>? achievedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (userExerciseId != null) 'user_exercise_id': userExerciseId,
      if (exerciseNameSnapshot != null)
        'exercise_name_snapshot': exerciseNameSnapshot,
      if (metric != null) 'metric': metric,
      if (value != null) 'value': value,
      if (previousValue != null) 'previous_value': previousValue,
      if (achievedAt != null) 'achieved_at': achievedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonalRecordEventTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String?>? userExerciseId,
    Value<String>? exerciseNameSnapshot,
    Value<String>? metric,
    Value<double>? value,
    Value<double?>? previousValue,
    Value<int>? achievedAt,
    Value<int>? rowid,
  }) {
    return PersonalRecordEventTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userExerciseId: userExerciseId ?? this.userExerciseId,
      exerciseNameSnapshot: exerciseNameSnapshot ?? this.exerciseNameSnapshot,
      metric: metric ?? this.metric,
      value: value ?? this.value,
      previousValue: previousValue ?? this.previousValue,
      achievedAt: achievedAt ?? this.achievedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userExerciseId.present) {
      map['user_exercise_id'] = Variable<String>(userExerciseId.value);
    }
    if (exerciseNameSnapshot.present) {
      map['exercise_name_snapshot'] = Variable<String>(
        exerciseNameSnapshot.value,
      );
    }
    if (metric.present) {
      map['metric'] = Variable<String>(metric.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (previousValue.present) {
      map['previous_value'] = Variable<double>(previousValue.value);
    }
    if (achievedAt.present) {
      map['achieved_at'] = Variable<int>(achievedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalRecordEventTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userExerciseId: $userExerciseId, ')
          ..write('exerciseNameSnapshot: $exerciseNameSnapshot, ')
          ..write('metric: $metric, ')
          ..write('value: $value, ')
          ..write('previousValue: $previousValue, ')
          ..write('achievedAt: $achievedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserOverallStatsTableTable extends UserOverallStatsTable
    with TableInfo<$UserOverallStatsTableTable, UserOverallStatsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserOverallStatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _totalWorkoutsMeta = const VerificationMeta(
    'totalWorkouts',
  );
  @override
  late final GeneratedColumn<int> totalWorkouts = GeneratedColumn<int>(
    'total_workouts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalVolumeMeta = const VerificationMeta(
    'totalVolume',
  );
  @override
  late final GeneratedColumn<double> totalVolume = GeneratedColumn<double>(
    'total_volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalDistanceMeta = const VerificationMeta(
    'totalDistance',
  );
  @override
  late final GeneratedColumn<double> totalDistance = GeneratedColumn<double>(
    'total_distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalSetsMeta = const VerificationMeta(
    'totalSets',
  );
  @override
  late final GeneratedColumn<int> totalSets = GeneratedColumn<int>(
    'total_sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalDurationSecondsMeta =
      const VerificationMeta('totalDurationSeconds');
  @override
  late final GeneratedColumn<int> totalDurationSeconds = GeneratedColumn<int>(
    'total_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalExercisesPerformedMeta =
      const VerificationMeta('totalExercisesPerformed');
  @override
  late final GeneratedColumn<int> totalExercisesPerformed =
      GeneratedColumn<int>(
        'total_exercises_performed',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _strongestDayEpochMeta = const VerificationMeta(
    'strongestDayEpoch',
  );
  @override
  late final GeneratedColumn<int> strongestDayEpoch = GeneratedColumn<int>(
    'strongest_day_epoch',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strongestDayVolumeMeta =
      const VerificationMeta('strongestDayVolume');
  @override
  late final GeneratedColumn<double> strongestDayVolume =
      GeneratedColumn<double>(
        'strongest_day_volume',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _longestDayEpochMeta = const VerificationMeta(
    'longestDayEpoch',
  );
  @override
  late final GeneratedColumn<int> longestDayEpoch = GeneratedColumn<int>(
    'longest_day_epoch',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longestDayDurationSecondsMeta =
      const VerificationMeta('longestDayDurationSeconds');
  @override
  late final GeneratedColumn<int> longestDayDurationSeconds =
      GeneratedColumn<int>(
        'longest_day_duration_seconds',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    totalWorkouts,
    totalVolume,
    totalDistance,
    totalSets,
    totalDurationSeconds,
    totalExercisesPerformed,
    strongestDayEpoch,
    strongestDayVolume,
    longestDayEpoch,
    longestDayDurationSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_overall_stats_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserOverallStatsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('total_workouts')) {
      context.handle(
        _totalWorkoutsMeta,
        totalWorkouts.isAcceptableOrUnknown(
          data['total_workouts']!,
          _totalWorkoutsMeta,
        ),
      );
    }
    if (data.containsKey('total_volume')) {
      context.handle(
        _totalVolumeMeta,
        totalVolume.isAcceptableOrUnknown(
          data['total_volume']!,
          _totalVolumeMeta,
        ),
      );
    }
    if (data.containsKey('total_distance')) {
      context.handle(
        _totalDistanceMeta,
        totalDistance.isAcceptableOrUnknown(
          data['total_distance']!,
          _totalDistanceMeta,
        ),
      );
    }
    if (data.containsKey('total_sets')) {
      context.handle(
        _totalSetsMeta,
        totalSets.isAcceptableOrUnknown(data['total_sets']!, _totalSetsMeta),
      );
    }
    if (data.containsKey('total_duration_seconds')) {
      context.handle(
        _totalDurationSecondsMeta,
        totalDurationSeconds.isAcceptableOrUnknown(
          data['total_duration_seconds']!,
          _totalDurationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('total_exercises_performed')) {
      context.handle(
        _totalExercisesPerformedMeta,
        totalExercisesPerformed.isAcceptableOrUnknown(
          data['total_exercises_performed']!,
          _totalExercisesPerformedMeta,
        ),
      );
    }
    if (data.containsKey('strongest_day_epoch')) {
      context.handle(
        _strongestDayEpochMeta,
        strongestDayEpoch.isAcceptableOrUnknown(
          data['strongest_day_epoch']!,
          _strongestDayEpochMeta,
        ),
      );
    }
    if (data.containsKey('strongest_day_volume')) {
      context.handle(
        _strongestDayVolumeMeta,
        strongestDayVolume.isAcceptableOrUnknown(
          data['strongest_day_volume']!,
          _strongestDayVolumeMeta,
        ),
      );
    }
    if (data.containsKey('longest_day_epoch')) {
      context.handle(
        _longestDayEpochMeta,
        longestDayEpoch.isAcceptableOrUnknown(
          data['longest_day_epoch']!,
          _longestDayEpochMeta,
        ),
      );
    }
    if (data.containsKey('longest_day_duration_seconds')) {
      context.handle(
        _longestDayDurationSecondsMeta,
        longestDayDurationSeconds.isAcceptableOrUnknown(
          data['longest_day_duration_seconds']!,
          _longestDayDurationSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserOverallStatsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserOverallStatsRow(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      totalWorkouts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_workouts'],
      )!,
      totalVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_volume'],
      )!,
      totalDistance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_distance'],
      )!,
      totalSets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sets'],
      )!,
      totalDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_duration_seconds'],
      )!,
      totalExercisesPerformed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_exercises_performed'],
      )!,
      strongestDayEpoch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}strongest_day_epoch'],
      ),
      strongestDayVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}strongest_day_volume'],
      )!,
      longestDayEpoch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_day_epoch'],
      ),
      longestDayDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_day_duration_seconds'],
      )!,
    );
  }

  @override
  $UserOverallStatsTableTable createAlias(String alias) {
    return $UserOverallStatsTableTable(attachedDatabase, alias);
  }
}

class UserOverallStatsRow extends DataClass
    implements Insertable<UserOverallStatsRow> {
  final String userId;
  final int totalWorkouts;
  final double totalVolume;
  final double totalDistance;
  final int totalSets;
  final int totalDurationSeconds;
  final int totalExercisesPerformed;
  final int? strongestDayEpoch;
  final double strongestDayVolume;
  final int? longestDayEpoch;
  final int longestDayDurationSeconds;
  const UserOverallStatsRow({
    required this.userId,
    required this.totalWorkouts,
    required this.totalVolume,
    required this.totalDistance,
    required this.totalSets,
    required this.totalDurationSeconds,
    required this.totalExercisesPerformed,
    this.strongestDayEpoch,
    required this.strongestDayVolume,
    this.longestDayEpoch,
    required this.longestDayDurationSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['total_workouts'] = Variable<int>(totalWorkouts);
    map['total_volume'] = Variable<double>(totalVolume);
    map['total_distance'] = Variable<double>(totalDistance);
    map['total_sets'] = Variable<int>(totalSets);
    map['total_duration_seconds'] = Variable<int>(totalDurationSeconds);
    map['total_exercises_performed'] = Variable<int>(totalExercisesPerformed);
    if (!nullToAbsent || strongestDayEpoch != null) {
      map['strongest_day_epoch'] = Variable<int>(strongestDayEpoch);
    }
    map['strongest_day_volume'] = Variable<double>(strongestDayVolume);
    if (!nullToAbsent || longestDayEpoch != null) {
      map['longest_day_epoch'] = Variable<int>(longestDayEpoch);
    }
    map['longest_day_duration_seconds'] = Variable<int>(
      longestDayDurationSeconds,
    );
    return map;
  }

  UserOverallStatsTableCompanion toCompanion(bool nullToAbsent) {
    return UserOverallStatsTableCompanion(
      userId: Value(userId),
      totalWorkouts: Value(totalWorkouts),
      totalVolume: Value(totalVolume),
      totalDistance: Value(totalDistance),
      totalSets: Value(totalSets),
      totalDurationSeconds: Value(totalDurationSeconds),
      totalExercisesPerformed: Value(totalExercisesPerformed),
      strongestDayEpoch: strongestDayEpoch == null && nullToAbsent
          ? const Value.absent()
          : Value(strongestDayEpoch),
      strongestDayVolume: Value(strongestDayVolume),
      longestDayEpoch: longestDayEpoch == null && nullToAbsent
          ? const Value.absent()
          : Value(longestDayEpoch),
      longestDayDurationSeconds: Value(longestDayDurationSeconds),
    );
  }

  factory UserOverallStatsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserOverallStatsRow(
      userId: serializer.fromJson<String>(json['userId']),
      totalWorkouts: serializer.fromJson<int>(json['totalWorkouts']),
      totalVolume: serializer.fromJson<double>(json['totalVolume']),
      totalDistance: serializer.fromJson<double>(json['totalDistance']),
      totalSets: serializer.fromJson<int>(json['totalSets']),
      totalDurationSeconds: serializer.fromJson<int>(
        json['totalDurationSeconds'],
      ),
      totalExercisesPerformed: serializer.fromJson<int>(
        json['totalExercisesPerformed'],
      ),
      strongestDayEpoch: serializer.fromJson<int?>(json['strongestDayEpoch']),
      strongestDayVolume: serializer.fromJson<double>(
        json['strongestDayVolume'],
      ),
      longestDayEpoch: serializer.fromJson<int?>(json['longestDayEpoch']),
      longestDayDurationSeconds: serializer.fromJson<int>(
        json['longestDayDurationSeconds'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'totalWorkouts': serializer.toJson<int>(totalWorkouts),
      'totalVolume': serializer.toJson<double>(totalVolume),
      'totalDistance': serializer.toJson<double>(totalDistance),
      'totalSets': serializer.toJson<int>(totalSets),
      'totalDurationSeconds': serializer.toJson<int>(totalDurationSeconds),
      'totalExercisesPerformed': serializer.toJson<int>(
        totalExercisesPerformed,
      ),
      'strongestDayEpoch': serializer.toJson<int?>(strongestDayEpoch),
      'strongestDayVolume': serializer.toJson<double>(strongestDayVolume),
      'longestDayEpoch': serializer.toJson<int?>(longestDayEpoch),
      'longestDayDurationSeconds': serializer.toJson<int>(
        longestDayDurationSeconds,
      ),
    };
  }

  UserOverallStatsRow copyWith({
    String? userId,
    int? totalWorkouts,
    double? totalVolume,
    double? totalDistance,
    int? totalSets,
    int? totalDurationSeconds,
    int? totalExercisesPerformed,
    Value<int?> strongestDayEpoch = const Value.absent(),
    double? strongestDayVolume,
    Value<int?> longestDayEpoch = const Value.absent(),
    int? longestDayDurationSeconds,
  }) => UserOverallStatsRow(
    userId: userId ?? this.userId,
    totalWorkouts: totalWorkouts ?? this.totalWorkouts,
    totalVolume: totalVolume ?? this.totalVolume,
    totalDistance: totalDistance ?? this.totalDistance,
    totalSets: totalSets ?? this.totalSets,
    totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
    totalExercisesPerformed:
        totalExercisesPerformed ?? this.totalExercisesPerformed,
    strongestDayEpoch: strongestDayEpoch.present
        ? strongestDayEpoch.value
        : this.strongestDayEpoch,
    strongestDayVolume: strongestDayVolume ?? this.strongestDayVolume,
    longestDayEpoch: longestDayEpoch.present
        ? longestDayEpoch.value
        : this.longestDayEpoch,
    longestDayDurationSeconds:
        longestDayDurationSeconds ?? this.longestDayDurationSeconds,
  );
  UserOverallStatsRow copyWithCompanion(UserOverallStatsTableCompanion data) {
    return UserOverallStatsRow(
      userId: data.userId.present ? data.userId.value : this.userId,
      totalWorkouts: data.totalWorkouts.present
          ? data.totalWorkouts.value
          : this.totalWorkouts,
      totalVolume: data.totalVolume.present
          ? data.totalVolume.value
          : this.totalVolume,
      totalDistance: data.totalDistance.present
          ? data.totalDistance.value
          : this.totalDistance,
      totalSets: data.totalSets.present ? data.totalSets.value : this.totalSets,
      totalDurationSeconds: data.totalDurationSeconds.present
          ? data.totalDurationSeconds.value
          : this.totalDurationSeconds,
      totalExercisesPerformed: data.totalExercisesPerformed.present
          ? data.totalExercisesPerformed.value
          : this.totalExercisesPerformed,
      strongestDayEpoch: data.strongestDayEpoch.present
          ? data.strongestDayEpoch.value
          : this.strongestDayEpoch,
      strongestDayVolume: data.strongestDayVolume.present
          ? data.strongestDayVolume.value
          : this.strongestDayVolume,
      longestDayEpoch: data.longestDayEpoch.present
          ? data.longestDayEpoch.value
          : this.longestDayEpoch,
      longestDayDurationSeconds: data.longestDayDurationSeconds.present
          ? data.longestDayDurationSeconds.value
          : this.longestDayDurationSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserOverallStatsRow(')
          ..write('userId: $userId, ')
          ..write('totalWorkouts: $totalWorkouts, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('totalSets: $totalSets, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('totalExercisesPerformed: $totalExercisesPerformed, ')
          ..write('strongestDayEpoch: $strongestDayEpoch, ')
          ..write('strongestDayVolume: $strongestDayVolume, ')
          ..write('longestDayEpoch: $longestDayEpoch, ')
          ..write('longestDayDurationSeconds: $longestDayDurationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    totalWorkouts,
    totalVolume,
    totalDistance,
    totalSets,
    totalDurationSeconds,
    totalExercisesPerformed,
    strongestDayEpoch,
    strongestDayVolume,
    longestDayEpoch,
    longestDayDurationSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserOverallStatsRow &&
          other.userId == this.userId &&
          other.totalWorkouts == this.totalWorkouts &&
          other.totalVolume == this.totalVolume &&
          other.totalDistance == this.totalDistance &&
          other.totalSets == this.totalSets &&
          other.totalDurationSeconds == this.totalDurationSeconds &&
          other.totalExercisesPerformed == this.totalExercisesPerformed &&
          other.strongestDayEpoch == this.strongestDayEpoch &&
          other.strongestDayVolume == this.strongestDayVolume &&
          other.longestDayEpoch == this.longestDayEpoch &&
          other.longestDayDurationSeconds == this.longestDayDurationSeconds);
}

class UserOverallStatsTableCompanion
    extends UpdateCompanion<UserOverallStatsRow> {
  final Value<String> userId;
  final Value<int> totalWorkouts;
  final Value<double> totalVolume;
  final Value<double> totalDistance;
  final Value<int> totalSets;
  final Value<int> totalDurationSeconds;
  final Value<int> totalExercisesPerformed;
  final Value<int?> strongestDayEpoch;
  final Value<double> strongestDayVolume;
  final Value<int?> longestDayEpoch;
  final Value<int> longestDayDurationSeconds;
  final Value<int> rowid;
  const UserOverallStatsTableCompanion({
    this.userId = const Value.absent(),
    this.totalWorkouts = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.totalSets = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.totalExercisesPerformed = const Value.absent(),
    this.strongestDayEpoch = const Value.absent(),
    this.strongestDayVolume = const Value.absent(),
    this.longestDayEpoch = const Value.absent(),
    this.longestDayDurationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserOverallStatsTableCompanion.insert({
    required String userId,
    this.totalWorkouts = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.totalSets = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.totalExercisesPerformed = const Value.absent(),
    this.strongestDayEpoch = const Value.absent(),
    this.strongestDayVolume = const Value.absent(),
    this.longestDayEpoch = const Value.absent(),
    this.longestDayDurationSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<UserOverallStatsRow> custom({
    Expression<String>? userId,
    Expression<int>? totalWorkouts,
    Expression<double>? totalVolume,
    Expression<double>? totalDistance,
    Expression<int>? totalSets,
    Expression<int>? totalDurationSeconds,
    Expression<int>? totalExercisesPerformed,
    Expression<int>? strongestDayEpoch,
    Expression<double>? strongestDayVolume,
    Expression<int>? longestDayEpoch,
    Expression<int>? longestDayDurationSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (totalWorkouts != null) 'total_workouts': totalWorkouts,
      if (totalVolume != null) 'total_volume': totalVolume,
      if (totalDistance != null) 'total_distance': totalDistance,
      if (totalSets != null) 'total_sets': totalSets,
      if (totalDurationSeconds != null)
        'total_duration_seconds': totalDurationSeconds,
      if (totalExercisesPerformed != null)
        'total_exercises_performed': totalExercisesPerformed,
      if (strongestDayEpoch != null) 'strongest_day_epoch': strongestDayEpoch,
      if (strongestDayVolume != null)
        'strongest_day_volume': strongestDayVolume,
      if (longestDayEpoch != null) 'longest_day_epoch': longestDayEpoch,
      if (longestDayDurationSeconds != null)
        'longest_day_duration_seconds': longestDayDurationSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserOverallStatsTableCompanion copyWith({
    Value<String>? userId,
    Value<int>? totalWorkouts,
    Value<double>? totalVolume,
    Value<double>? totalDistance,
    Value<int>? totalSets,
    Value<int>? totalDurationSeconds,
    Value<int>? totalExercisesPerformed,
    Value<int?>? strongestDayEpoch,
    Value<double>? strongestDayVolume,
    Value<int?>? longestDayEpoch,
    Value<int>? longestDayDurationSeconds,
    Value<int>? rowid,
  }) {
    return UserOverallStatsTableCompanion(
      userId: userId ?? this.userId,
      totalWorkouts: totalWorkouts ?? this.totalWorkouts,
      totalVolume: totalVolume ?? this.totalVolume,
      totalDistance: totalDistance ?? this.totalDistance,
      totalSets: totalSets ?? this.totalSets,
      totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
      totalExercisesPerformed:
          totalExercisesPerformed ?? this.totalExercisesPerformed,
      strongestDayEpoch: strongestDayEpoch ?? this.strongestDayEpoch,
      strongestDayVolume: strongestDayVolume ?? this.strongestDayVolume,
      longestDayEpoch: longestDayEpoch ?? this.longestDayEpoch,
      longestDayDurationSeconds:
          longestDayDurationSeconds ?? this.longestDayDurationSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (totalWorkouts.present) {
      map['total_workouts'] = Variable<int>(totalWorkouts.value);
    }
    if (totalVolume.present) {
      map['total_volume'] = Variable<double>(totalVolume.value);
    }
    if (totalDistance.present) {
      map['total_distance'] = Variable<double>(totalDistance.value);
    }
    if (totalSets.present) {
      map['total_sets'] = Variable<int>(totalSets.value);
    }
    if (totalDurationSeconds.present) {
      map['total_duration_seconds'] = Variable<int>(totalDurationSeconds.value);
    }
    if (totalExercisesPerformed.present) {
      map['total_exercises_performed'] = Variable<int>(
        totalExercisesPerformed.value,
      );
    }
    if (strongestDayEpoch.present) {
      map['strongest_day_epoch'] = Variable<int>(strongestDayEpoch.value);
    }
    if (strongestDayVolume.present) {
      map['strongest_day_volume'] = Variable<double>(strongestDayVolume.value);
    }
    if (longestDayEpoch.present) {
      map['longest_day_epoch'] = Variable<int>(longestDayEpoch.value);
    }
    if (longestDayDurationSeconds.present) {
      map['longest_day_duration_seconds'] = Variable<int>(
        longestDayDurationSeconds.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserOverallStatsTableCompanion(')
          ..write('userId: $userId, ')
          ..write('totalWorkouts: $totalWorkouts, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('totalSets: $totalSets, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('totalExercisesPerformed: $totalExercisesPerformed, ')
          ..write('strongestDayEpoch: $strongestDayEpoch, ')
          ..write('strongestDayVolume: $strongestDayVolume, ')
          ..write('longestDayEpoch: $longestDayEpoch, ')
          ..write('longestDayDurationSeconds: $longestDayDurationSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MuscleUsageDailyTableTable extends MuscleUsageDailyTable
    with TableInfo<$MuscleUsageDailyTableTable, MuscleUsageDailyRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuscleUsageDailyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _bodyPartMeta = const VerificationMeta(
    'bodyPart',
  );
  @override
  late final GeneratedColumn<String> bodyPart = GeneratedColumn<String>(
    'body_part',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayEpochMeta = const VerificationMeta(
    'dayEpoch',
  );
  @override
  late final GeneratedColumn<int> dayEpoch = GeneratedColumn<int>(
    'day_epoch',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setsCountMeta = const VerificationMeta(
    'setsCount',
  );
  @override
  late final GeneratedColumn<int> setsCount = GeneratedColumn<int>(
    'sets_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    bodyPart,
    dayEpoch,
    setsCount,
    score,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'muscle_usage_daily_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MuscleUsageDailyRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('body_part')) {
      context.handle(
        _bodyPartMeta,
        bodyPart.isAcceptableOrUnknown(data['body_part']!, _bodyPartMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyPartMeta);
    }
    if (data.containsKey('day_epoch')) {
      context.handle(
        _dayEpochMeta,
        dayEpoch.isAcceptableOrUnknown(data['day_epoch']!, _dayEpochMeta),
      );
    } else if (isInserting) {
      context.missing(_dayEpochMeta);
    }
    if (data.containsKey('sets_count')) {
      context.handle(
        _setsCountMeta,
        setsCount.isAcceptableOrUnknown(data['sets_count']!, _setsCountMeta),
      );
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, bodyPart, dayEpoch};
  @override
  MuscleUsageDailyRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuscleUsageDailyRow(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      bodyPart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_part'],
      )!,
      dayEpoch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_epoch'],
      )!,
      setsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets_count'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      )!,
    );
  }

  @override
  $MuscleUsageDailyTableTable createAlias(String alias) {
    return $MuscleUsageDailyTableTable(attachedDatabase, alias);
  }
}

class MuscleUsageDailyRow extends DataClass
    implements Insertable<MuscleUsageDailyRow> {
  final String userId;

  /// BodyPart.name.
  final String bodyPart;

  /// Local-midnight epoch-ms of the training day.
  final int dayEpoch;
  final int setsCount;

  /// Σ working sets × modality volume factor — the heat weight.
  final double score;
  const MuscleUsageDailyRow({
    required this.userId,
    required this.bodyPart,
    required this.dayEpoch,
    required this.setsCount,
    required this.score,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['body_part'] = Variable<String>(bodyPart);
    map['day_epoch'] = Variable<int>(dayEpoch);
    map['sets_count'] = Variable<int>(setsCount);
    map['score'] = Variable<double>(score);
    return map;
  }

  MuscleUsageDailyTableCompanion toCompanion(bool nullToAbsent) {
    return MuscleUsageDailyTableCompanion(
      userId: Value(userId),
      bodyPart: Value(bodyPart),
      dayEpoch: Value(dayEpoch),
      setsCount: Value(setsCount),
      score: Value(score),
    );
  }

  factory MuscleUsageDailyRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuscleUsageDailyRow(
      userId: serializer.fromJson<String>(json['userId']),
      bodyPart: serializer.fromJson<String>(json['bodyPart']),
      dayEpoch: serializer.fromJson<int>(json['dayEpoch']),
      setsCount: serializer.fromJson<int>(json['setsCount']),
      score: serializer.fromJson<double>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'bodyPart': serializer.toJson<String>(bodyPart),
      'dayEpoch': serializer.toJson<int>(dayEpoch),
      'setsCount': serializer.toJson<int>(setsCount),
      'score': serializer.toJson<double>(score),
    };
  }

  MuscleUsageDailyRow copyWith({
    String? userId,
    String? bodyPart,
    int? dayEpoch,
    int? setsCount,
    double? score,
  }) => MuscleUsageDailyRow(
    userId: userId ?? this.userId,
    bodyPart: bodyPart ?? this.bodyPart,
    dayEpoch: dayEpoch ?? this.dayEpoch,
    setsCount: setsCount ?? this.setsCount,
    score: score ?? this.score,
  );
  MuscleUsageDailyRow copyWithCompanion(MuscleUsageDailyTableCompanion data) {
    return MuscleUsageDailyRow(
      userId: data.userId.present ? data.userId.value : this.userId,
      bodyPart: data.bodyPart.present ? data.bodyPart.value : this.bodyPart,
      dayEpoch: data.dayEpoch.present ? data.dayEpoch.value : this.dayEpoch,
      setsCount: data.setsCount.present ? data.setsCount.value : this.setsCount,
      score: data.score.present ? data.score.value : this.score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MuscleUsageDailyRow(')
          ..write('userId: $userId, ')
          ..write('bodyPart: $bodyPart, ')
          ..write('dayEpoch: $dayEpoch, ')
          ..write('setsCount: $setsCount, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, bodyPart, dayEpoch, setsCount, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuscleUsageDailyRow &&
          other.userId == this.userId &&
          other.bodyPart == this.bodyPart &&
          other.dayEpoch == this.dayEpoch &&
          other.setsCount == this.setsCount &&
          other.score == this.score);
}

class MuscleUsageDailyTableCompanion
    extends UpdateCompanion<MuscleUsageDailyRow> {
  final Value<String> userId;
  final Value<String> bodyPart;
  final Value<int> dayEpoch;
  final Value<int> setsCount;
  final Value<double> score;
  final Value<int> rowid;
  const MuscleUsageDailyTableCompanion({
    this.userId = const Value.absent(),
    this.bodyPart = const Value.absent(),
    this.dayEpoch = const Value.absent(),
    this.setsCount = const Value.absent(),
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MuscleUsageDailyTableCompanion.insert({
    required String userId,
    required String bodyPart,
    required int dayEpoch,
    this.setsCount = const Value.absent(),
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       bodyPart = Value(bodyPart),
       dayEpoch = Value(dayEpoch);
  static Insertable<MuscleUsageDailyRow> custom({
    Expression<String>? userId,
    Expression<String>? bodyPart,
    Expression<int>? dayEpoch,
    Expression<int>? setsCount,
    Expression<double>? score,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (bodyPart != null) 'body_part': bodyPart,
      if (dayEpoch != null) 'day_epoch': dayEpoch,
      if (setsCount != null) 'sets_count': setsCount,
      if (score != null) 'score': score,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MuscleUsageDailyTableCompanion copyWith({
    Value<String>? userId,
    Value<String>? bodyPart,
    Value<int>? dayEpoch,
    Value<int>? setsCount,
    Value<double>? score,
    Value<int>? rowid,
  }) {
    return MuscleUsageDailyTableCompanion(
      userId: userId ?? this.userId,
      bodyPart: bodyPart ?? this.bodyPart,
      dayEpoch: dayEpoch ?? this.dayEpoch,
      setsCount: setsCount ?? this.setsCount,
      score: score ?? this.score,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (bodyPart.present) {
      map['body_part'] = Variable<String>(bodyPart.value);
    }
    if (dayEpoch.present) {
      map['day_epoch'] = Variable<int>(dayEpoch.value);
    }
    if (setsCount.present) {
      map['sets_count'] = Variable<int>(setsCount.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuscleUsageDailyTableCompanion(')
          ..write('userId: $userId, ')
          ..write('bodyPart: $bodyPart, ')
          ..write('dayEpoch: $dayEpoch, ')
          ..write('setsCount: $setsCount, ')
          ..write('score: $score, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppUserTableTable appUserTable = $AppUserTableTable(this);
  late final $AppMetadataTableTable appMetadataTable = $AppMetadataTableTable(
    this,
  );
  late final $ExerciseTableTable exerciseTable = $ExerciseTableTable(this);
  late final $UserExerciseTableTable userExerciseTable =
      $UserExerciseTableTable(this);
  late final $StrengthProfileTableTable strengthProfileTable =
      $StrengthProfileTableTable(this);
  late final $CardioProfileTableTable cardioProfileTable =
      $CardioProfileTableTable(this);
  late final $ProgressionPolicyTableTable progressionPolicyTable =
      $ProgressionPolicyTableTable(this);
  late final $RoutineTableTable routineTable = $RoutineTableTable(this);
  late final $RoutineExerciseTableTable routineExerciseTable =
      $RoutineExerciseTableTable(this);
  late final $WorkoutLogTableTable workoutLogTable = $WorkoutLogTableTable(
    this,
  );
  late final $ExercisePerformanceLogTableTable exercisePerformanceLogTable =
      $ExercisePerformanceLogTableTable(this);
  late final $SetLogTableTable setLogTable = $SetLogTableTable(this);
  late final $ActiveWorkoutDraftTableTable activeWorkoutDraftTable =
      $ActiveWorkoutDraftTableTable(this);
  late final $HistoryStatsRollupTableTable historyStatsRollupTable =
      $HistoryStatsRollupTableTable(this);
  late final $ExerciseOverallAggregateTableTable exerciseOverallAggregateTable =
      $ExerciseOverallAggregateTableTable(this);
  late final $PersonalRecordEventTableTable personalRecordEventTable =
      $PersonalRecordEventTableTable(this);
  late final $UserOverallStatsTableTable userOverallStatsTable =
      $UserOverallStatsTableTable(this);
  late final $MuscleUsageDailyTableTable muscleUsageDailyTable =
      $MuscleUsageDailyTableTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final AppMetadataDao appMetadataDao = AppMetadataDao(
    this as AppDatabase,
  );
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final RoutineDao routineDao = RoutineDao(this as AppDatabase);
  late final WorkoutDraftDao workoutDraftDao = WorkoutDraftDao(
    this as AppDatabase,
  );
  late final HistoryDao historyDao = HistoryDao(this as AppDatabase);
  late final StatsDao statsDao = StatsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appUserTable,
    appMetadataTable,
    exerciseTable,
    userExerciseTable,
    strengthProfileTable,
    cardioProfileTable,
    progressionPolicyTable,
    routineTable,
    routineExerciseTable,
    workoutLogTable,
    exercisePerformanceLogTable,
    setLogTable,
    activeWorkoutDraftTable,
    historyStatsRollupTable,
    exerciseOverallAggregateTable,
    personalRecordEventTable,
    userOverallStatsTable,
    muscleUsageDailyTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('exercise_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_exercise_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_exercise_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('strength_profile_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cardio_profile_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('progression_policy_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_exercise_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routine_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_exercise_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_exercise_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('workout_log_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routine_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('workout_log_table', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('exercise_performance_log_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'workout_log_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('exercise_performance_log_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('exercise_performance_log_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routine_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('exercise_performance_log_table', kind: UpdateKind.update),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('set_log_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'exercise_performance_log_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('set_log_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('active_workout_draft_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('history_stats_rollup_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('history_stats_rollup_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'exercise_overall_aggregate_table',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'exercise_overall_aggregate_table',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('personal_record_event_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_exercise_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('personal_record_event_table', kind: UpdateKind.update),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('user_overall_stats_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'app_user_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('muscle_usage_daily_table', kind: UpdateKind.delete),
      ],
    ),
  ]);
}

typedef $$AppUserTableTableCreateCompanionBuilder =
    AppUserTableCompanion Function({
      required String id,
      required String userName,
      required int createdAt,
      Value<bool> hasCompletedInitialSetup,
      Value<double?> userWeight,
      Value<int> rowid,
    });
typedef $$AppUserTableTableUpdateCompanionBuilder =
    AppUserTableCompanion Function({
      Value<String> id,
      Value<String> userName,
      Value<int> createdAt,
      Value<bool> hasCompletedInitialSetup,
      Value<double?> userWeight,
      Value<int> rowid,
    });

final class $$AppUserTableTableReferences
    extends BaseReferences<_$AppDatabase, $AppUserTableTable, AppUserRow> {
  $$AppUserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExerciseTableTable, List<ExerciseRow>>
  _exerciseTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exerciseTable,
    aliasName: $_aliasNameGenerator(
      db.appUserTable.id,
      db.exerciseTable.ownerUserId,
    ),
  );

  $$ExerciseTableTableProcessedTableManager get exerciseTableRefs {
    final manager = $$ExerciseTableTableTableManager(
      $_db,
      $_db.exerciseTable,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_exerciseTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserExerciseTableTable, List<UserExerciseRow>>
  _userExerciseTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userExerciseTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.userExerciseTable.userId,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseTableRefs {
    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userExerciseTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoutineTableTable, List<RoutineRow>>
  _routineTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routineTable,
    aliasName: $_aliasNameGenerator(db.appUserTable.id, db.routineTable.userId),
  );

  $$RoutineTableTableProcessedTableManager get routineTableRefs {
    final manager = $$RoutineTableTableTableManager(
      $_db,
      $_db.routineTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_routineTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RoutineExerciseTableTable,
    List<RoutineExerciseRow>
  >
  _routineExerciseTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.routineExerciseTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.routineExerciseTable.userId,
        ),
      );

  $$RoutineExerciseTableTableProcessedTableManager
  get routineExerciseTableRefs {
    final manager = $$RoutineExerciseTableTableTableManager(
      $_db,
      $_db.routineExerciseTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _routineExerciseTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutLogTableTable, List<WorkoutLogRow>>
  _workoutLogTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutLogTable,
    aliasName: $_aliasNameGenerator(
      db.appUserTable.id,
      db.workoutLogTable.userId,
    ),
  );

  $$WorkoutLogTableTableProcessedTableManager get workoutLogTableRefs {
    final manager = $$WorkoutLogTableTableTableManager(
      $_db,
      $_db.workoutLogTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutLogTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExercisePerformanceLogTableTable,
    List<ExercisePerformanceLogRow>
  >
  _exercisePerformanceLogTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exercisePerformanceLogTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.exercisePerformanceLogTable.userId,
        ),
      );

  $$ExercisePerformanceLogTableTableProcessedTableManager
  get exercisePerformanceLogTableRefs {
    final manager = $$ExercisePerformanceLogTableTableTableManager(
      $_db,
      $_db.exercisePerformanceLogTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exercisePerformanceLogTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SetLogTableTable, List<SetLogRow>>
  _setLogTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.setLogTable,
    aliasName: $_aliasNameGenerator(db.appUserTable.id, db.setLogTable.userId),
  );

  $$SetLogTableTableProcessedTableManager get setLogTableRefs {
    final manager = $$SetLogTableTableTableManager(
      $_db,
      $_db.setLogTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_setLogTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ActiveWorkoutDraftTableTable,
    List<ActiveWorkoutDraftRow>
  >
  _activeWorkoutDraftTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.activeWorkoutDraftTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.activeWorkoutDraftTable.userId,
        ),
      );

  $$ActiveWorkoutDraftTableTableProcessedTableManager
  get activeWorkoutDraftTableRefs {
    final manager = $$ActiveWorkoutDraftTableTableTableManager(
      $_db,
      $_db.activeWorkoutDraftTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _activeWorkoutDraftTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $HistoryStatsRollupTableTable,
    List<HistoryStatsRollupRow>
  >
  _historyStatsRollupTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.historyStatsRollupTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.historyStatsRollupTable.userId,
        ),
      );

  $$HistoryStatsRollupTableTableProcessedTableManager
  get historyStatsRollupTableRefs {
    final manager = $$HistoryStatsRollupTableTableTableManager(
      $_db,
      $_db.historyStatsRollupTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _historyStatsRollupTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExerciseOverallAggregateTableTable,
    List<ExerciseOverallAggregateRow>
  >
  _exerciseOverallAggregateTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exerciseOverallAggregateTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.exerciseOverallAggregateTable.userId,
        ),
      );

  $$ExerciseOverallAggregateTableTableProcessedTableManager
  get exerciseOverallAggregateTableRefs {
    final manager = $$ExerciseOverallAggregateTableTableTableManager(
      $_db,
      $_db.exerciseOverallAggregateTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exerciseOverallAggregateTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PersonalRecordEventTableTable,
    List<PersonalRecordEventRow>
  >
  _personalRecordEventTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.personalRecordEventTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.personalRecordEventTable.userId,
        ),
      );

  $$PersonalRecordEventTableTableProcessedTableManager
  get personalRecordEventTableRefs {
    final manager = $$PersonalRecordEventTableTableTableManager(
      $_db,
      $_db.personalRecordEventTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _personalRecordEventTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $UserOverallStatsTableTable,
    List<UserOverallStatsRow>
  >
  _userOverallStatsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userOverallStatsTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.userOverallStatsTable.userId,
        ),
      );

  $$UserOverallStatsTableTableProcessedTableManager
  get userOverallStatsTableRefs {
    final manager = $$UserOverallStatsTableTableTableManager(
      $_db,
      $_db.userOverallStatsTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userOverallStatsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MuscleUsageDailyTableTable,
    List<MuscleUsageDailyRow>
  >
  _muscleUsageDailyTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.muscleUsageDailyTable,
        aliasName: $_aliasNameGenerator(
          db.appUserTable.id,
          db.muscleUsageDailyTable.userId,
        ),
      );

  $$MuscleUsageDailyTableTableProcessedTableManager
  get muscleUsageDailyTableRefs {
    final manager = $$MuscleUsageDailyTableTableTableManager(
      $_db,
      $_db.muscleUsageDailyTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _muscleUsageDailyTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AppUserTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppUserTableTable> {
  $$AppUserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasCompletedInitialSetup => $composableBuilder(
    column: $table.hasCompletedInitialSetup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get userWeight => $composableBuilder(
    column: $table.userWeight,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> exerciseTableRefs(
    Expression<bool> Function($$ExerciseTableTableFilterComposer f) f,
  ) {
    final $$ExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseTable,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.exerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userExerciseTableRefs(
    Expression<bool> Function($$UserExerciseTableTableFilterComposer f) f,
  ) {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routineTableRefs(
    Expression<bool> Function($$RoutineTableTableFilterComposer f) f,
  ) {
    final $$RoutineTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableFilterComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routineExerciseTableRefs(
    Expression<bool> Function($$RoutineExerciseTableTableFilterComposer f) f,
  ) {
    final $$RoutineExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineExerciseTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.routineExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutLogTableRefs(
    Expression<bool> Function($$WorkoutLogTableTableFilterComposer f) f,
  ) {
    final $$WorkoutLogTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exercisePerformanceLogTableRefs(
    Expression<bool> Function(
      $$ExercisePerformanceLogTableTableFilterComposer f,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableFilterComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> setLogTableRefs(
    Expression<bool> Function($$SetLogTableTableFilterComposer f) f,
  ) {
    final $$SetLogTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogTableTableFilterComposer(
            $db: $db,
            $table: $db.setLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> activeWorkoutDraftTableRefs(
    Expression<bool> Function($$ActiveWorkoutDraftTableTableFilterComposer f) f,
  ) {
    final $$ActiveWorkoutDraftTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.activeWorkoutDraftTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ActiveWorkoutDraftTableTableFilterComposer(
                $db: $db,
                $table: $db.activeWorkoutDraftTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> historyStatsRollupTableRefs(
    Expression<bool> Function($$HistoryStatsRollupTableTableFilterComposer f) f,
  ) {
    final $$HistoryStatsRollupTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historyStatsRollupTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoryStatsRollupTableTableFilterComposer(
                $db: $db,
                $table: $db.historyStatsRollupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> exerciseOverallAggregateTableRefs(
    Expression<bool> Function(
      $$ExerciseOverallAggregateTableTableFilterComposer f,
    )
    f,
  ) {
    final $$ExerciseOverallAggregateTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseOverallAggregateTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseOverallAggregateTableTableFilterComposer(
                $db: $db,
                $table: $db.exerciseOverallAggregateTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> personalRecordEventTableRefs(
    Expression<bool> Function($$PersonalRecordEventTableTableFilterComposer f)
    f,
  ) {
    final $$PersonalRecordEventTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.personalRecordEventTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PersonalRecordEventTableTableFilterComposer(
                $db: $db,
                $table: $db.personalRecordEventTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> userOverallStatsTableRefs(
    Expression<bool> Function($$UserOverallStatsTableTableFilterComposer f) f,
  ) {
    final $$UserOverallStatsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userOverallStatsTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserOverallStatsTableTableFilterComposer(
                $db: $db,
                $table: $db.userOverallStatsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> muscleUsageDailyTableRefs(
    Expression<bool> Function($$MuscleUsageDailyTableTableFilterComposer f) f,
  ) {
    final $$MuscleUsageDailyTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.muscleUsageDailyTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MuscleUsageDailyTableTableFilterComposer(
                $db: $db,
                $table: $db.muscleUsageDailyTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AppUserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppUserTableTable> {
  $$AppUserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasCompletedInitialSetup => $composableBuilder(
    column: $table.hasCompletedInitialSetup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get userWeight => $composableBuilder(
    column: $table.userWeight,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppUserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppUserTableTable> {
  $$AppUserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get hasCompletedInitialSetup => $composableBuilder(
    column: $table.hasCompletedInitialSetup,
    builder: (column) => column,
  );

  GeneratedColumn<double> get userWeight => $composableBuilder(
    column: $table.userWeight,
    builder: (column) => column,
  );

  Expression<T> exerciseTableRefs<T extends Object>(
    Expression<T> Function($$ExerciseTableTableAnnotationComposer a) f,
  ) {
    final $$ExerciseTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseTable,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseTableTableAnnotationComposer(
            $db: $db,
            $table: $db.exerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userExerciseTableRefs<T extends Object>(
    Expression<T> Function($$UserExerciseTableTableAnnotationComposer a) f,
  ) {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> routineTableRefs<T extends Object>(
    Expression<T> Function($$RoutineTableTableAnnotationComposer a) f,
  ) {
    final $$RoutineTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableAnnotationComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> routineExerciseTableRefs<T extends Object>(
    Expression<T> Function($$RoutineExerciseTableTableAnnotationComposer a) f,
  ) {
    final $$RoutineExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.routineExerciseTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.routineExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workoutLogTableRefs<T extends Object>(
    Expression<T> Function($$WorkoutLogTableTableAnnotationComposer a) f,
  ) {
    final $$WorkoutLogTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> exercisePerformanceLogTableRefs<T extends Object>(
    Expression<T> Function(
      $$ExercisePerformanceLogTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> setLogTableRefs<T extends Object>(
    Expression<T> Function($$SetLogTableTableAnnotationComposer a) f,
  ) {
    final $$SetLogTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogTableTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> activeWorkoutDraftTableRefs<T extends Object>(
    Expression<T> Function($$ActiveWorkoutDraftTableTableAnnotationComposer a)
    f,
  ) {
    final $$ActiveWorkoutDraftTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.activeWorkoutDraftTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ActiveWorkoutDraftTableTableAnnotationComposer(
                $db: $db,
                $table: $db.activeWorkoutDraftTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> historyStatsRollupTableRefs<T extends Object>(
    Expression<T> Function($$HistoryStatsRollupTableTableAnnotationComposer a)
    f,
  ) {
    final $$HistoryStatsRollupTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historyStatsRollupTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoryStatsRollupTableTableAnnotationComposer(
                $db: $db,
                $table: $db.historyStatsRollupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> exerciseOverallAggregateTableRefs<T extends Object>(
    Expression<T> Function(
      $$ExerciseOverallAggregateTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ExerciseOverallAggregateTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseOverallAggregateTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseOverallAggregateTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseOverallAggregateTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> personalRecordEventTableRefs<T extends Object>(
    Expression<T> Function($$PersonalRecordEventTableTableAnnotationComposer a)
    f,
  ) {
    final $$PersonalRecordEventTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.personalRecordEventTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PersonalRecordEventTableTableAnnotationComposer(
                $db: $db,
                $table: $db.personalRecordEventTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> userOverallStatsTableRefs<T extends Object>(
    Expression<T> Function($$UserOverallStatsTableTableAnnotationComposer a) f,
  ) {
    final $$UserOverallStatsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userOverallStatsTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserOverallStatsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userOverallStatsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> muscleUsageDailyTableRefs<T extends Object>(
    Expression<T> Function($$MuscleUsageDailyTableTableAnnotationComposer a) f,
  ) {
    final $$MuscleUsageDailyTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.muscleUsageDailyTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MuscleUsageDailyTableTableAnnotationComposer(
                $db: $db,
                $table: $db.muscleUsageDailyTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AppUserTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppUserTableTable,
          AppUserRow,
          $$AppUserTableTableFilterComposer,
          $$AppUserTableTableOrderingComposer,
          $$AppUserTableTableAnnotationComposer,
          $$AppUserTableTableCreateCompanionBuilder,
          $$AppUserTableTableUpdateCompanionBuilder,
          (AppUserRow, $$AppUserTableTableReferences),
          AppUserRow,
          PrefetchHooks Function({
            bool exerciseTableRefs,
            bool userExerciseTableRefs,
            bool routineTableRefs,
            bool routineExerciseTableRefs,
            bool workoutLogTableRefs,
            bool exercisePerformanceLogTableRefs,
            bool setLogTableRefs,
            bool activeWorkoutDraftTableRefs,
            bool historyStatsRollupTableRefs,
            bool exerciseOverallAggregateTableRefs,
            bool personalRecordEventTableRefs,
            bool userOverallStatsTableRefs,
            bool muscleUsageDailyTableRefs,
          })
        > {
  $$AppUserTableTableTableManager(_$AppDatabase db, $AppUserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppUserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppUserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppUserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userName = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<bool> hasCompletedInitialSetup = const Value.absent(),
                Value<double?> userWeight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppUserTableCompanion(
                id: id,
                userName: userName,
                createdAt: createdAt,
                hasCompletedInitialSetup: hasCompletedInitialSetup,
                userWeight: userWeight,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userName,
                required int createdAt,
                Value<bool> hasCompletedInitialSetup = const Value.absent(),
                Value<double?> userWeight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppUserTableCompanion.insert(
                id: id,
                userName: userName,
                createdAt: createdAt,
                hasCompletedInitialSetup: hasCompletedInitialSetup,
                userWeight: userWeight,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppUserTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                exerciseTableRefs = false,
                userExerciseTableRefs = false,
                routineTableRefs = false,
                routineExerciseTableRefs = false,
                workoutLogTableRefs = false,
                exercisePerformanceLogTableRefs = false,
                setLogTableRefs = false,
                activeWorkoutDraftTableRefs = false,
                historyStatsRollupTableRefs = false,
                exerciseOverallAggregateTableRefs = false,
                personalRecordEventTableRefs = false,
                userOverallStatsTableRefs = false,
                muscleUsageDailyTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exerciseTableRefs) db.exerciseTable,
                    if (userExerciseTableRefs) db.userExerciseTable,
                    if (routineTableRefs) db.routineTable,
                    if (routineExerciseTableRefs) db.routineExerciseTable,
                    if (workoutLogTableRefs) db.workoutLogTable,
                    if (exercisePerformanceLogTableRefs)
                      db.exercisePerformanceLogTable,
                    if (setLogTableRefs) db.setLogTable,
                    if (activeWorkoutDraftTableRefs) db.activeWorkoutDraftTable,
                    if (historyStatsRollupTableRefs) db.historyStatsRollupTable,
                    if (exerciseOverallAggregateTableRefs)
                      db.exerciseOverallAggregateTable,
                    if (personalRecordEventTableRefs)
                      db.personalRecordEventTable,
                    if (userOverallStatsTableRefs) db.userOverallStatsTable,
                    if (muscleUsageDailyTableRefs) db.muscleUsageDailyTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exerciseTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          ExerciseRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._exerciseTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userExerciseTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          UserExerciseRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._userExerciseTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).userExerciseTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (routineTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          RoutineRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._routineTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).routineTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (routineExerciseTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          RoutineExerciseRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._routineExerciseTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).routineExerciseTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutLogTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          WorkoutLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._workoutLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exercisePerformanceLogTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          ExercisePerformanceLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._exercisePerformanceLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisePerformanceLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (setLogTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          SetLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._setLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).setLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (activeWorkoutDraftTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          ActiveWorkoutDraftRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._activeWorkoutDraftTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).activeWorkoutDraftTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (historyStatsRollupTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          HistoryStatsRollupRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._historyStatsRollupTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).historyStatsRollupTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exerciseOverallAggregateTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          ExerciseOverallAggregateRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._exerciseOverallAggregateTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseOverallAggregateTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (personalRecordEventTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          PersonalRecordEventRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._personalRecordEventTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).personalRecordEventTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userOverallStatsTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          UserOverallStatsRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._userOverallStatsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).userOverallStatsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (muscleUsageDailyTableRefs)
                        await $_getPrefetchedData<
                          AppUserRow,
                          $AppUserTableTable,
                          MuscleUsageDailyRow
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableTableReferences
                              ._muscleUsageDailyTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).muscleUsageDailyTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AppUserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppUserTableTable,
      AppUserRow,
      $$AppUserTableTableFilterComposer,
      $$AppUserTableTableOrderingComposer,
      $$AppUserTableTableAnnotationComposer,
      $$AppUserTableTableCreateCompanionBuilder,
      $$AppUserTableTableUpdateCompanionBuilder,
      (AppUserRow, $$AppUserTableTableReferences),
      AppUserRow,
      PrefetchHooks Function({
        bool exerciseTableRefs,
        bool userExerciseTableRefs,
        bool routineTableRefs,
        bool routineExerciseTableRefs,
        bool workoutLogTableRefs,
        bool exercisePerformanceLogTableRefs,
        bool setLogTableRefs,
        bool activeWorkoutDraftTableRefs,
        bool historyStatsRollupTableRefs,
        bool exerciseOverallAggregateTableRefs,
        bool personalRecordEventTableRefs,
        bool userOverallStatsTableRefs,
        bool muscleUsageDailyTableRefs,
      })
    >;
typedef $$AppMetadataTableTableCreateCompanionBuilder =
    AppMetadataTableCompanion Function({
      required String dataKey,
      required String dataValue,
      Value<int> rowid,
    });
typedef $$AppMetadataTableTableUpdateCompanionBuilder =
    AppMetadataTableCompanion Function({
      Value<String> dataKey,
      Value<String> dataValue,
      Value<int> rowid,
    });

class $$AppMetadataTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppMetadataTableTable> {
  $$AppMetadataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get dataKey => $composableBuilder(
    column: $table.dataKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataValue => $composableBuilder(
    column: $table.dataValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppMetadataTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppMetadataTableTable> {
  $$AppMetadataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get dataKey => $composableBuilder(
    column: $table.dataKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataValue => $composableBuilder(
    column: $table.dataValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppMetadataTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppMetadataTableTable> {
  $$AppMetadataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get dataKey =>
      $composableBuilder(column: $table.dataKey, builder: (column) => column);

  GeneratedColumn<String> get dataValue =>
      $composableBuilder(column: $table.dataValue, builder: (column) => column);
}

class $$AppMetadataTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppMetadataTableTable,
          AppMetadataRow,
          $$AppMetadataTableTableFilterComposer,
          $$AppMetadataTableTableOrderingComposer,
          $$AppMetadataTableTableAnnotationComposer,
          $$AppMetadataTableTableCreateCompanionBuilder,
          $$AppMetadataTableTableUpdateCompanionBuilder,
          (
            AppMetadataRow,
            BaseReferences<
              _$AppDatabase,
              $AppMetadataTableTable,
              AppMetadataRow
            >,
          ),
          AppMetadataRow,
          PrefetchHooks Function()
        > {
  $$AppMetadataTableTableTableManager(
    _$AppDatabase db,
    $AppMetadataTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppMetadataTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppMetadataTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppMetadataTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> dataKey = const Value.absent(),
                Value<String> dataValue = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppMetadataTableCompanion(
                dataKey: dataKey,
                dataValue: dataValue,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String dataKey,
                required String dataValue,
                Value<int> rowid = const Value.absent(),
              }) => AppMetadataTableCompanion.insert(
                dataKey: dataKey,
                dataValue: dataValue,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppMetadataTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppMetadataTableTable,
      AppMetadataRow,
      $$AppMetadataTableTableFilterComposer,
      $$AppMetadataTableTableOrderingComposer,
      $$AppMetadataTableTableAnnotationComposer,
      $$AppMetadataTableTableCreateCompanionBuilder,
      $$AppMetadataTableTableUpdateCompanionBuilder,
      (
        AppMetadataRow,
        BaseReferences<_$AppDatabase, $AppMetadataTableTable, AppMetadataRow>,
      ),
      AppMetadataRow,
      PrefetchHooks Function()
    >;
typedef $$ExerciseTableTableCreateCompanionBuilder =
    ExerciseTableCompanion Function({
      required String id,
      Value<String?> ownerUserId,
      required String name,
      required String category,
      required String bodyPart,
      Value<String?> thumbnailPath,
      required int createdAt,
      Value<bool> isFoundation,
      Value<int> rowid,
    });
typedef $$ExerciseTableTableUpdateCompanionBuilder =
    ExerciseTableCompanion Function({
      Value<String> id,
      Value<String?> ownerUserId,
      Value<String> name,
      Value<String> category,
      Value<String> bodyPart,
      Value<String?> thumbnailPath,
      Value<int> createdAt,
      Value<bool> isFoundation,
      Value<int> rowid,
    });

final class $$ExerciseTableTableReferences
    extends BaseReferences<_$AppDatabase, $ExerciseTableTable, ExerciseRow> {
  $$ExerciseTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _ownerUserIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(db.exerciseTable.ownerUserId, db.appUserTable.id),
      );

  $$AppUserTableTableProcessedTableManager? get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id');
    if ($_column == null) return null;
    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UserExerciseTableTable, List<UserExerciseRow>>
  _userExerciseTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userExerciseTable,
        aliasName: $_aliasNameGenerator(
          db.exerciseTable.id,
          db.userExerciseTable.exerciseId,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseTableRefs {
    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userExerciseTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExerciseTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseTableTable> {
  $$ExerciseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyPart => $composableBuilder(
    column: $table.bodyPart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFoundation => $composableBuilder(
    column: $table.isFoundation,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get ownerUserId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> userExerciseTableRefs(
    Expression<bool> Function($$UserExerciseTableTableFilterComposer f) f,
  ) {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseTableTable> {
  $$ExerciseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyPart => $composableBuilder(
    column: $table.bodyPart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFoundation => $composableBuilder(
    column: $table.isFoundation,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get ownerUserId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseTableTable> {
  $$ExerciseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get bodyPart =>
      $composableBuilder(column: $table.bodyPart, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isFoundation => $composableBuilder(
    column: $table.isFoundation,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get ownerUserId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> userExerciseTableRefs<T extends Object>(
    Expression<T> Function($$UserExerciseTableTableAnnotationComposer a) f,
  ) {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ExerciseTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseTableTable,
          ExerciseRow,
          $$ExerciseTableTableFilterComposer,
          $$ExerciseTableTableOrderingComposer,
          $$ExerciseTableTableAnnotationComposer,
          $$ExerciseTableTableCreateCompanionBuilder,
          $$ExerciseTableTableUpdateCompanionBuilder,
          (ExerciseRow, $$ExerciseTableTableReferences),
          ExerciseRow,
          PrefetchHooks Function({bool ownerUserId, bool userExerciseTableRefs})
        > {
  $$ExerciseTableTableTableManager(_$AppDatabase db, $ExerciseTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> bodyPart = const Value.absent(),
                Value<String?> thumbnailPath = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<bool> isFoundation = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseTableCompanion(
                id: id,
                ownerUserId: ownerUserId,
                name: name,
                category: category,
                bodyPart: bodyPart,
                thumbnailPath: thumbnailPath,
                createdAt: createdAt,
                isFoundation: isFoundation,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> ownerUserId = const Value.absent(),
                required String name,
                required String category,
                required String bodyPart,
                Value<String?> thumbnailPath = const Value.absent(),
                required int createdAt,
                Value<bool> isFoundation = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseTableCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                name: name,
                category: category,
                bodyPart: bodyPart,
                thumbnailPath: thumbnailPath,
                createdAt: createdAt,
                isFoundation: isFoundation,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExerciseTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ownerUserId = false, userExerciseTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userExerciseTableRefs) db.userExerciseTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable:
                                        $$ExerciseTableTableReferences
                                            ._ownerUserIdTable(db),
                                    referencedColumn:
                                        $$ExerciseTableTableReferences
                                            ._ownerUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userExerciseTableRefs)
                        await $_getPrefetchedData<
                          ExerciseRow,
                          $ExerciseTableTable,
                          UserExerciseRow
                        >(
                          currentTable: table,
                          referencedTable: $$ExerciseTableTableReferences
                              ._userExerciseTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).userExerciseTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExerciseTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseTableTable,
      ExerciseRow,
      $$ExerciseTableTableFilterComposer,
      $$ExerciseTableTableOrderingComposer,
      $$ExerciseTableTableAnnotationComposer,
      $$ExerciseTableTableCreateCompanionBuilder,
      $$ExerciseTableTableUpdateCompanionBuilder,
      (ExerciseRow, $$ExerciseTableTableReferences),
      ExerciseRow,
      PrefetchHooks Function({bool ownerUserId, bool userExerciseTableRefs})
    >;
typedef $$UserExerciseTableTableCreateCompanionBuilder =
    UserExerciseTableCompanion Function({
      required String id,
      required String userId,
      required String exerciseId,
      Value<bool> isFavorite,
      Value<int?> lastPerformedAt,
      required int createdAt,
      Value<String?> notes,
      Value<int?> deletedOn,
      Value<int> rowid,
    });
typedef $$UserExerciseTableTableUpdateCompanionBuilder =
    UserExerciseTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> exerciseId,
      Value<bool> isFavorite,
      Value<int?> lastPerformedAt,
      Value<int> createdAt,
      Value<String?> notes,
      Value<int?> deletedOn,
      Value<int> rowid,
    });

final class $$UserExerciseTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserExerciseTableTable,
          UserExerciseRow
        > {
  $$UserExerciseTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(db.userExerciseTable.userId, db.appUserTable.id),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExerciseTableTable _exerciseIdTable(_$AppDatabase db) =>
      db.exerciseTable.createAlias(
        $_aliasNameGenerator(
          db.userExerciseTable.exerciseId,
          db.exerciseTable.id,
        ),
      );

  $$ExerciseTableTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExerciseTableTableTableManager(
      $_db,
      $_db.exerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $StrengthProfileTableTable,
    List<StrengthProfileRow>
  >
  _strengthProfileTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.strengthProfileTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.strengthProfileTable.userExerciseId,
        ),
      );

  $$StrengthProfileTableTableProcessedTableManager
  get strengthProfileTableRefs {
    final manager = $$StrengthProfileTableTableTableManager(
      $_db,
      $_db.strengthProfileTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _strengthProfileTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CardioProfileTableTable, List<CardioProfileRow>>
  _cardioProfileTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cardioProfileTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.cardioProfileTable.userExerciseId,
        ),
      );

  $$CardioProfileTableTableProcessedTableManager get cardioProfileTableRefs {
    final manager = $$CardioProfileTableTableTableManager(
      $_db,
      $_db.cardioProfileTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cardioProfileTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ProgressionPolicyTableTable,
    List<ProgressionPolicyRow>
  >
  _progressionPolicyTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.progressionPolicyTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.progressionPolicyTable.userExerciseId,
        ),
      );

  $$ProgressionPolicyTableTableProcessedTableManager
  get progressionPolicyTableRefs {
    final manager = $$ProgressionPolicyTableTableTableManager(
      $_db,
      $_db.progressionPolicyTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _progressionPolicyTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RoutineExerciseTableTable,
    List<RoutineExerciseRow>
  >
  _routineExerciseTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.routineExerciseTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.routineExerciseTable.userExerciseId,
        ),
      );

  $$RoutineExerciseTableTableProcessedTableManager
  get routineExerciseTableRefs {
    final manager = $$RoutineExerciseTableTableTableManager(
      $_db,
      $_db.routineExerciseTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _routineExerciseTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExercisePerformanceLogTableTable,
    List<ExercisePerformanceLogRow>
  >
  _exercisePerformanceLogTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exercisePerformanceLogTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.exercisePerformanceLogTable.userExerciseId,
        ),
      );

  $$ExercisePerformanceLogTableTableProcessedTableManager
  get exercisePerformanceLogTableRefs {
    final manager = $$ExercisePerformanceLogTableTableTableManager(
      $_db,
      $_db.exercisePerformanceLogTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exercisePerformanceLogTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $HistoryStatsRollupTableTable,
    List<HistoryStatsRollupRow>
  >
  _historyStatsRollupTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.historyStatsRollupTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.historyStatsRollupTable.userExerciseId,
        ),
      );

  $$HistoryStatsRollupTableTableProcessedTableManager
  get historyStatsRollupTableRefs {
    final manager = $$HistoryStatsRollupTableTableTableManager(
      $_db,
      $_db.historyStatsRollupTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _historyStatsRollupTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExerciseOverallAggregateTableTable,
    List<ExerciseOverallAggregateRow>
  >
  _exerciseOverallAggregateTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exerciseOverallAggregateTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.exerciseOverallAggregateTable.userExerciseId,
        ),
      );

  $$ExerciseOverallAggregateTableTableProcessedTableManager
  get exerciseOverallAggregateTableRefs {
    final manager = $$ExerciseOverallAggregateTableTableTableManager(
      $_db,
      $_db.exerciseOverallAggregateTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exerciseOverallAggregateTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PersonalRecordEventTableTable,
    List<PersonalRecordEventRow>
  >
  _personalRecordEventTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.personalRecordEventTable,
        aliasName: $_aliasNameGenerator(
          db.userExerciseTable.id,
          db.personalRecordEventTable.userExerciseId,
        ),
      );

  $$PersonalRecordEventTableTableProcessedTableManager
  get personalRecordEventTableRefs {
    final manager = $$PersonalRecordEventTableTableTableManager(
      $_db,
      $_db.personalRecordEventTable,
    ).filter((f) => f.userExerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _personalRecordEventTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserExerciseTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserExerciseTableTable> {
  $$UserExerciseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastPerformedAt => $composableBuilder(
    column: $table.lastPerformedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedOn => $composableBuilder(
    column: $table.deletedOn,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExerciseTableTableFilterComposer get exerciseId {
    final $$ExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.exerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> strengthProfileTableRefs(
    Expression<bool> Function($$StrengthProfileTableTableFilterComposer f) f,
  ) {
    final $$StrengthProfileTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.strengthProfileTable,
      getReferencedColumn: (t) => t.userExerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StrengthProfileTableTableFilterComposer(
            $db: $db,
            $table: $db.strengthProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cardioProfileTableRefs(
    Expression<bool> Function($$CardioProfileTableTableFilterComposer f) f,
  ) {
    final $$CardioProfileTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cardioProfileTable,
      getReferencedColumn: (t) => t.userExerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardioProfileTableTableFilterComposer(
            $db: $db,
            $table: $db.cardioProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> progressionPolicyTableRefs(
    Expression<bool> Function($$ProgressionPolicyTableTableFilterComposer f) f,
  ) {
    final $$ProgressionPolicyTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.progressionPolicyTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgressionPolicyTableTableFilterComposer(
                $db: $db,
                $table: $db.progressionPolicyTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> routineExerciseTableRefs(
    Expression<bool> Function($$RoutineExerciseTableTableFilterComposer f) f,
  ) {
    final $$RoutineExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineExerciseTable,
      getReferencedColumn: (t) => t.userExerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.routineExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exercisePerformanceLogTableRefs(
    Expression<bool> Function(
      $$ExercisePerformanceLogTableTableFilterComposer f,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableFilterComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> historyStatsRollupTableRefs(
    Expression<bool> Function($$HistoryStatsRollupTableTableFilterComposer f) f,
  ) {
    final $$HistoryStatsRollupTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historyStatsRollupTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoryStatsRollupTableTableFilterComposer(
                $db: $db,
                $table: $db.historyStatsRollupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> exerciseOverallAggregateTableRefs(
    Expression<bool> Function(
      $$ExerciseOverallAggregateTableTableFilterComposer f,
    )
    f,
  ) {
    final $$ExerciseOverallAggregateTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseOverallAggregateTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseOverallAggregateTableTableFilterComposer(
                $db: $db,
                $table: $db.exerciseOverallAggregateTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> personalRecordEventTableRefs(
    Expression<bool> Function($$PersonalRecordEventTableTableFilterComposer f)
    f,
  ) {
    final $$PersonalRecordEventTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.personalRecordEventTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PersonalRecordEventTableTableFilterComposer(
                $db: $db,
                $table: $db.personalRecordEventTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UserExerciseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserExerciseTableTable> {
  $$UserExerciseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastPerformedAt => $composableBuilder(
    column: $table.lastPerformedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedOn => $composableBuilder(
    column: $table.deletedOn,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExerciseTableTableOrderingComposer get exerciseId {
    final $$ExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.exerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserExerciseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserExerciseTableTable> {
  $$UserExerciseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastPerformedAt => $composableBuilder(
    column: $table.lastPerformedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get deletedOn =>
      $composableBuilder(column: $table.deletedOn, builder: (column) => column);

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExerciseTableTableAnnotationComposer get exerciseId {
    final $$ExerciseTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseTableTableAnnotationComposer(
            $db: $db,
            $table: $db.exerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> strengthProfileTableRefs<T extends Object>(
    Expression<T> Function($$StrengthProfileTableTableAnnotationComposer a) f,
  ) {
    final $$StrengthProfileTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.strengthProfileTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$StrengthProfileTableTableAnnotationComposer(
                $db: $db,
                $table: $db.strengthProfileTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cardioProfileTableRefs<T extends Object>(
    Expression<T> Function($$CardioProfileTableTableAnnotationComposer a) f,
  ) {
    final $$CardioProfileTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cardioProfileTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CardioProfileTableTableAnnotationComposer(
                $db: $db,
                $table: $db.cardioProfileTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> progressionPolicyTableRefs<T extends Object>(
    Expression<T> Function($$ProgressionPolicyTableTableAnnotationComposer a) f,
  ) {
    final $$ProgressionPolicyTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.progressionPolicyTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgressionPolicyTableTableAnnotationComposer(
                $db: $db,
                $table: $db.progressionPolicyTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> routineExerciseTableRefs<T extends Object>(
    Expression<T> Function($$RoutineExerciseTableTableAnnotationComposer a) f,
  ) {
    final $$RoutineExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.routineExerciseTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.routineExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> exercisePerformanceLogTableRefs<T extends Object>(
    Expression<T> Function(
      $$ExercisePerformanceLogTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> historyStatsRollupTableRefs<T extends Object>(
    Expression<T> Function($$HistoryStatsRollupTableTableAnnotationComposer a)
    f,
  ) {
    final $$HistoryStatsRollupTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historyStatsRollupTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoryStatsRollupTableTableAnnotationComposer(
                $db: $db,
                $table: $db.historyStatsRollupTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> exerciseOverallAggregateTableRefs<T extends Object>(
    Expression<T> Function(
      $$ExerciseOverallAggregateTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ExerciseOverallAggregateTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseOverallAggregateTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseOverallAggregateTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseOverallAggregateTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> personalRecordEventTableRefs<T extends Object>(
    Expression<T> Function($$PersonalRecordEventTableTableAnnotationComposer a)
    f,
  ) {
    final $$PersonalRecordEventTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.personalRecordEventTable,
          getReferencedColumn: (t) => t.userExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PersonalRecordEventTableTableAnnotationComposer(
                $db: $db,
                $table: $db.personalRecordEventTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UserExerciseTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserExerciseTableTable,
          UserExerciseRow,
          $$UserExerciseTableTableFilterComposer,
          $$UserExerciseTableTableOrderingComposer,
          $$UserExerciseTableTableAnnotationComposer,
          $$UserExerciseTableTableCreateCompanionBuilder,
          $$UserExerciseTableTableUpdateCompanionBuilder,
          (UserExerciseRow, $$UserExerciseTableTableReferences),
          UserExerciseRow,
          PrefetchHooks Function({
            bool userId,
            bool exerciseId,
            bool strengthProfileTableRefs,
            bool cardioProfileTableRefs,
            bool progressionPolicyTableRefs,
            bool routineExerciseTableRefs,
            bool exercisePerformanceLogTableRefs,
            bool historyStatsRollupTableRefs,
            bool exerciseOverallAggregateTableRefs,
            bool personalRecordEventTableRefs,
          })
        > {
  $$UserExerciseTableTableTableManager(
    _$AppDatabase db,
    $UserExerciseTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserExerciseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserExerciseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserExerciseTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int?> lastPerformedAt = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> deletedOn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserExerciseTableCompanion(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                isFavorite: isFavorite,
                lastPerformedAt: lastPerformedAt,
                createdAt: createdAt,
                notes: notes,
                deletedOn: deletedOn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String exerciseId,
                Value<bool> isFavorite = const Value.absent(),
                Value<int?> lastPerformedAt = const Value.absent(),
                required int createdAt,
                Value<String?> notes = const Value.absent(),
                Value<int?> deletedOn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserExerciseTableCompanion.insert(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                isFavorite: isFavorite,
                lastPerformedAt: lastPerformedAt,
                createdAt: createdAt,
                notes: notes,
                deletedOn: deletedOn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserExerciseTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                exerciseId = false,
                strengthProfileTableRefs = false,
                cardioProfileTableRefs = false,
                progressionPolicyTableRefs = false,
                routineExerciseTableRefs = false,
                exercisePerformanceLogTableRefs = false,
                historyStatsRollupTableRefs = false,
                exerciseOverallAggregateTableRefs = false,
                personalRecordEventTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (strengthProfileTableRefs) db.strengthProfileTable,
                    if (cardioProfileTableRefs) db.cardioProfileTable,
                    if (progressionPolicyTableRefs) db.progressionPolicyTable,
                    if (routineExerciseTableRefs) db.routineExerciseTable,
                    if (exercisePerformanceLogTableRefs)
                      db.exercisePerformanceLogTable,
                    if (historyStatsRollupTableRefs) db.historyStatsRollupTable,
                    if (exerciseOverallAggregateTableRefs)
                      db.exerciseOverallAggregateTable,
                    if (personalRecordEventTableRefs)
                      db.personalRecordEventTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$UserExerciseTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$UserExerciseTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (exerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseId,
                                    referencedTable:
                                        $$UserExerciseTableTableReferences
                                            ._exerciseIdTable(db),
                                    referencedColumn:
                                        $$UserExerciseTableTableReferences
                                            ._exerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (strengthProfileTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          StrengthProfileRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._strengthProfileTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).strengthProfileTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cardioProfileTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          CardioProfileRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._cardioProfileTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).cardioProfileTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (progressionPolicyTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          ProgressionPolicyRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._progressionPolicyTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).progressionPolicyTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (routineExerciseTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          RoutineExerciseRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._routineExerciseTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).routineExerciseTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exercisePerformanceLogTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          ExercisePerformanceLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._exercisePerformanceLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisePerformanceLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (historyStatsRollupTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          HistoryStatsRollupRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._historyStatsRollupTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).historyStatsRollupTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exerciseOverallAggregateTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          ExerciseOverallAggregateRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._exerciseOverallAggregateTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseOverallAggregateTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (personalRecordEventTableRefs)
                        await $_getPrefetchedData<
                          UserExerciseRow,
                          $UserExerciseTableTable,
                          PersonalRecordEventRow
                        >(
                          currentTable: table,
                          referencedTable: $$UserExerciseTableTableReferences
                              ._personalRecordEventTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).personalRecordEventTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UserExerciseTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserExerciseTableTable,
      UserExerciseRow,
      $$UserExerciseTableTableFilterComposer,
      $$UserExerciseTableTableOrderingComposer,
      $$UserExerciseTableTableAnnotationComposer,
      $$UserExerciseTableTableCreateCompanionBuilder,
      $$UserExerciseTableTableUpdateCompanionBuilder,
      (UserExerciseRow, $$UserExerciseTableTableReferences),
      UserExerciseRow,
      PrefetchHooks Function({
        bool userId,
        bool exerciseId,
        bool strengthProfileTableRefs,
        bool cardioProfileTableRefs,
        bool progressionPolicyTableRefs,
        bool routineExerciseTableRefs,
        bool exercisePerformanceLogTableRefs,
        bool historyStatsRollupTableRefs,
        bool exerciseOverallAggregateTableRefs,
        bool personalRecordEventTableRefs,
      })
    >;
typedef $$StrengthProfileTableTableCreateCompanionBuilder =
    StrengthProfileTableCompanion Function({
      required String userExerciseId,
      required String strengthModality,
      Value<double?> baselineWeight,
      Value<int?> baselineReps,
      Value<int?> baselineDurationSeconds,
      Value<double> volumeMultiplier,
      Value<int> rowid,
    });
typedef $$StrengthProfileTableTableUpdateCompanionBuilder =
    StrengthProfileTableCompanion Function({
      Value<String> userExerciseId,
      Value<String> strengthModality,
      Value<double?> baselineWeight,
      Value<int?> baselineReps,
      Value<int?> baselineDurationSeconds,
      Value<double> volumeMultiplier,
      Value<int> rowid,
    });

final class $$StrengthProfileTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $StrengthProfileTableTable,
          StrengthProfileRow
        > {
  $$StrengthProfileTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.strengthProfileTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StrengthProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $StrengthProfileTableTable> {
  $$StrengthProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get strengthModality => $composableBuilder(
    column: $table.strengthModality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get baselineWeight => $composableBuilder(
    column: $table.baselineWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baselineReps => $composableBuilder(
    column: $table.baselineReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baselineDurationSeconds => $composableBuilder(
    column: $table.baselineDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volumeMultiplier => $composableBuilder(
    column: $table.volumeMultiplier,
    builder: (column) => ColumnFilters(column),
  );

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StrengthProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StrengthProfileTableTable> {
  $$StrengthProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get strengthModality => $composableBuilder(
    column: $table.strengthModality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get baselineWeight => $composableBuilder(
    column: $table.baselineWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baselineReps => $composableBuilder(
    column: $table.baselineReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baselineDurationSeconds => $composableBuilder(
    column: $table.baselineDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volumeMultiplier => $composableBuilder(
    column: $table.volumeMultiplier,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StrengthProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrengthProfileTableTable> {
  $$StrengthProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get strengthModality => $composableBuilder(
    column: $table.strengthModality,
    builder: (column) => column,
  );

  GeneratedColumn<double> get baselineWeight => $composableBuilder(
    column: $table.baselineWeight,
    builder: (column) => column,
  );

  GeneratedColumn<int> get baselineReps => $composableBuilder(
    column: $table.baselineReps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get baselineDurationSeconds => $composableBuilder(
    column: $table.baselineDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get volumeMultiplier => $composableBuilder(
    column: $table.volumeMultiplier,
    builder: (column) => column,
  );

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$StrengthProfileTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StrengthProfileTableTable,
          StrengthProfileRow,
          $$StrengthProfileTableTableFilterComposer,
          $$StrengthProfileTableTableOrderingComposer,
          $$StrengthProfileTableTableAnnotationComposer,
          $$StrengthProfileTableTableCreateCompanionBuilder,
          $$StrengthProfileTableTableUpdateCompanionBuilder,
          (StrengthProfileRow, $$StrengthProfileTableTableReferences),
          StrengthProfileRow,
          PrefetchHooks Function({bool userExerciseId})
        > {
  $$StrengthProfileTableTableTableManager(
    _$AppDatabase db,
    $StrengthProfileTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StrengthProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StrengthProfileTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$StrengthProfileTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userExerciseId = const Value.absent(),
                Value<String> strengthModality = const Value.absent(),
                Value<double?> baselineWeight = const Value.absent(),
                Value<int?> baselineReps = const Value.absent(),
                Value<int?> baselineDurationSeconds = const Value.absent(),
                Value<double> volumeMultiplier = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrengthProfileTableCompanion(
                userExerciseId: userExerciseId,
                strengthModality: strengthModality,
                baselineWeight: baselineWeight,
                baselineReps: baselineReps,
                baselineDurationSeconds: baselineDurationSeconds,
                volumeMultiplier: volumeMultiplier,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userExerciseId,
                required String strengthModality,
                Value<double?> baselineWeight = const Value.absent(),
                Value<int?> baselineReps = const Value.absent(),
                Value<int?> baselineDurationSeconds = const Value.absent(),
                Value<double> volumeMultiplier = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrengthProfileTableCompanion.insert(
                userExerciseId: userExerciseId,
                strengthModality: strengthModality,
                baselineWeight: baselineWeight,
                baselineReps: baselineReps,
                baselineDurationSeconds: baselineDurationSeconds,
                volumeMultiplier: volumeMultiplier,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StrengthProfileTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userExerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userExerciseId,
                                referencedTable:
                                    $$StrengthProfileTableTableReferences
                                        ._userExerciseIdTable(db),
                                referencedColumn:
                                    $$StrengthProfileTableTableReferences
                                        ._userExerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StrengthProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StrengthProfileTableTable,
      StrengthProfileRow,
      $$StrengthProfileTableTableFilterComposer,
      $$StrengthProfileTableTableOrderingComposer,
      $$StrengthProfileTableTableAnnotationComposer,
      $$StrengthProfileTableTableCreateCompanionBuilder,
      $$StrengthProfileTableTableUpdateCompanionBuilder,
      (StrengthProfileRow, $$StrengthProfileTableTableReferences),
      StrengthProfileRow,
      PrefetchHooks Function({bool userExerciseId})
    >;
typedef $$CardioProfileTableTableCreateCompanionBuilder =
    CardioProfileTableCompanion Function({
      required String userExerciseId,
      required String cardioModality,
      Value<double?> baselineSpeed,
      Value<double?> baselineDistance,
      Value<int?> baselineDurationSeconds,
      Value<int?> baselineReps,
      Value<int> rowid,
    });
typedef $$CardioProfileTableTableUpdateCompanionBuilder =
    CardioProfileTableCompanion Function({
      Value<String> userExerciseId,
      Value<String> cardioModality,
      Value<double?> baselineSpeed,
      Value<double?> baselineDistance,
      Value<int?> baselineDurationSeconds,
      Value<int?> baselineReps,
      Value<int> rowid,
    });

final class $$CardioProfileTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CardioProfileTableTable,
          CardioProfileRow
        > {
  $$CardioProfileTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.cardioProfileTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CardioProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $CardioProfileTableTable> {
  $$CardioProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cardioModality => $composableBuilder(
    column: $table.cardioModality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get baselineSpeed => $composableBuilder(
    column: $table.baselineSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get baselineDistance => $composableBuilder(
    column: $table.baselineDistance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baselineDurationSeconds => $composableBuilder(
    column: $table.baselineDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baselineReps => $composableBuilder(
    column: $table.baselineReps,
    builder: (column) => ColumnFilters(column),
  );

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardioProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CardioProfileTableTable> {
  $$CardioProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cardioModality => $composableBuilder(
    column: $table.cardioModality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get baselineSpeed => $composableBuilder(
    column: $table.baselineSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get baselineDistance => $composableBuilder(
    column: $table.baselineDistance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baselineDurationSeconds => $composableBuilder(
    column: $table.baselineDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baselineReps => $composableBuilder(
    column: $table.baselineReps,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardioProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardioProfileTableTable> {
  $$CardioProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cardioModality => $composableBuilder(
    column: $table.cardioModality,
    builder: (column) => column,
  );

  GeneratedColumn<double> get baselineSpeed => $composableBuilder(
    column: $table.baselineSpeed,
    builder: (column) => column,
  );

  GeneratedColumn<double> get baselineDistance => $composableBuilder(
    column: $table.baselineDistance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get baselineDurationSeconds => $composableBuilder(
    column: $table.baselineDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get baselineReps => $composableBuilder(
    column: $table.baselineReps,
    builder: (column) => column,
  );

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CardioProfileTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardioProfileTableTable,
          CardioProfileRow,
          $$CardioProfileTableTableFilterComposer,
          $$CardioProfileTableTableOrderingComposer,
          $$CardioProfileTableTableAnnotationComposer,
          $$CardioProfileTableTableCreateCompanionBuilder,
          $$CardioProfileTableTableUpdateCompanionBuilder,
          (CardioProfileRow, $$CardioProfileTableTableReferences),
          CardioProfileRow,
          PrefetchHooks Function({bool userExerciseId})
        > {
  $$CardioProfileTableTableTableManager(
    _$AppDatabase db,
    $CardioProfileTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardioProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardioProfileTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardioProfileTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userExerciseId = const Value.absent(),
                Value<String> cardioModality = const Value.absent(),
                Value<double?> baselineSpeed = const Value.absent(),
                Value<double?> baselineDistance = const Value.absent(),
                Value<int?> baselineDurationSeconds = const Value.absent(),
                Value<int?> baselineReps = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardioProfileTableCompanion(
                userExerciseId: userExerciseId,
                cardioModality: cardioModality,
                baselineSpeed: baselineSpeed,
                baselineDistance: baselineDistance,
                baselineDurationSeconds: baselineDurationSeconds,
                baselineReps: baselineReps,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userExerciseId,
                required String cardioModality,
                Value<double?> baselineSpeed = const Value.absent(),
                Value<double?> baselineDistance = const Value.absent(),
                Value<int?> baselineDurationSeconds = const Value.absent(),
                Value<int?> baselineReps = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardioProfileTableCompanion.insert(
                userExerciseId: userExerciseId,
                cardioModality: cardioModality,
                baselineSpeed: baselineSpeed,
                baselineDistance: baselineDistance,
                baselineDurationSeconds: baselineDurationSeconds,
                baselineReps: baselineReps,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CardioProfileTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userExerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userExerciseId,
                                referencedTable:
                                    $$CardioProfileTableTableReferences
                                        ._userExerciseIdTable(db),
                                referencedColumn:
                                    $$CardioProfileTableTableReferences
                                        ._userExerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CardioProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardioProfileTableTable,
      CardioProfileRow,
      $$CardioProfileTableTableFilterComposer,
      $$CardioProfileTableTableOrderingComposer,
      $$CardioProfileTableTableAnnotationComposer,
      $$CardioProfileTableTableCreateCompanionBuilder,
      $$CardioProfileTableTableUpdateCompanionBuilder,
      (CardioProfileRow, $$CardioProfileTableTableReferences),
      CardioProfileRow,
      PrefetchHooks Function({bool userExerciseId})
    >;
typedef $$ProgressionPolicyTableTableCreateCompanionBuilder =
    ProgressionPolicyTableCompanion Function({
      required String userExerciseId,
      Value<bool> autoIncrementEnabled,
      Value<int> autoIncrementInterval,
      Value<double> weightDelta,
      Value<int> repsDelta,
      Value<int> durationDeltaSeconds,
      Value<double> distanceDelta,
      Value<double> speedDelta,
      Value<int> rowid,
    });
typedef $$ProgressionPolicyTableTableUpdateCompanionBuilder =
    ProgressionPolicyTableCompanion Function({
      Value<String> userExerciseId,
      Value<bool> autoIncrementEnabled,
      Value<int> autoIncrementInterval,
      Value<double> weightDelta,
      Value<int> repsDelta,
      Value<int> durationDeltaSeconds,
      Value<double> distanceDelta,
      Value<double> speedDelta,
      Value<int> rowid,
    });

final class $$ProgressionPolicyTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProgressionPolicyTableTable,
          ProgressionPolicyRow
        > {
  $$ProgressionPolicyTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.progressionPolicyTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProgressionPolicyTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressionPolicyTableTable> {
  $$ProgressionPolicyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get autoIncrementEnabled => $composableBuilder(
    column: $table.autoIncrementEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get autoIncrementInterval => $composableBuilder(
    column: $table.autoIncrementInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightDelta => $composableBuilder(
    column: $table.weightDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repsDelta => $composableBuilder(
    column: $table.repsDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationDeltaSeconds => $composableBuilder(
    column: $table.durationDeltaSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceDelta => $composableBuilder(
    column: $table.distanceDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speedDelta => $composableBuilder(
    column: $table.speedDelta,
    builder: (column) => ColumnFilters(column),
  );

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressionPolicyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressionPolicyTableTable> {
  $$ProgressionPolicyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get autoIncrementEnabled => $composableBuilder(
    column: $table.autoIncrementEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get autoIncrementInterval => $composableBuilder(
    column: $table.autoIncrementInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightDelta => $composableBuilder(
    column: $table.weightDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repsDelta => $composableBuilder(
    column: $table.repsDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationDeltaSeconds => $composableBuilder(
    column: $table.durationDeltaSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceDelta => $composableBuilder(
    column: $table.distanceDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speedDelta => $composableBuilder(
    column: $table.speedDelta,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressionPolicyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressionPolicyTableTable> {
  $$ProgressionPolicyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get autoIncrementEnabled => $composableBuilder(
    column: $table.autoIncrementEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get autoIncrementInterval => $composableBuilder(
    column: $table.autoIncrementInterval,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightDelta => $composableBuilder(
    column: $table.weightDelta,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repsDelta =>
      $composableBuilder(column: $table.repsDelta, builder: (column) => column);

  GeneratedColumn<int> get durationDeltaSeconds => $composableBuilder(
    column: $table.durationDeltaSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distanceDelta => $composableBuilder(
    column: $table.distanceDelta,
    builder: (column) => column,
  );

  GeneratedColumn<double> get speedDelta => $composableBuilder(
    column: $table.speedDelta,
    builder: (column) => column,
  );

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ProgressionPolicyTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressionPolicyTableTable,
          ProgressionPolicyRow,
          $$ProgressionPolicyTableTableFilterComposer,
          $$ProgressionPolicyTableTableOrderingComposer,
          $$ProgressionPolicyTableTableAnnotationComposer,
          $$ProgressionPolicyTableTableCreateCompanionBuilder,
          $$ProgressionPolicyTableTableUpdateCompanionBuilder,
          (ProgressionPolicyRow, $$ProgressionPolicyTableTableReferences),
          ProgressionPolicyRow,
          PrefetchHooks Function({bool userExerciseId})
        > {
  $$ProgressionPolicyTableTableTableManager(
    _$AppDatabase db,
    $ProgressionPolicyTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressionPolicyTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ProgressionPolicyTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProgressionPolicyTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userExerciseId = const Value.absent(),
                Value<bool> autoIncrementEnabled = const Value.absent(),
                Value<int> autoIncrementInterval = const Value.absent(),
                Value<double> weightDelta = const Value.absent(),
                Value<int> repsDelta = const Value.absent(),
                Value<int> durationDeltaSeconds = const Value.absent(),
                Value<double> distanceDelta = const Value.absent(),
                Value<double> speedDelta = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressionPolicyTableCompanion(
                userExerciseId: userExerciseId,
                autoIncrementEnabled: autoIncrementEnabled,
                autoIncrementInterval: autoIncrementInterval,
                weightDelta: weightDelta,
                repsDelta: repsDelta,
                durationDeltaSeconds: durationDeltaSeconds,
                distanceDelta: distanceDelta,
                speedDelta: speedDelta,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userExerciseId,
                Value<bool> autoIncrementEnabled = const Value.absent(),
                Value<int> autoIncrementInterval = const Value.absent(),
                Value<double> weightDelta = const Value.absent(),
                Value<int> repsDelta = const Value.absent(),
                Value<int> durationDeltaSeconds = const Value.absent(),
                Value<double> distanceDelta = const Value.absent(),
                Value<double> speedDelta = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressionPolicyTableCompanion.insert(
                userExerciseId: userExerciseId,
                autoIncrementEnabled: autoIncrementEnabled,
                autoIncrementInterval: autoIncrementInterval,
                weightDelta: weightDelta,
                repsDelta: repsDelta,
                durationDeltaSeconds: durationDeltaSeconds,
                distanceDelta: distanceDelta,
                speedDelta: speedDelta,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgressionPolicyTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userExerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userExerciseId,
                                referencedTable:
                                    $$ProgressionPolicyTableTableReferences
                                        ._userExerciseIdTable(db),
                                referencedColumn:
                                    $$ProgressionPolicyTableTableReferences
                                        ._userExerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProgressionPolicyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressionPolicyTableTable,
      ProgressionPolicyRow,
      $$ProgressionPolicyTableTableFilterComposer,
      $$ProgressionPolicyTableTableOrderingComposer,
      $$ProgressionPolicyTableTableAnnotationComposer,
      $$ProgressionPolicyTableTableCreateCompanionBuilder,
      $$ProgressionPolicyTableTableUpdateCompanionBuilder,
      (ProgressionPolicyRow, $$ProgressionPolicyTableTableReferences),
      ProgressionPolicyRow,
      PrefetchHooks Function({bool userExerciseId})
    >;
typedef $$RoutineTableTableCreateCompanionBuilder =
    RoutineTableCompanion Function({
      required String id,
      required String userId,
      required String name,
      Value<int?> lastCompletedAt,
      Value<bool> isFavorite,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$RoutineTableTableUpdateCompanionBuilder =
    RoutineTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> name,
      Value<int?> lastCompletedAt,
      Value<bool> isFavorite,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$RoutineTableTableReferences
    extends BaseReferences<_$AppDatabase, $RoutineTableTable, RoutineRow> {
  $$RoutineTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(db.routineTable.userId, db.appUserTable.id),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RoutineExerciseTableTable,
    List<RoutineExerciseRow>
  >
  _routineExerciseTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.routineExerciseTable,
        aliasName: $_aliasNameGenerator(
          db.routineTable.id,
          db.routineExerciseTable.routineId,
        ),
      );

  $$RoutineExerciseTableTableProcessedTableManager
  get routineExerciseTableRefs {
    final manager = $$RoutineExerciseTableTableTableManager(
      $_db,
      $_db.routineExerciseTable,
    ).filter((f) => f.routineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _routineExerciseTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutLogTableTable, List<WorkoutLogRow>>
  _workoutLogTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutLogTable,
    aliasName: $_aliasNameGenerator(
      db.routineTable.id,
      db.workoutLogTable.routineId,
    ),
  );

  $$WorkoutLogTableTableProcessedTableManager get workoutLogTableRefs {
    final manager = $$WorkoutLogTableTableTableManager(
      $_db,
      $_db.workoutLogTable,
    ).filter((f) => f.routineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutLogTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoutineTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineTableTable> {
  $$RoutineTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> routineExerciseTableRefs(
    Expression<bool> Function($$RoutineExerciseTableTableFilterComposer f) f,
  ) {
    final $$RoutineExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineExerciseTable,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.routineExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutLogTableRefs(
    Expression<bool> Function($$WorkoutLogTableTableFilterComposer f) f,
  ) {
    final $$WorkoutLogTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutineTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineTableTable> {
  $$RoutineTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineTableTable> {
  $$RoutineTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> routineExerciseTableRefs<T extends Object>(
    Expression<T> Function($$RoutineExerciseTableTableAnnotationComposer a) f,
  ) {
    final $$RoutineExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.routineExerciseTable,
          getReferencedColumn: (t) => t.routineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.routineExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workoutLogTableRefs<T extends Object>(
    Expression<T> Function($$WorkoutLogTableTableAnnotationComposer a) f,
  ) {
    final $$WorkoutLogTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutineTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineTableTable,
          RoutineRow,
          $$RoutineTableTableFilterComposer,
          $$RoutineTableTableOrderingComposer,
          $$RoutineTableTableAnnotationComposer,
          $$RoutineTableTableCreateCompanionBuilder,
          $$RoutineTableTableUpdateCompanionBuilder,
          (RoutineRow, $$RoutineTableTableReferences),
          RoutineRow,
          PrefetchHooks Function({
            bool userId,
            bool routineExerciseTableRefs,
            bool workoutLogTableRefs,
          })
        > {
  $$RoutineTableTableTableManager(_$AppDatabase db, $RoutineTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> lastCompletedAt = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineTableCompanion(
                id: id,
                userId: userId,
                name: name,
                lastCompletedAt: lastCompletedAt,
                isFavorite: isFavorite,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String name,
                Value<int?> lastCompletedAt = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutineTableCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                lastCompletedAt: lastCompletedAt,
                isFavorite: isFavorite,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoutineTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                routineExerciseTableRefs = false,
                workoutLogTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (routineExerciseTableRefs) db.routineExerciseTable,
                    if (workoutLogTableRefs) db.workoutLogTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$RoutineTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$RoutineTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (routineExerciseTableRefs)
                        await $_getPrefetchedData<
                          RoutineRow,
                          $RoutineTableTable,
                          RoutineExerciseRow
                        >(
                          currentTable: table,
                          referencedTable: $$RoutineTableTableReferences
                              ._routineExerciseTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutineTableTableReferences(
                                db,
                                table,
                                p0,
                              ).routineExerciseTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.routineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutLogTableRefs)
                        await $_getPrefetchedData<
                          RoutineRow,
                          $RoutineTableTable,
                          WorkoutLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$RoutineTableTableReferences
                              ._workoutLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutineTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.routineId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoutineTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineTableTable,
      RoutineRow,
      $$RoutineTableTableFilterComposer,
      $$RoutineTableTableOrderingComposer,
      $$RoutineTableTableAnnotationComposer,
      $$RoutineTableTableCreateCompanionBuilder,
      $$RoutineTableTableUpdateCompanionBuilder,
      (RoutineRow, $$RoutineTableTableReferences),
      RoutineRow,
      PrefetchHooks Function({
        bool userId,
        bool routineExerciseTableRefs,
        bool workoutLogTableRefs,
      })
    >;
typedef $$RoutineExerciseTableTableCreateCompanionBuilder =
    RoutineExerciseTableCompanion Function({
      required String id,
      required String userId,
      required String routineId,
      required String userExerciseId,
      required int exPosition,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$RoutineExerciseTableTableUpdateCompanionBuilder =
    RoutineExerciseTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> routineId,
      Value<String> userExerciseId,
      Value<int> exPosition,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$RoutineExerciseTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RoutineExerciseTableTable,
          RoutineExerciseRow
        > {
  $$RoutineExerciseTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.routineExerciseTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RoutineTableTable _routineIdTable(_$AppDatabase db) =>
      db.routineTable.createAlias(
        $_aliasNameGenerator(
          db.routineExerciseTable.routineId,
          db.routineTable.id,
        ),
      );

  $$RoutineTableTableProcessedTableManager get routineId {
    final $_column = $_itemColumn<String>('routine_id')!;

    final manager = $$RoutineTableTableTableManager(
      $_db,
      $_db.routineTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.routineExerciseTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ExercisePerformanceLogTableTable,
    List<ExercisePerformanceLogRow>
  >
  _exercisePerformanceLogTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exercisePerformanceLogTable,
        aliasName: $_aliasNameGenerator(
          db.routineExerciseTable.id,
          db.exercisePerformanceLogTable.routineExerciseId,
        ),
      );

  $$ExercisePerformanceLogTableTableProcessedTableManager
  get exercisePerformanceLogTableRefs {
    final manager =
        $$ExercisePerformanceLogTableTableTableManager(
          $_db,
          $_db.exercisePerformanceLogTable,
        ).filter(
          (f) => f.routineExerciseId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _exercisePerformanceLogTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoutineExerciseTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineExerciseTableTable> {
  $$RoutineExerciseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exPosition => $composableBuilder(
    column: $table.exPosition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineTableTableFilterComposer get routineId {
    final $$RoutineTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableFilterComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exercisePerformanceLogTableRefs(
    Expression<bool> Function(
      $$ExercisePerformanceLogTableTableFilterComposer f,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.routineExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableFilterComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoutineExerciseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineExerciseTableTable> {
  $$RoutineExerciseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exPosition => $composableBuilder(
    column: $table.exPosition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineTableTableOrderingComposer get routineId {
    final $$RoutineTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableOrderingComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineExerciseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineExerciseTableTable> {
  $$RoutineExerciseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get exPosition => $composableBuilder(
    column: $table.exPosition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineTableTableAnnotationComposer get routineId {
    final $$RoutineTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableAnnotationComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> exercisePerformanceLogTableRefs<T extends Object>(
    Expression<T> Function(
      $$ExercisePerformanceLogTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.routineExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoutineExerciseTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineExerciseTableTable,
          RoutineExerciseRow,
          $$RoutineExerciseTableTableFilterComposer,
          $$RoutineExerciseTableTableOrderingComposer,
          $$RoutineExerciseTableTableAnnotationComposer,
          $$RoutineExerciseTableTableCreateCompanionBuilder,
          $$RoutineExerciseTableTableUpdateCompanionBuilder,
          (RoutineExerciseRow, $$RoutineExerciseTableTableReferences),
          RoutineExerciseRow,
          PrefetchHooks Function({
            bool userId,
            bool routineId,
            bool userExerciseId,
            bool exercisePerformanceLogTableRefs,
          })
        > {
  $$RoutineExerciseTableTableTableManager(
    _$AppDatabase db,
    $RoutineExerciseTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineExerciseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineExerciseTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RoutineExerciseTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> routineId = const Value.absent(),
                Value<String> userExerciseId = const Value.absent(),
                Value<int> exPosition = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineExerciseTableCompanion(
                id: id,
                userId: userId,
                routineId: routineId,
                userExerciseId: userExerciseId,
                exPosition: exPosition,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String routineId,
                required String userExerciseId,
                required int exPosition,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineExerciseTableCompanion.insert(
                id: id,
                userId: userId,
                routineId: routineId,
                userExerciseId: userExerciseId,
                exPosition: exPosition,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoutineExerciseTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                routineId = false,
                userExerciseId = false,
                exercisePerformanceLogTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exercisePerformanceLogTableRefs)
                      db.exercisePerformanceLogTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$RoutineExerciseTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$RoutineExerciseTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (routineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.routineId,
                                    referencedTable:
                                        $$RoutineExerciseTableTableReferences
                                            ._routineIdTable(db),
                                    referencedColumn:
                                        $$RoutineExerciseTableTableReferences
                                            ._routineIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (userExerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userExerciseId,
                                    referencedTable:
                                        $$RoutineExerciseTableTableReferences
                                            ._userExerciseIdTable(db),
                                    referencedColumn:
                                        $$RoutineExerciseTableTableReferences
                                            ._userExerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exercisePerformanceLogTableRefs)
                        await $_getPrefetchedData<
                          RoutineExerciseRow,
                          $RoutineExerciseTableTable,
                          ExercisePerformanceLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$RoutineExerciseTableTableReferences
                              ._exercisePerformanceLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutineExerciseTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisePerformanceLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.routineExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoutineExerciseTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineExerciseTableTable,
      RoutineExerciseRow,
      $$RoutineExerciseTableTableFilterComposer,
      $$RoutineExerciseTableTableOrderingComposer,
      $$RoutineExerciseTableTableAnnotationComposer,
      $$RoutineExerciseTableTableCreateCompanionBuilder,
      $$RoutineExerciseTableTableUpdateCompanionBuilder,
      (RoutineExerciseRow, $$RoutineExerciseTableTableReferences),
      RoutineExerciseRow,
      PrefetchHooks Function({
        bool userId,
        bool routineId,
        bool userExerciseId,
        bool exercisePerformanceLogTableRefs,
      })
    >;
typedef $$WorkoutLogTableTableCreateCompanionBuilder =
    WorkoutLogTableCompanion Function({
      required String id,
      required String userId,
      Value<String?> routineId,
      Value<String?> routineNameSnapshot,
      Value<bool> isAdhoc,
      required int performedAt,
      Value<int?> durationSeconds,
      Value<int> rowid,
    });
typedef $$WorkoutLogTableTableUpdateCompanionBuilder =
    WorkoutLogTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String?> routineId,
      Value<String?> routineNameSnapshot,
      Value<bool> isAdhoc,
      Value<int> performedAt,
      Value<int?> durationSeconds,
      Value<int> rowid,
    });

final class $$WorkoutLogTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkoutLogTableTable, WorkoutLogRow> {
  $$WorkoutLogTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(db.workoutLogTable.userId, db.appUserTable.id),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RoutineTableTable _routineIdTable(_$AppDatabase db) =>
      db.routineTable.createAlias(
        $_aliasNameGenerator(db.workoutLogTable.routineId, db.routineTable.id),
      );

  $$RoutineTableTableProcessedTableManager? get routineId {
    final $_column = $_itemColumn<String>('routine_id');
    if ($_column == null) return null;
    final manager = $$RoutineTableTableTableManager(
      $_db,
      $_db.routineTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ExercisePerformanceLogTableTable,
    List<ExercisePerformanceLogRow>
  >
  _exercisePerformanceLogTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exercisePerformanceLogTable,
        aliasName: $_aliasNameGenerator(
          db.workoutLogTable.id,
          db.exercisePerformanceLogTable.workoutLogId,
        ),
      );

  $$ExercisePerformanceLogTableTableProcessedTableManager
  get exercisePerformanceLogTableRefs {
    final manager = $$ExercisePerformanceLogTableTableTableManager(
      $_db,
      $_db.exercisePerformanceLogTable,
    ).filter((f) => f.workoutLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exercisePerformanceLogTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutLogTableTable> {
  $$WorkoutLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routineNameSnapshot => $composableBuilder(
    column: $table.routineNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAdhoc => $composableBuilder(
    column: $table.isAdhoc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineTableTableFilterComposer get routineId {
    final $$RoutineTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableFilterComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exercisePerformanceLogTableRefs(
    Expression<bool> Function(
      $$ExercisePerformanceLogTableTableFilterComposer f,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.workoutLogId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableFilterComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WorkoutLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutLogTableTable> {
  $$WorkoutLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routineNameSnapshot => $composableBuilder(
    column: $table.routineNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAdhoc => $composableBuilder(
    column: $table.isAdhoc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineTableTableOrderingComposer get routineId {
    final $$RoutineTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableOrderingComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutLogTableTable> {
  $$WorkoutLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get routineNameSnapshot => $composableBuilder(
    column: $table.routineNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAdhoc =>
      $composableBuilder(column: $table.isAdhoc, builder: (column) => column);

  GeneratedColumn<int> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineTableTableAnnotationComposer get routineId {
    final $$RoutineTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routineTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineTableTableAnnotationComposer(
            $db: $db,
            $table: $db.routineTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> exercisePerformanceLogTableRefs<T extends Object>(
    Expression<T> Function(
      $$ExercisePerformanceLogTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ExercisePerformanceLogTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.workoutLogId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WorkoutLogTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutLogTableTable,
          WorkoutLogRow,
          $$WorkoutLogTableTableFilterComposer,
          $$WorkoutLogTableTableOrderingComposer,
          $$WorkoutLogTableTableAnnotationComposer,
          $$WorkoutLogTableTableCreateCompanionBuilder,
          $$WorkoutLogTableTableUpdateCompanionBuilder,
          (WorkoutLogRow, $$WorkoutLogTableTableReferences),
          WorkoutLogRow,
          PrefetchHooks Function({
            bool userId,
            bool routineId,
            bool exercisePerformanceLogTableRefs,
          })
        > {
  $$WorkoutLogTableTableTableManager(
    _$AppDatabase db,
    $WorkoutLogTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutLogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> routineId = const Value.absent(),
                Value<String?> routineNameSnapshot = const Value.absent(),
                Value<bool> isAdhoc = const Value.absent(),
                Value<int> performedAt = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutLogTableCompanion(
                id: id,
                userId: userId,
                routineId: routineId,
                routineNameSnapshot: routineNameSnapshot,
                isAdhoc: isAdhoc,
                performedAt: performedAt,
                durationSeconds: durationSeconds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                Value<String?> routineId = const Value.absent(),
                Value<String?> routineNameSnapshot = const Value.absent(),
                Value<bool> isAdhoc = const Value.absent(),
                required int performedAt,
                Value<int?> durationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutLogTableCompanion.insert(
                id: id,
                userId: userId,
                routineId: routineId,
                routineNameSnapshot: routineNameSnapshot,
                isAdhoc: isAdhoc,
                performedAt: performedAt,
                durationSeconds: durationSeconds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutLogTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                routineId = false,
                exercisePerformanceLogTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exercisePerformanceLogTableRefs)
                      db.exercisePerformanceLogTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$WorkoutLogTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$WorkoutLogTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (routineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.routineId,
                                    referencedTable:
                                        $$WorkoutLogTableTableReferences
                                            ._routineIdTable(db),
                                    referencedColumn:
                                        $$WorkoutLogTableTableReferences
                                            ._routineIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exercisePerformanceLogTableRefs)
                        await $_getPrefetchedData<
                          WorkoutLogRow,
                          $WorkoutLogTableTable,
                          ExercisePerformanceLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutLogTableTableReferences
                              ._exercisePerformanceLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutLogTableTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisePerformanceLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workoutLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutLogTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutLogTableTable,
      WorkoutLogRow,
      $$WorkoutLogTableTableFilterComposer,
      $$WorkoutLogTableTableOrderingComposer,
      $$WorkoutLogTableTableAnnotationComposer,
      $$WorkoutLogTableTableCreateCompanionBuilder,
      $$WorkoutLogTableTableUpdateCompanionBuilder,
      (WorkoutLogRow, $$WorkoutLogTableTableReferences),
      WorkoutLogRow,
      PrefetchHooks Function({
        bool userId,
        bool routineId,
        bool exercisePerformanceLogTableRefs,
      })
    >;
typedef $$ExercisePerformanceLogTableTableCreateCompanionBuilder =
    ExercisePerformanceLogTableCompanion Function({
      required String id,
      required String userId,
      required String workoutLogId,
      required String userExerciseId,
      Value<String?> routineExerciseId,
      Value<bool> wasPartOfRoutine,
      Value<int?> autoIncrementCountSession,
      required int performedAt,
      Value<int> rowid,
    });
typedef $$ExercisePerformanceLogTableTableUpdateCompanionBuilder =
    ExercisePerformanceLogTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> workoutLogId,
      Value<String> userExerciseId,
      Value<String?> routineExerciseId,
      Value<bool> wasPartOfRoutine,
      Value<int?> autoIncrementCountSession,
      Value<int> performedAt,
      Value<int> rowid,
    });

final class $$ExercisePerformanceLogTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExercisePerformanceLogTableTable,
          ExercisePerformanceLogRow
        > {
  $$ExercisePerformanceLogTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.exercisePerformanceLogTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkoutLogTableTable _workoutLogIdTable(_$AppDatabase db) =>
      db.workoutLogTable.createAlias(
        $_aliasNameGenerator(
          db.exercisePerformanceLogTable.workoutLogId,
          db.workoutLogTable.id,
        ),
      );

  $$WorkoutLogTableTableProcessedTableManager get workoutLogId {
    final $_column = $_itemColumn<String>('workout_log_id')!;

    final manager = $$WorkoutLogTableTableTableManager(
      $_db,
      $_db.workoutLogTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.exercisePerformanceLogTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RoutineExerciseTableTable _routineExerciseIdTable(_$AppDatabase db) =>
      db.routineExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.exercisePerformanceLogTable.routineExerciseId,
          db.routineExerciseTable.id,
        ),
      );

  $$RoutineExerciseTableTableProcessedTableManager? get routineExerciseId {
    final $_column = $_itemColumn<String>('routine_exercise_id');
    if ($_column == null) return null;
    final manager = $$RoutineExerciseTableTableTableManager(
      $_db,
      $_db.routineExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SetLogTableTable, List<SetLogRow>>
  _setLogTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.setLogTable,
    aliasName: $_aliasNameGenerator(
      db.exercisePerformanceLogTable.id,
      db.setLogTable.exercisePerformanceLogId,
    ),
  );

  $$SetLogTableTableProcessedTableManager get setLogTableRefs {
    final manager = $$SetLogTableTableTableManager($_db, $_db.setLogTable)
        .filter(
          (f) => f.exercisePerformanceLogId.id.sqlEquals(
            $_itemColumn<String>('id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_setLogTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExercisePerformanceLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisePerformanceLogTableTable> {
  $$ExercisePerformanceLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasPartOfRoutine => $composableBuilder(
    column: $table.wasPartOfRoutine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get autoIncrementCountSession => $composableBuilder(
    column: $table.autoIncrementCountSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutLogTableTableFilterComposer get workoutLogId {
    final $$WorkoutLogTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutLogId,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineExerciseTableTableFilterComposer get routineExerciseId {
    final $$RoutineExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineExerciseId,
      referencedTable: $db.routineExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.routineExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> setLogTableRefs(
    Expression<bool> Function($$SetLogTableTableFilterComposer f) f,
  ) {
    final $$SetLogTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogTable,
      getReferencedColumn: (t) => t.exercisePerformanceLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogTableTableFilterComposer(
            $db: $db,
            $table: $db.setLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExercisePerformanceLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisePerformanceLogTableTable> {
  $$ExercisePerformanceLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasPartOfRoutine => $composableBuilder(
    column: $table.wasPartOfRoutine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get autoIncrementCountSession => $composableBuilder(
    column: $table.autoIncrementCountSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutLogTableTableOrderingComposer get workoutLogId {
    final $$WorkoutLogTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutLogId,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableOrderingComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoutineExerciseTableTableOrderingComposer get routineExerciseId {
    final $$RoutineExerciseTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.routineExerciseId,
          referencedTable: $db.routineExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExerciseTableTableOrderingComposer(
                $db: $db,
                $table: $db.routineExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ExercisePerformanceLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisePerformanceLogTableTable> {
  $$ExercisePerformanceLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get wasPartOfRoutine => $composableBuilder(
    column: $table.wasPartOfRoutine,
    builder: (column) => column,
  );

  GeneratedColumn<int> get autoIncrementCountSession => $composableBuilder(
    column: $table.autoIncrementCountSession,
    builder: (column) => column,
  );

  GeneratedColumn<int> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutLogTableTableAnnotationComposer get workoutLogId {
    final $$WorkoutLogTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutLogId,
      referencedTable: $db.workoutLogTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$RoutineExerciseTableTableAnnotationComposer get routineExerciseId {
    final $$RoutineExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.routineExerciseId,
          referencedTable: $db.routineExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoutineExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.routineExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> setLogTableRefs<T extends Object>(
    Expression<T> Function($$SetLogTableTableAnnotationComposer a) f,
  ) {
    final $$SetLogTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogTable,
      getReferencedColumn: (t) => t.exercisePerformanceLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogTableTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExercisePerformanceLogTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisePerformanceLogTableTable,
          ExercisePerformanceLogRow,
          $$ExercisePerformanceLogTableTableFilterComposer,
          $$ExercisePerformanceLogTableTableOrderingComposer,
          $$ExercisePerformanceLogTableTableAnnotationComposer,
          $$ExercisePerformanceLogTableTableCreateCompanionBuilder,
          $$ExercisePerformanceLogTableTableUpdateCompanionBuilder,
          (
            ExercisePerformanceLogRow,
            $$ExercisePerformanceLogTableTableReferences,
          ),
          ExercisePerformanceLogRow,
          PrefetchHooks Function({
            bool userId,
            bool workoutLogId,
            bool userExerciseId,
            bool routineExerciseId,
            bool setLogTableRefs,
          })
        > {
  $$ExercisePerformanceLogTableTableTableManager(
    _$AppDatabase db,
    $ExercisePerformanceLogTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisePerformanceLogTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ExercisePerformanceLogTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExercisePerformanceLogTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> workoutLogId = const Value.absent(),
                Value<String> userExerciseId = const Value.absent(),
                Value<String?> routineExerciseId = const Value.absent(),
                Value<bool> wasPartOfRoutine = const Value.absent(),
                Value<int?> autoIncrementCountSession = const Value.absent(),
                Value<int> performedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisePerformanceLogTableCompanion(
                id: id,
                userId: userId,
                workoutLogId: workoutLogId,
                userExerciseId: userExerciseId,
                routineExerciseId: routineExerciseId,
                wasPartOfRoutine: wasPartOfRoutine,
                autoIncrementCountSession: autoIncrementCountSession,
                performedAt: performedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String workoutLogId,
                required String userExerciseId,
                Value<String?> routineExerciseId = const Value.absent(),
                Value<bool> wasPartOfRoutine = const Value.absent(),
                Value<int?> autoIncrementCountSession = const Value.absent(),
                required int performedAt,
                Value<int> rowid = const Value.absent(),
              }) => ExercisePerformanceLogTableCompanion.insert(
                id: id,
                userId: userId,
                workoutLogId: workoutLogId,
                userExerciseId: userExerciseId,
                routineExerciseId: routineExerciseId,
                wasPartOfRoutine: wasPartOfRoutine,
                autoIncrementCountSession: autoIncrementCountSession,
                performedAt: performedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisePerformanceLogTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                workoutLogId = false,
                userExerciseId = false,
                routineExerciseId = false,
                setLogTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (setLogTableRefs) db.setLogTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (workoutLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workoutLogId,
                                    referencedTable:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._workoutLogIdTable(db),
                                    referencedColumn:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._workoutLogIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (userExerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userExerciseId,
                                    referencedTable:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._userExerciseIdTable(db),
                                    referencedColumn:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._userExerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (routineExerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.routineExerciseId,
                                    referencedTable:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._routineExerciseIdTable(db),
                                    referencedColumn:
                                        $$ExercisePerformanceLogTableTableReferences
                                            ._routineExerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (setLogTableRefs)
                        await $_getPrefetchedData<
                          ExercisePerformanceLogRow,
                          $ExercisePerformanceLogTableTable,
                          SetLogRow
                        >(
                          currentTable: table,
                          referencedTable:
                              $$ExercisePerformanceLogTableTableReferences
                                  ._setLogTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisePerformanceLogTableTableReferences(
                                db,
                                table,
                                p0,
                              ).setLogTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exercisePerformanceLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExercisePerformanceLogTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisePerformanceLogTableTable,
      ExercisePerformanceLogRow,
      $$ExercisePerformanceLogTableTableFilterComposer,
      $$ExercisePerformanceLogTableTableOrderingComposer,
      $$ExercisePerformanceLogTableTableAnnotationComposer,
      $$ExercisePerformanceLogTableTableCreateCompanionBuilder,
      $$ExercisePerformanceLogTableTableUpdateCompanionBuilder,
      (ExercisePerformanceLogRow, $$ExercisePerformanceLogTableTableReferences),
      ExercisePerformanceLogRow,
      PrefetchHooks Function({
        bool userId,
        bool workoutLogId,
        bool userExerciseId,
        bool routineExerciseId,
        bool setLogTableRefs,
      })
    >;
typedef $$SetLogTableTableCreateCompanionBuilder =
    SetLogTableCompanion Function({
      required String id,
      required String userId,
      required String exercisePerformanceLogId,
      required int setNumber,
      Value<double?> weight,
      Value<int?> reps,
      Value<int?> durationSeconds,
      Value<double?> distance,
      Value<double?> speed,
      Value<int?> restTimeSeconds,
      Value<int> rowid,
    });
typedef $$SetLogTableTableUpdateCompanionBuilder =
    SetLogTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> exercisePerformanceLogId,
      Value<int> setNumber,
      Value<double?> weight,
      Value<int?> reps,
      Value<int?> durationSeconds,
      Value<double?> distance,
      Value<double?> speed,
      Value<int?> restTimeSeconds,
      Value<int> rowid,
    });

final class $$SetLogTableTableReferences
    extends BaseReferences<_$AppDatabase, $SetLogTableTable, SetLogRow> {
  $$SetLogTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(db.setLogTable.userId, db.appUserTable.id),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisePerformanceLogTableTable _exercisePerformanceLogIdTable(
    _$AppDatabase db,
  ) => db.exercisePerformanceLogTable.createAlias(
    $_aliasNameGenerator(
      db.setLogTable.exercisePerformanceLogId,
      db.exercisePerformanceLogTable.id,
    ),
  );

  $$ExercisePerformanceLogTableTableProcessedTableManager
  get exercisePerformanceLogId {
    final $_column = $_itemColumn<String>('exercise_performance_log_id')!;

    final manager = $$ExercisePerformanceLogTableTableTableManager(
      $_db,
      $_db.exercisePerformanceLogTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _exercisePerformanceLogIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SetLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $SetLogTableTable> {
  $$SetLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restTimeSeconds => $composableBuilder(
    column: $table.restTimeSeconds,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisePerformanceLogTableTableFilterComposer
  get exercisePerformanceLogId {
    final $$ExercisePerformanceLogTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.exercisePerformanceLogId,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableFilterComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SetLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SetLogTableTable> {
  $$SetLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restTimeSeconds => $composableBuilder(
    column: $table.restTimeSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisePerformanceLogTableTableOrderingComposer
  get exercisePerformanceLogId {
    final $$ExercisePerformanceLogTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.exercisePerformanceLogId,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableOrderingComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SetLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetLogTableTable> {
  $$SetLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<int> get restTimeSeconds => $composableBuilder(
    column: $table.restTimeSeconds,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisePerformanceLogTableTableAnnotationComposer
  get exercisePerformanceLogId {
    final $$ExercisePerformanceLogTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.exercisePerformanceLogId,
          referencedTable: $db.exercisePerformanceLogTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePerformanceLogTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePerformanceLogTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SetLogTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetLogTableTable,
          SetLogRow,
          $$SetLogTableTableFilterComposer,
          $$SetLogTableTableOrderingComposer,
          $$SetLogTableTableAnnotationComposer,
          $$SetLogTableTableCreateCompanionBuilder,
          $$SetLogTableTableUpdateCompanionBuilder,
          (SetLogRow, $$SetLogTableTableReferences),
          SetLogRow,
          PrefetchHooks Function({bool userId, bool exercisePerformanceLogId})
        > {
  $$SetLogTableTableTableManager(_$AppDatabase db, $SetLogTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetLogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> exercisePerformanceLogId = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<double?> distance = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<int?> restTimeSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetLogTableCompanion(
                id: id,
                userId: userId,
                exercisePerformanceLogId: exercisePerformanceLogId,
                setNumber: setNumber,
                weight: weight,
                reps: reps,
                durationSeconds: durationSeconds,
                distance: distance,
                speed: speed,
                restTimeSeconds: restTimeSeconds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String exercisePerformanceLogId,
                required int setNumber,
                Value<double?> weight = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<double?> distance = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<int?> restTimeSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetLogTableCompanion.insert(
                id: id,
                userId: userId,
                exercisePerformanceLogId: exercisePerformanceLogId,
                setNumber: setNumber,
                weight: weight,
                reps: reps,
                durationSeconds: durationSeconds,
                distance: distance,
                speed: speed,
                restTimeSeconds: restTimeSeconds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SetLogTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userId = false, exercisePerformanceLogId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$SetLogTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$SetLogTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (exercisePerformanceLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn:
                                        table.exercisePerformanceLogId,
                                    referencedTable:
                                        $$SetLogTableTableReferences
                                            ._exercisePerformanceLogIdTable(db),
                                    referencedColumn:
                                        $$SetLogTableTableReferences
                                            ._exercisePerformanceLogIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$SetLogTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetLogTableTable,
      SetLogRow,
      $$SetLogTableTableFilterComposer,
      $$SetLogTableTableOrderingComposer,
      $$SetLogTableTableAnnotationComposer,
      $$SetLogTableTableCreateCompanionBuilder,
      $$SetLogTableTableUpdateCompanionBuilder,
      (SetLogRow, $$SetLogTableTableReferences),
      SetLogRow,
      PrefetchHooks Function({bool userId, bool exercisePerformanceLogId})
    >;
typedef $$ActiveWorkoutDraftTableTableCreateCompanionBuilder =
    ActiveWorkoutDraftTableCompanion Function({
      Value<int> id,
      required String userId,
      required String routineId,
      required String userExerciseId,
      required int startedAt,
      required Map<String, dynamic> payloadJson,
    });
typedef $$ActiveWorkoutDraftTableTableUpdateCompanionBuilder =
    ActiveWorkoutDraftTableCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> routineId,
      Value<String> userExerciseId,
      Value<int> startedAt,
      Value<Map<String, dynamic>> payloadJson,
    });

final class $$ActiveWorkoutDraftTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ActiveWorkoutDraftTableTable,
          ActiveWorkoutDraftRow
        > {
  $$ActiveWorkoutDraftTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.activeWorkoutDraftTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActiveWorkoutDraftTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActiveWorkoutDraftTableTable> {
  $$ActiveWorkoutDraftTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routineId => $composableBuilder(
    column: $table.routineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userExerciseId => $composableBuilder(
    column: $table.userExerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>,
    Map<String, dynamic>,
    String
  >
  get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActiveWorkoutDraftTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActiveWorkoutDraftTableTable> {
  $$ActiveWorkoutDraftTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routineId => $composableBuilder(
    column: $table.routineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userExerciseId => $composableBuilder(
    column: $table.userExerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActiveWorkoutDraftTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActiveWorkoutDraftTableTable> {
  $$ActiveWorkoutDraftTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get routineId =>
      $composableBuilder(column: $table.routineId, builder: (column) => column);

  GeneratedColumn<String> get userExerciseId => $composableBuilder(
    column: $table.userExerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
  get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActiveWorkoutDraftTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActiveWorkoutDraftTableTable,
          ActiveWorkoutDraftRow,
          $$ActiveWorkoutDraftTableTableFilterComposer,
          $$ActiveWorkoutDraftTableTableOrderingComposer,
          $$ActiveWorkoutDraftTableTableAnnotationComposer,
          $$ActiveWorkoutDraftTableTableCreateCompanionBuilder,
          $$ActiveWorkoutDraftTableTableUpdateCompanionBuilder,
          (ActiveWorkoutDraftRow, $$ActiveWorkoutDraftTableTableReferences),
          ActiveWorkoutDraftRow,
          PrefetchHooks Function({bool userId})
        > {
  $$ActiveWorkoutDraftTableTableTableManager(
    _$AppDatabase db,
    $ActiveWorkoutDraftTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActiveWorkoutDraftTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ActiveWorkoutDraftTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ActiveWorkoutDraftTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> routineId = const Value.absent(),
                Value<String> userExerciseId = const Value.absent(),
                Value<int> startedAt = const Value.absent(),
                Value<Map<String, dynamic>> payloadJson = const Value.absent(),
              }) => ActiveWorkoutDraftTableCompanion(
                id: id,
                userId: userId,
                routineId: routineId,
                userExerciseId: userExerciseId,
                startedAt: startedAt,
                payloadJson: payloadJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String routineId,
                required String userExerciseId,
                required int startedAt,
                required Map<String, dynamic> payloadJson,
              }) => ActiveWorkoutDraftTableCompanion.insert(
                id: id,
                userId: userId,
                routineId: routineId,
                userExerciseId: userExerciseId,
                startedAt: startedAt,
                payloadJson: payloadJson,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActiveWorkoutDraftTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$ActiveWorkoutDraftTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$ActiveWorkoutDraftTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActiveWorkoutDraftTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActiveWorkoutDraftTableTable,
      ActiveWorkoutDraftRow,
      $$ActiveWorkoutDraftTableTableFilterComposer,
      $$ActiveWorkoutDraftTableTableOrderingComposer,
      $$ActiveWorkoutDraftTableTableAnnotationComposer,
      $$ActiveWorkoutDraftTableTableCreateCompanionBuilder,
      $$ActiveWorkoutDraftTableTableUpdateCompanionBuilder,
      (ActiveWorkoutDraftRow, $$ActiveWorkoutDraftTableTableReferences),
      ActiveWorkoutDraftRow,
      PrefetchHooks Function({bool userId})
    >;
typedef $$HistoryStatsRollupTableTableCreateCompanionBuilder =
    HistoryStatsRollupTableCompanion Function({
      required String userId,
      required String userExerciseId,
      required int dayEpoch,
      Value<int> setCount,
      Value<double> totalVolume,
      Value<int> totalReps,
      Value<double?> maxWeight,
      Value<double?> minWeight,
      Value<double?> oneRepMax,
      Value<int?> totalDurationSeconds,
      Value<double?> totalDistance,
      Value<double?> maxSpeed,
      Value<double?> avgSpeed,
      Value<int> rowid,
    });
typedef $$HistoryStatsRollupTableTableUpdateCompanionBuilder =
    HistoryStatsRollupTableCompanion Function({
      Value<String> userId,
      Value<String> userExerciseId,
      Value<int> dayEpoch,
      Value<int> setCount,
      Value<double> totalVolume,
      Value<int> totalReps,
      Value<double?> maxWeight,
      Value<double?> minWeight,
      Value<double?> oneRepMax,
      Value<int?> totalDurationSeconds,
      Value<double?> totalDistance,
      Value<double?> maxSpeed,
      Value<double?> avgSpeed,
      Value<int> rowid,
    });

final class $$HistoryStatsRollupTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HistoryStatsRollupTableTable,
          HistoryStatsRollupRow
        > {
  $$HistoryStatsRollupTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.historyStatsRollupTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.historyStatsRollupTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HistoryStatsRollupTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryStatsRollupTableTable> {
  $$HistoryStatsRollupTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get dayEpoch => $composableBuilder(
    column: $table.dayEpoch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setCount => $composableBuilder(
    column: $table.setCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalReps => $composableBuilder(
    column: $table.totalReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxWeight => $composableBuilder(
    column: $table.maxWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minWeight => $composableBuilder(
    column: $table.minWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get oneRepMax => $composableBuilder(
    column: $table.oneRepMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxSpeed => $composableBuilder(
    column: $table.maxSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get avgSpeed => $composableBuilder(
    column: $table.avgSpeed,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryStatsRollupTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryStatsRollupTableTable> {
  $$HistoryStatsRollupTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get dayEpoch => $composableBuilder(
    column: $table.dayEpoch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setCount => $composableBuilder(
    column: $table.setCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalReps => $composableBuilder(
    column: $table.totalReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxWeight => $composableBuilder(
    column: $table.maxWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minWeight => $composableBuilder(
    column: $table.minWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get oneRepMax => $composableBuilder(
    column: $table.oneRepMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxSpeed => $composableBuilder(
    column: $table.maxSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get avgSpeed => $composableBuilder(
    column: $table.avgSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryStatsRollupTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryStatsRollupTableTable> {
  $$HistoryStatsRollupTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get dayEpoch =>
      $composableBuilder(column: $table.dayEpoch, builder: (column) => column);

  GeneratedColumn<int> get setCount =>
      $composableBuilder(column: $table.setCount, builder: (column) => column);

  GeneratedColumn<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalReps =>
      $composableBuilder(column: $table.totalReps, builder: (column) => column);

  GeneratedColumn<double> get maxWeight =>
      $composableBuilder(column: $table.maxWeight, builder: (column) => column);

  GeneratedColumn<double> get minWeight =>
      $composableBuilder(column: $table.minWeight, builder: (column) => column);

  GeneratedColumn<double> get oneRepMax =>
      $composableBuilder(column: $table.oneRepMax, builder: (column) => column);

  GeneratedColumn<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maxSpeed =>
      $composableBuilder(column: $table.maxSpeed, builder: (column) => column);

  GeneratedColumn<double> get avgSpeed =>
      $composableBuilder(column: $table.avgSpeed, builder: (column) => column);

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$HistoryStatsRollupTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryStatsRollupTableTable,
          HistoryStatsRollupRow,
          $$HistoryStatsRollupTableTableFilterComposer,
          $$HistoryStatsRollupTableTableOrderingComposer,
          $$HistoryStatsRollupTableTableAnnotationComposer,
          $$HistoryStatsRollupTableTableCreateCompanionBuilder,
          $$HistoryStatsRollupTableTableUpdateCompanionBuilder,
          (HistoryStatsRollupRow, $$HistoryStatsRollupTableTableReferences),
          HistoryStatsRollupRow,
          PrefetchHooks Function({bool userId, bool userExerciseId})
        > {
  $$HistoryStatsRollupTableTableTableManager(
    _$AppDatabase db,
    $HistoryStatsRollupTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryStatsRollupTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$HistoryStatsRollupTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$HistoryStatsRollupTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> userExerciseId = const Value.absent(),
                Value<int> dayEpoch = const Value.absent(),
                Value<int> setCount = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<int> totalReps = const Value.absent(),
                Value<double?> maxWeight = const Value.absent(),
                Value<double?> minWeight = const Value.absent(),
                Value<double?> oneRepMax = const Value.absent(),
                Value<int?> totalDurationSeconds = const Value.absent(),
                Value<double?> totalDistance = const Value.absent(),
                Value<double?> maxSpeed = const Value.absent(),
                Value<double?> avgSpeed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HistoryStatsRollupTableCompanion(
                userId: userId,
                userExerciseId: userExerciseId,
                dayEpoch: dayEpoch,
                setCount: setCount,
                totalVolume: totalVolume,
                totalReps: totalReps,
                maxWeight: maxWeight,
                minWeight: minWeight,
                oneRepMax: oneRepMax,
                totalDurationSeconds: totalDurationSeconds,
                totalDistance: totalDistance,
                maxSpeed: maxSpeed,
                avgSpeed: avgSpeed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String userExerciseId,
                required int dayEpoch,
                Value<int> setCount = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<int> totalReps = const Value.absent(),
                Value<double?> maxWeight = const Value.absent(),
                Value<double?> minWeight = const Value.absent(),
                Value<double?> oneRepMax = const Value.absent(),
                Value<int?> totalDurationSeconds = const Value.absent(),
                Value<double?> totalDistance = const Value.absent(),
                Value<double?> maxSpeed = const Value.absent(),
                Value<double?> avgSpeed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HistoryStatsRollupTableCompanion.insert(
                userId: userId,
                userExerciseId: userExerciseId,
                dayEpoch: dayEpoch,
                setCount: setCount,
                totalVolume: totalVolume,
                totalReps: totalReps,
                maxWeight: maxWeight,
                minWeight: minWeight,
                oneRepMax: oneRepMax,
                totalDurationSeconds: totalDurationSeconds,
                totalDistance: totalDistance,
                maxSpeed: maxSpeed,
                avgSpeed: avgSpeed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistoryStatsRollupTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, userExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$HistoryStatsRollupTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$HistoryStatsRollupTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (userExerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userExerciseId,
                                referencedTable:
                                    $$HistoryStatsRollupTableTableReferences
                                        ._userExerciseIdTable(db),
                                referencedColumn:
                                    $$HistoryStatsRollupTableTableReferences
                                        ._userExerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HistoryStatsRollupTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryStatsRollupTableTable,
      HistoryStatsRollupRow,
      $$HistoryStatsRollupTableTableFilterComposer,
      $$HistoryStatsRollupTableTableOrderingComposer,
      $$HistoryStatsRollupTableTableAnnotationComposer,
      $$HistoryStatsRollupTableTableCreateCompanionBuilder,
      $$HistoryStatsRollupTableTableUpdateCompanionBuilder,
      (HistoryStatsRollupRow, $$HistoryStatsRollupTableTableReferences),
      HistoryStatsRollupRow,
      PrefetchHooks Function({bool userId, bool userExerciseId})
    >;
typedef $$ExerciseOverallAggregateTableTableCreateCompanionBuilder =
    ExerciseOverallAggregateTableCompanion Function({
      required String userExerciseId,
      required String userId,
      Value<int> timesCompleted,
      Value<int?> firstCompletedOn,
      Value<int?> lastCompletedOn,
      Value<double> totalVolume,
      Value<int> totalReps,
      Value<int> totalSets,
      Value<int> totalDurationSeconds,
      Value<double> totalDistance,
      Value<double?> pbMaxWeight,
      Value<double?> pbOneRepMax,
      Value<int?> pbMaxRepsSet,
      Value<double?> pbMaxVolumeSession,
      Value<double?> pbMaxDistance,
      Value<double?> pbMaxSpeed,
      Value<int?> pbMaxDurationSeconds,
      Value<int> rowid,
    });
typedef $$ExerciseOverallAggregateTableTableUpdateCompanionBuilder =
    ExerciseOverallAggregateTableCompanion Function({
      Value<String> userExerciseId,
      Value<String> userId,
      Value<int> timesCompleted,
      Value<int?> firstCompletedOn,
      Value<int?> lastCompletedOn,
      Value<double> totalVolume,
      Value<int> totalReps,
      Value<int> totalSets,
      Value<int> totalDurationSeconds,
      Value<double> totalDistance,
      Value<double?> pbMaxWeight,
      Value<double?> pbOneRepMax,
      Value<int?> pbMaxRepsSet,
      Value<double?> pbMaxVolumeSession,
      Value<double?> pbMaxDistance,
      Value<double?> pbMaxSpeed,
      Value<int?> pbMaxDurationSeconds,
      Value<int> rowid,
    });

final class $$ExerciseOverallAggregateTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExerciseOverallAggregateTableTable,
          ExerciseOverallAggregateRow
        > {
  $$ExerciseOverallAggregateTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.exerciseOverallAggregateTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id')!;

    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.exerciseOverallAggregateTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExerciseOverallAggregateTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseOverallAggregateTableTable> {
  $$ExerciseOverallAggregateTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get timesCompleted => $composableBuilder(
    column: $table.timesCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstCompletedOn => $composableBuilder(
    column: $table.firstCompletedOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastCompletedOn => $composableBuilder(
    column: $table.lastCompletedOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalReps => $composableBuilder(
    column: $table.totalReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSets => $composableBuilder(
    column: $table.totalSets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pbMaxWeight => $composableBuilder(
    column: $table.pbMaxWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pbOneRepMax => $composableBuilder(
    column: $table.pbOneRepMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pbMaxRepsSet => $composableBuilder(
    column: $table.pbMaxRepsSet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pbMaxVolumeSession => $composableBuilder(
    column: $table.pbMaxVolumeSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pbMaxDistance => $composableBuilder(
    column: $table.pbMaxDistance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pbMaxSpeed => $composableBuilder(
    column: $table.pbMaxSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pbMaxDurationSeconds => $composableBuilder(
    column: $table.pbMaxDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseOverallAggregateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseOverallAggregateTableTable> {
  $$ExerciseOverallAggregateTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get timesCompleted => $composableBuilder(
    column: $table.timesCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstCompletedOn => $composableBuilder(
    column: $table.firstCompletedOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastCompletedOn => $composableBuilder(
    column: $table.lastCompletedOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalReps => $composableBuilder(
    column: $table.totalReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSets => $composableBuilder(
    column: $table.totalSets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pbMaxWeight => $composableBuilder(
    column: $table.pbMaxWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pbOneRepMax => $composableBuilder(
    column: $table.pbOneRepMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pbMaxRepsSet => $composableBuilder(
    column: $table.pbMaxRepsSet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pbMaxVolumeSession => $composableBuilder(
    column: $table.pbMaxVolumeSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pbMaxDistance => $composableBuilder(
    column: $table.pbMaxDistance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pbMaxSpeed => $composableBuilder(
    column: $table.pbMaxSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pbMaxDurationSeconds => $composableBuilder(
    column: $table.pbMaxDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseOverallAggregateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseOverallAggregateTableTable> {
  $$ExerciseOverallAggregateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get timesCompleted => $composableBuilder(
    column: $table.timesCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstCompletedOn => $composableBuilder(
    column: $table.firstCompletedOn,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastCompletedOn => $composableBuilder(
    column: $table.lastCompletedOn,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalReps =>
      $composableBuilder(column: $table.totalReps, builder: (column) => column);

  GeneratedColumn<int> get totalSets =>
      $composableBuilder(column: $table.totalSets, builder: (column) => column);

  GeneratedColumn<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pbMaxWeight => $composableBuilder(
    column: $table.pbMaxWeight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pbOneRepMax => $composableBuilder(
    column: $table.pbOneRepMax,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pbMaxRepsSet => $composableBuilder(
    column: $table.pbMaxRepsSet,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pbMaxVolumeSession => $composableBuilder(
    column: $table.pbMaxVolumeSession,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pbMaxDistance => $composableBuilder(
    column: $table.pbMaxDistance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pbMaxSpeed => $composableBuilder(
    column: $table.pbMaxSpeed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pbMaxDurationSeconds => $composableBuilder(
    column: $table.pbMaxDurationSeconds,
    builder: (column) => column,
  );

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseOverallAggregateTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseOverallAggregateTableTable,
          ExerciseOverallAggregateRow,
          $$ExerciseOverallAggregateTableTableFilterComposer,
          $$ExerciseOverallAggregateTableTableOrderingComposer,
          $$ExerciseOverallAggregateTableTableAnnotationComposer,
          $$ExerciseOverallAggregateTableTableCreateCompanionBuilder,
          $$ExerciseOverallAggregateTableTableUpdateCompanionBuilder,
          (
            ExerciseOverallAggregateRow,
            $$ExerciseOverallAggregateTableTableReferences,
          ),
          ExerciseOverallAggregateRow,
          PrefetchHooks Function({bool userExerciseId, bool userId})
        > {
  $$ExerciseOverallAggregateTableTableTableManager(
    _$AppDatabase db,
    $ExerciseOverallAggregateTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseOverallAggregateTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ExerciseOverallAggregateTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExerciseOverallAggregateTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userExerciseId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> timesCompleted = const Value.absent(),
                Value<int?> firstCompletedOn = const Value.absent(),
                Value<int?> lastCompletedOn = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<int> totalReps = const Value.absent(),
                Value<int> totalSets = const Value.absent(),
                Value<int> totalDurationSeconds = const Value.absent(),
                Value<double> totalDistance = const Value.absent(),
                Value<double?> pbMaxWeight = const Value.absent(),
                Value<double?> pbOneRepMax = const Value.absent(),
                Value<int?> pbMaxRepsSet = const Value.absent(),
                Value<double?> pbMaxVolumeSession = const Value.absent(),
                Value<double?> pbMaxDistance = const Value.absent(),
                Value<double?> pbMaxSpeed = const Value.absent(),
                Value<int?> pbMaxDurationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseOverallAggregateTableCompanion(
                userExerciseId: userExerciseId,
                userId: userId,
                timesCompleted: timesCompleted,
                firstCompletedOn: firstCompletedOn,
                lastCompletedOn: lastCompletedOn,
                totalVolume: totalVolume,
                totalReps: totalReps,
                totalSets: totalSets,
                totalDurationSeconds: totalDurationSeconds,
                totalDistance: totalDistance,
                pbMaxWeight: pbMaxWeight,
                pbOneRepMax: pbOneRepMax,
                pbMaxRepsSet: pbMaxRepsSet,
                pbMaxVolumeSession: pbMaxVolumeSession,
                pbMaxDistance: pbMaxDistance,
                pbMaxSpeed: pbMaxSpeed,
                pbMaxDurationSeconds: pbMaxDurationSeconds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userExerciseId,
                required String userId,
                Value<int> timesCompleted = const Value.absent(),
                Value<int?> firstCompletedOn = const Value.absent(),
                Value<int?> lastCompletedOn = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<int> totalReps = const Value.absent(),
                Value<int> totalSets = const Value.absent(),
                Value<int> totalDurationSeconds = const Value.absent(),
                Value<double> totalDistance = const Value.absent(),
                Value<double?> pbMaxWeight = const Value.absent(),
                Value<double?> pbOneRepMax = const Value.absent(),
                Value<int?> pbMaxRepsSet = const Value.absent(),
                Value<double?> pbMaxVolumeSession = const Value.absent(),
                Value<double?> pbMaxDistance = const Value.absent(),
                Value<double?> pbMaxSpeed = const Value.absent(),
                Value<int?> pbMaxDurationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseOverallAggregateTableCompanion.insert(
                userExerciseId: userExerciseId,
                userId: userId,
                timesCompleted: timesCompleted,
                firstCompletedOn: firstCompletedOn,
                lastCompletedOn: lastCompletedOn,
                totalVolume: totalVolume,
                totalReps: totalReps,
                totalSets: totalSets,
                totalDurationSeconds: totalDurationSeconds,
                totalDistance: totalDistance,
                pbMaxWeight: pbMaxWeight,
                pbOneRepMax: pbOneRepMax,
                pbMaxRepsSet: pbMaxRepsSet,
                pbMaxVolumeSession: pbMaxVolumeSession,
                pbMaxDistance: pbMaxDistance,
                pbMaxSpeed: pbMaxSpeed,
                pbMaxDurationSeconds: pbMaxDurationSeconds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExerciseOverallAggregateTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userExerciseId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userExerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userExerciseId,
                                referencedTable:
                                    $$ExerciseOverallAggregateTableTableReferences
                                        ._userExerciseIdTable(db),
                                referencedColumn:
                                    $$ExerciseOverallAggregateTableTableReferences
                                        ._userExerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$ExerciseOverallAggregateTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$ExerciseOverallAggregateTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExerciseOverallAggregateTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseOverallAggregateTableTable,
      ExerciseOverallAggregateRow,
      $$ExerciseOverallAggregateTableTableFilterComposer,
      $$ExerciseOverallAggregateTableTableOrderingComposer,
      $$ExerciseOverallAggregateTableTableAnnotationComposer,
      $$ExerciseOverallAggregateTableTableCreateCompanionBuilder,
      $$ExerciseOverallAggregateTableTableUpdateCompanionBuilder,
      (
        ExerciseOverallAggregateRow,
        $$ExerciseOverallAggregateTableTableReferences,
      ),
      ExerciseOverallAggregateRow,
      PrefetchHooks Function({bool userExerciseId, bool userId})
    >;
typedef $$PersonalRecordEventTableTableCreateCompanionBuilder =
    PersonalRecordEventTableCompanion Function({
      required String id,
      required String userId,
      Value<String?> userExerciseId,
      required String exerciseNameSnapshot,
      required String metric,
      required double value,
      Value<double?> previousValue,
      required int achievedAt,
      Value<int> rowid,
    });
typedef $$PersonalRecordEventTableTableUpdateCompanionBuilder =
    PersonalRecordEventTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String?> userExerciseId,
      Value<String> exerciseNameSnapshot,
      Value<String> metric,
      Value<double> value,
      Value<double?> previousValue,
      Value<int> achievedAt,
      Value<int> rowid,
    });

final class $$PersonalRecordEventTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PersonalRecordEventTableTable,
          PersonalRecordEventRow
        > {
  $$PersonalRecordEventTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.personalRecordEventTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserExerciseTableTable _userExerciseIdTable(_$AppDatabase db) =>
      db.userExerciseTable.createAlias(
        $_aliasNameGenerator(
          db.personalRecordEventTable.userExerciseId,
          db.userExerciseTable.id,
        ),
      );

  $$UserExerciseTableTableProcessedTableManager? get userExerciseId {
    final $_column = $_itemColumn<String>('user_exercise_id');
    if ($_column == null) return null;
    final manager = $$UserExerciseTableTableTableManager(
      $_db,
      $_db.userExerciseTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PersonalRecordEventTableTableFilterComposer
    extends Composer<_$AppDatabase, $PersonalRecordEventTableTable> {
  $$PersonalRecordEventTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseNameSnapshot => $composableBuilder(
    column: $table.exerciseNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metric => $composableBuilder(
    column: $table.metric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get previousValue => $composableBuilder(
    column: $table.previousValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get achievedAt => $composableBuilder(
    column: $table.achievedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableFilterComposer get userExerciseId {
    final $$UserExerciseTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableFilterComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PersonalRecordEventTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonalRecordEventTableTable> {
  $$PersonalRecordEventTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseNameSnapshot => $composableBuilder(
    column: $table.exerciseNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metric => $composableBuilder(
    column: $table.metric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get previousValue => $composableBuilder(
    column: $table.previousValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get achievedAt => $composableBuilder(
    column: $table.achievedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableOrderingComposer get userExerciseId {
    final $$UserExerciseTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userExerciseId,
      referencedTable: $db.userExerciseTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserExerciseTableTableOrderingComposer(
            $db: $db,
            $table: $db.userExerciseTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PersonalRecordEventTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonalRecordEventTableTable> {
  $$PersonalRecordEventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get exerciseNameSnapshot => $composableBuilder(
    column: $table.exerciseNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metric =>
      $composableBuilder(column: $table.metric, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<double> get previousValue => $composableBuilder(
    column: $table.previousValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get achievedAt => $composableBuilder(
    column: $table.achievedAt,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserExerciseTableTableAnnotationComposer get userExerciseId {
    final $$UserExerciseTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.userExerciseId,
          referencedTable: $db.userExerciseTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserExerciseTableTableAnnotationComposer(
                $db: $db,
                $table: $db.userExerciseTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$PersonalRecordEventTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonalRecordEventTableTable,
          PersonalRecordEventRow,
          $$PersonalRecordEventTableTableFilterComposer,
          $$PersonalRecordEventTableTableOrderingComposer,
          $$PersonalRecordEventTableTableAnnotationComposer,
          $$PersonalRecordEventTableTableCreateCompanionBuilder,
          $$PersonalRecordEventTableTableUpdateCompanionBuilder,
          (PersonalRecordEventRow, $$PersonalRecordEventTableTableReferences),
          PersonalRecordEventRow,
          PrefetchHooks Function({bool userId, bool userExerciseId})
        > {
  $$PersonalRecordEventTableTableTableManager(
    _$AppDatabase db,
    $PersonalRecordEventTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonalRecordEventTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PersonalRecordEventTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PersonalRecordEventTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> userExerciseId = const Value.absent(),
                Value<String> exerciseNameSnapshot = const Value.absent(),
                Value<String> metric = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<double?> previousValue = const Value.absent(),
                Value<int> achievedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonalRecordEventTableCompanion(
                id: id,
                userId: userId,
                userExerciseId: userExerciseId,
                exerciseNameSnapshot: exerciseNameSnapshot,
                metric: metric,
                value: value,
                previousValue: previousValue,
                achievedAt: achievedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                Value<String?> userExerciseId = const Value.absent(),
                required String exerciseNameSnapshot,
                required String metric,
                required double value,
                Value<double?> previousValue = const Value.absent(),
                required int achievedAt,
                Value<int> rowid = const Value.absent(),
              }) => PersonalRecordEventTableCompanion.insert(
                id: id,
                userId: userId,
                userExerciseId: userExerciseId,
                exerciseNameSnapshot: exerciseNameSnapshot,
                metric: metric,
                value: value,
                previousValue: previousValue,
                achievedAt: achievedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PersonalRecordEventTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, userExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$PersonalRecordEventTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$PersonalRecordEventTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (userExerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userExerciseId,
                                referencedTable:
                                    $$PersonalRecordEventTableTableReferences
                                        ._userExerciseIdTable(db),
                                referencedColumn:
                                    $$PersonalRecordEventTableTableReferences
                                        ._userExerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PersonalRecordEventTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonalRecordEventTableTable,
      PersonalRecordEventRow,
      $$PersonalRecordEventTableTableFilterComposer,
      $$PersonalRecordEventTableTableOrderingComposer,
      $$PersonalRecordEventTableTableAnnotationComposer,
      $$PersonalRecordEventTableTableCreateCompanionBuilder,
      $$PersonalRecordEventTableTableUpdateCompanionBuilder,
      (PersonalRecordEventRow, $$PersonalRecordEventTableTableReferences),
      PersonalRecordEventRow,
      PrefetchHooks Function({bool userId, bool userExerciseId})
    >;
typedef $$UserOverallStatsTableTableCreateCompanionBuilder =
    UserOverallStatsTableCompanion Function({
      required String userId,
      Value<int> totalWorkouts,
      Value<double> totalVolume,
      Value<double> totalDistance,
      Value<int> totalSets,
      Value<int> totalDurationSeconds,
      Value<int> totalExercisesPerformed,
      Value<int?> strongestDayEpoch,
      Value<double> strongestDayVolume,
      Value<int?> longestDayEpoch,
      Value<int> longestDayDurationSeconds,
      Value<int> rowid,
    });
typedef $$UserOverallStatsTableTableUpdateCompanionBuilder =
    UserOverallStatsTableCompanion Function({
      Value<String> userId,
      Value<int> totalWorkouts,
      Value<double> totalVolume,
      Value<double> totalDistance,
      Value<int> totalSets,
      Value<int> totalDurationSeconds,
      Value<int> totalExercisesPerformed,
      Value<int?> strongestDayEpoch,
      Value<double> strongestDayVolume,
      Value<int?> longestDayEpoch,
      Value<int> longestDayDurationSeconds,
      Value<int> rowid,
    });

final class $$UserOverallStatsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserOverallStatsTableTable,
          UserOverallStatsRow
        > {
  $$UserOverallStatsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.userOverallStatsTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserOverallStatsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserOverallStatsTableTable> {
  $$UserOverallStatsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get totalWorkouts => $composableBuilder(
    column: $table.totalWorkouts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSets => $composableBuilder(
    column: $table.totalSets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalExercisesPerformed => $composableBuilder(
    column: $table.totalExercisesPerformed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strongestDayEpoch => $composableBuilder(
    column: $table.strongestDayEpoch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get strongestDayVolume => $composableBuilder(
    column: $table.strongestDayVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestDayEpoch => $composableBuilder(
    column: $table.longestDayEpoch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestDayDurationSeconds => $composableBuilder(
    column: $table.longestDayDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserOverallStatsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserOverallStatsTableTable> {
  $$UserOverallStatsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get totalWorkouts => $composableBuilder(
    column: $table.totalWorkouts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSets => $composableBuilder(
    column: $table.totalSets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalExercisesPerformed => $composableBuilder(
    column: $table.totalExercisesPerformed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strongestDayEpoch => $composableBuilder(
    column: $table.strongestDayEpoch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get strongestDayVolume => $composableBuilder(
    column: $table.strongestDayVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestDayEpoch => $composableBuilder(
    column: $table.longestDayEpoch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestDayDurationSeconds => $composableBuilder(
    column: $table.longestDayDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserOverallStatsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserOverallStatsTableTable> {
  $$UserOverallStatsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get totalWorkouts => $composableBuilder(
    column: $table.totalWorkouts,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalDistance => $composableBuilder(
    column: $table.totalDistance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSets =>
      $composableBuilder(column: $table.totalSets, builder: (column) => column);

  GeneratedColumn<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalExercisesPerformed => $composableBuilder(
    column: $table.totalExercisesPerformed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get strongestDayEpoch => $composableBuilder(
    column: $table.strongestDayEpoch,
    builder: (column) => column,
  );

  GeneratedColumn<double> get strongestDayVolume => $composableBuilder(
    column: $table.strongestDayVolume,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestDayEpoch => $composableBuilder(
    column: $table.longestDayEpoch,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestDayDurationSeconds => $composableBuilder(
    column: $table.longestDayDurationSeconds,
    builder: (column) => column,
  );

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserOverallStatsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserOverallStatsTableTable,
          UserOverallStatsRow,
          $$UserOverallStatsTableTableFilterComposer,
          $$UserOverallStatsTableTableOrderingComposer,
          $$UserOverallStatsTableTableAnnotationComposer,
          $$UserOverallStatsTableTableCreateCompanionBuilder,
          $$UserOverallStatsTableTableUpdateCompanionBuilder,
          (UserOverallStatsRow, $$UserOverallStatsTableTableReferences),
          UserOverallStatsRow,
          PrefetchHooks Function({bool userId})
        > {
  $$UserOverallStatsTableTableTableManager(
    _$AppDatabase db,
    $UserOverallStatsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserOverallStatsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UserOverallStatsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UserOverallStatsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<int> totalWorkouts = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<double> totalDistance = const Value.absent(),
                Value<int> totalSets = const Value.absent(),
                Value<int> totalDurationSeconds = const Value.absent(),
                Value<int> totalExercisesPerformed = const Value.absent(),
                Value<int?> strongestDayEpoch = const Value.absent(),
                Value<double> strongestDayVolume = const Value.absent(),
                Value<int?> longestDayEpoch = const Value.absent(),
                Value<int> longestDayDurationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserOverallStatsTableCompanion(
                userId: userId,
                totalWorkouts: totalWorkouts,
                totalVolume: totalVolume,
                totalDistance: totalDistance,
                totalSets: totalSets,
                totalDurationSeconds: totalDurationSeconds,
                totalExercisesPerformed: totalExercisesPerformed,
                strongestDayEpoch: strongestDayEpoch,
                strongestDayVolume: strongestDayVolume,
                longestDayEpoch: longestDayEpoch,
                longestDayDurationSeconds: longestDayDurationSeconds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<int> totalWorkouts = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<double> totalDistance = const Value.absent(),
                Value<int> totalSets = const Value.absent(),
                Value<int> totalDurationSeconds = const Value.absent(),
                Value<int> totalExercisesPerformed = const Value.absent(),
                Value<int?> strongestDayEpoch = const Value.absent(),
                Value<double> strongestDayVolume = const Value.absent(),
                Value<int?> longestDayEpoch = const Value.absent(),
                Value<int> longestDayDurationSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserOverallStatsTableCompanion.insert(
                userId: userId,
                totalWorkouts: totalWorkouts,
                totalVolume: totalVolume,
                totalDistance: totalDistance,
                totalSets: totalSets,
                totalDurationSeconds: totalDurationSeconds,
                totalExercisesPerformed: totalExercisesPerformed,
                strongestDayEpoch: strongestDayEpoch,
                strongestDayVolume: strongestDayVolume,
                longestDayEpoch: longestDayEpoch,
                longestDayDurationSeconds: longestDayDurationSeconds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserOverallStatsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$UserOverallStatsTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$UserOverallStatsTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserOverallStatsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserOverallStatsTableTable,
      UserOverallStatsRow,
      $$UserOverallStatsTableTableFilterComposer,
      $$UserOverallStatsTableTableOrderingComposer,
      $$UserOverallStatsTableTableAnnotationComposer,
      $$UserOverallStatsTableTableCreateCompanionBuilder,
      $$UserOverallStatsTableTableUpdateCompanionBuilder,
      (UserOverallStatsRow, $$UserOverallStatsTableTableReferences),
      UserOverallStatsRow,
      PrefetchHooks Function({bool userId})
    >;
typedef $$MuscleUsageDailyTableTableCreateCompanionBuilder =
    MuscleUsageDailyTableCompanion Function({
      required String userId,
      required String bodyPart,
      required int dayEpoch,
      Value<int> setsCount,
      Value<double> score,
      Value<int> rowid,
    });
typedef $$MuscleUsageDailyTableTableUpdateCompanionBuilder =
    MuscleUsageDailyTableCompanion Function({
      Value<String> userId,
      Value<String> bodyPart,
      Value<int> dayEpoch,
      Value<int> setsCount,
      Value<double> score,
      Value<int> rowid,
    });

final class $$MuscleUsageDailyTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MuscleUsageDailyTableTable,
          MuscleUsageDailyRow
        > {
  $$MuscleUsageDailyTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppUserTableTable _userIdTable(_$AppDatabase db) =>
      db.appUserTable.createAlias(
        $_aliasNameGenerator(
          db.muscleUsageDailyTable.userId,
          db.appUserTable.id,
        ),
      );

  $$AppUserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$AppUserTableTableTableManager(
      $_db,
      $_db.appUserTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MuscleUsageDailyTableTableFilterComposer
    extends Composer<_$AppDatabase, $MuscleUsageDailyTableTable> {
  $$MuscleUsageDailyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get bodyPart => $composableBuilder(
    column: $table.bodyPart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayEpoch => $composableBuilder(
    column: $table.dayEpoch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setsCount => $composableBuilder(
    column: $table.setsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  $$AppUserTableTableFilterComposer get userId {
    final $$AppUserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableFilterComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MuscleUsageDailyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MuscleUsageDailyTableTable> {
  $$MuscleUsageDailyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get bodyPart => $composableBuilder(
    column: $table.bodyPart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayEpoch => $composableBuilder(
    column: $table.dayEpoch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setsCount => $composableBuilder(
    column: $table.setsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppUserTableTableOrderingComposer get userId {
    final $$AppUserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableOrderingComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MuscleUsageDailyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MuscleUsageDailyTableTable> {
  $$MuscleUsageDailyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get bodyPart =>
      $composableBuilder(column: $table.bodyPart, builder: (column) => column);

  GeneratedColumn<int> get dayEpoch =>
      $composableBuilder(column: $table.dayEpoch, builder: (column) => column);

  GeneratedColumn<int> get setsCount =>
      $composableBuilder(column: $table.setsCount, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  $$AppUserTableTableAnnotationComposer get userId {
    final $$AppUserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.appUserTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.appUserTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MuscleUsageDailyTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MuscleUsageDailyTableTable,
          MuscleUsageDailyRow,
          $$MuscleUsageDailyTableTableFilterComposer,
          $$MuscleUsageDailyTableTableOrderingComposer,
          $$MuscleUsageDailyTableTableAnnotationComposer,
          $$MuscleUsageDailyTableTableCreateCompanionBuilder,
          $$MuscleUsageDailyTableTableUpdateCompanionBuilder,
          (MuscleUsageDailyRow, $$MuscleUsageDailyTableTableReferences),
          MuscleUsageDailyRow,
          PrefetchHooks Function({bool userId})
        > {
  $$MuscleUsageDailyTableTableTableManager(
    _$AppDatabase db,
    $MuscleUsageDailyTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MuscleUsageDailyTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$MuscleUsageDailyTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MuscleUsageDailyTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> bodyPart = const Value.absent(),
                Value<int> dayEpoch = const Value.absent(),
                Value<int> setsCount = const Value.absent(),
                Value<double> score = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MuscleUsageDailyTableCompanion(
                userId: userId,
                bodyPart: bodyPart,
                dayEpoch: dayEpoch,
                setsCount: setsCount,
                score: score,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String bodyPart,
                required int dayEpoch,
                Value<int> setsCount = const Value.absent(),
                Value<double> score = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MuscleUsageDailyTableCompanion.insert(
                userId: userId,
                bodyPart: bodyPart,
                dayEpoch: dayEpoch,
                setsCount: setsCount,
                score: score,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MuscleUsageDailyTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$MuscleUsageDailyTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$MuscleUsageDailyTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MuscleUsageDailyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MuscleUsageDailyTableTable,
      MuscleUsageDailyRow,
      $$MuscleUsageDailyTableTableFilterComposer,
      $$MuscleUsageDailyTableTableOrderingComposer,
      $$MuscleUsageDailyTableTableAnnotationComposer,
      $$MuscleUsageDailyTableTableCreateCompanionBuilder,
      $$MuscleUsageDailyTableTableUpdateCompanionBuilder,
      (MuscleUsageDailyRow, $$MuscleUsageDailyTableTableReferences),
      MuscleUsageDailyRow,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db, _db.appUserTable);
  $$AppMetadataTableTableTableManager get appMetadataTable =>
      $$AppMetadataTableTableTableManager(_db, _db.appMetadataTable);
  $$ExerciseTableTableTableManager get exerciseTable =>
      $$ExerciseTableTableTableManager(_db, _db.exerciseTable);
  $$UserExerciseTableTableTableManager get userExerciseTable =>
      $$UserExerciseTableTableTableManager(_db, _db.userExerciseTable);
  $$StrengthProfileTableTableTableManager get strengthProfileTable =>
      $$StrengthProfileTableTableTableManager(_db, _db.strengthProfileTable);
  $$CardioProfileTableTableTableManager get cardioProfileTable =>
      $$CardioProfileTableTableTableManager(_db, _db.cardioProfileTable);
  $$ProgressionPolicyTableTableTableManager get progressionPolicyTable =>
      $$ProgressionPolicyTableTableTableManager(
        _db,
        _db.progressionPolicyTable,
      );
  $$RoutineTableTableTableManager get routineTable =>
      $$RoutineTableTableTableManager(_db, _db.routineTable);
  $$RoutineExerciseTableTableTableManager get routineExerciseTable =>
      $$RoutineExerciseTableTableTableManager(_db, _db.routineExerciseTable);
  $$WorkoutLogTableTableTableManager get workoutLogTable =>
      $$WorkoutLogTableTableTableManager(_db, _db.workoutLogTable);
  $$ExercisePerformanceLogTableTableTableManager
  get exercisePerformanceLogTable =>
      $$ExercisePerformanceLogTableTableTableManager(
        _db,
        _db.exercisePerformanceLogTable,
      );
  $$SetLogTableTableTableManager get setLogTable =>
      $$SetLogTableTableTableManager(_db, _db.setLogTable);
  $$ActiveWorkoutDraftTableTableTableManager get activeWorkoutDraftTable =>
      $$ActiveWorkoutDraftTableTableTableManager(
        _db,
        _db.activeWorkoutDraftTable,
      );
  $$HistoryStatsRollupTableTableTableManager get historyStatsRollupTable =>
      $$HistoryStatsRollupTableTableTableManager(
        _db,
        _db.historyStatsRollupTable,
      );
  $$ExerciseOverallAggregateTableTableTableManager
  get exerciseOverallAggregateTable =>
      $$ExerciseOverallAggregateTableTableTableManager(
        _db,
        _db.exerciseOverallAggregateTable,
      );
  $$PersonalRecordEventTableTableTableManager get personalRecordEventTable =>
      $$PersonalRecordEventTableTableTableManager(
        _db,
        _db.personalRecordEventTable,
      );
  $$UserOverallStatsTableTableTableManager get userOverallStatsTable =>
      $$UserOverallStatsTableTableTableManager(_db, _db.userOverallStatsTable);
  $$MuscleUsageDailyTableTableTableManager get muscleUsageDailyTable =>
      $$MuscleUsageDailyTableTableTableManager(_db, _db.muscleUsageDailyTable);
}
