// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_db.dart';

// ignore_for_file: type=lint
class NoteItemData extends DataClass implements Insertable<NoteItemData> {
  final int id;
  final String title;
  final String noteText;
  final DateTime? limitDate;
  final bool isNotify;
  const NoteItemData(
      {required this.id,
      required this.title,
      required this.noteText,
      this.limitDate,
      required this.isNotify});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['note_text'] = Variable<String>(noteText);
    if (!nullToAbsent || limitDate != null) {
      map['limit_date'] = Variable<DateTime>(limitDate);
    }
    map['is_notify'] = Variable<bool>(isNotify);
    return map;
  }

  NoteItemCompanion toCompanion(bool nullToAbsent) {
    return NoteItemCompanion(
      id: Value(id),
      title: Value(title),
      noteText: Value(noteText),
      limitDate: limitDate == null && nullToAbsent
          ? const Value.absent()
          : Value(limitDate),
      isNotify: Value(isNotify),
    );
  }

  factory NoteItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteItemData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      noteText: serializer.fromJson<String>(json['noteText']),
      limitDate: serializer.fromJson<DateTime?>(json['limitDate']),
      isNotify: serializer.fromJson<bool>(json['isNotify']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'noteText': serializer.toJson<String>(noteText),
      'limitDate': serializer.toJson<DateTime?>(limitDate),
      'isNotify': serializer.toJson<bool>(isNotify),
    };
  }

  NoteItemData copyWith(
          {int? id,
          String? title,
          String? noteText,
          Value<DateTime?> limitDate = const Value.absent(),
          bool? isNotify}) =>
      NoteItemData(
        id: id ?? this.id,
        title: title ?? this.title,
        noteText: noteText ?? this.noteText,
        limitDate: limitDate.present ? limitDate.value : this.limitDate,
        isNotify: isNotify ?? this.isNotify,
      );
  @override
  String toString() {
    return (StringBuffer('NoteItemData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('noteText: $noteText, ')
          ..write('limitDate: $limitDate, ')
          ..write('isNotify: $isNotify')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, noteText, limitDate, isNotify);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteItemData &&
          other.id == this.id &&
          other.title == this.title &&
          other.noteText == this.noteText &&
          other.limitDate == this.limitDate &&
          other.isNotify == this.isNotify);
}

class NoteItemCompanion extends UpdateCompanion<NoteItemData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> noteText;
  final Value<DateTime?> limitDate;
  final Value<bool> isNotify;
  const NoteItemCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.noteText = const Value.absent(),
    this.limitDate = const Value.absent(),
    this.isNotify = const Value.absent(),
  });
  NoteItemCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.noteText = const Value.absent(),
    this.limitDate = const Value.absent(),
    this.isNotify = const Value.absent(),
  });
  static Insertable<NoteItemData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? noteText,
    Expression<DateTime>? limitDate,
    Expression<bool>? isNotify,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (noteText != null) 'note_text': noteText,
      if (limitDate != null) 'limit_date': limitDate,
      if (isNotify != null) 'is_notify': isNotify,
    });
  }

  NoteItemCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? noteText,
      Value<DateTime?>? limitDate,
      Value<bool>? isNotify}) {
    return NoteItemCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      noteText: noteText ?? this.noteText,
      limitDate: limitDate ?? this.limitDate,
      isNotify: isNotify ?? this.isNotify,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (noteText.present) {
      map['note_text'] = Variable<String>(noteText.value);
    }
    if (limitDate.present) {
      map['limit_date'] = Variable<DateTime>(limitDate.value);
    }
    if (isNotify.present) {
      map['is_notify'] = Variable<bool>(isNotify.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteItemCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('noteText: $noteText, ')
          ..write('limitDate: $limitDate, ')
          ..write('isNotify: $isNotify')
          ..write(')'))
        .toString();
  }
}

class $NoteItemTable extends NoteItem
    with TableInfo<$NoteItemTable, NoteItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title =
      GeneratedColumn<String>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  static const VerificationMeta _noteTextMeta =
      const VerificationMeta('noteText');
  @override
  late final GeneratedColumn<String> noteText = GeneratedColumn<String>(
      'note_text', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _limitDateMeta =
      const VerificationMeta('limitDate');
  @override
  late final GeneratedColumn<DateTime> limitDate = GeneratedColumn<DateTime>(
      'limit_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isNotifyMeta =
      const VerificationMeta('isNotify');
  @override
  late final GeneratedColumn<bool> isNotify =
      GeneratedColumn<bool>('is_notify', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_notify" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, noteText, limitDate, isNotify];
  @override
  String get aliasedName => _alias ?? 'note_item';
  @override
  String get actualTableName => 'note_item';
  @override
  VerificationContext validateIntegrity(Insertable<NoteItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('note_text')) {
      context.handle(_noteTextMeta,
          noteText.isAcceptableOrUnknown(data['note_text']!, _noteTextMeta));
    }
    if (data.containsKey('limit_date')) {
      context.handle(_limitDateMeta,
          limitDate.isAcceptableOrUnknown(data['limit_date']!, _limitDateMeta));
    }
    if (data.containsKey('is_notify')) {
      context.handle(_isNotifyMeta,
          isNotify.isAcceptableOrUnknown(data['is_notify']!, _isNotifyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      noteText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note_text'])!,
      limitDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}limit_date']),
      isNotify: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_notify'])!,
    );
  }

  @override
  $NoteItemTable createAlias(String alias) {
    return $NoteItemTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $NoteItemTable noteItem = $NoteItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noteItem];
}
