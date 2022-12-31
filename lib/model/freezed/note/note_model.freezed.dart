// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<NoteItemData> get noteItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteStateDataCopyWith<NoteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateDataCopyWith<$Res> {
  factory $NoteStateDataCopyWith(
          NoteStateData value, $Res Function(NoteStateData) then) =
      _$NoteStateDataCopyWithImpl<$Res, NoteStateData>;
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<NoteItemData> noteItems});
}

/// @nodoc
class _$NoteStateDataCopyWithImpl<$Res, $Val extends NoteStateData>
    implements $NoteStateDataCopyWith<$Res> {
  _$NoteStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? noteItems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      noteItems: null == noteItems
          ? _value.noteItems
          : noteItems // ignore: cast_nullable_to_non_nullable
              as List<NoteItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteStateDataCopyWith<$Res>
    implements $NoteStateDataCopyWith<$Res> {
  factory _$$_NoteStateDataCopyWith(
          _$_NoteStateData value, $Res Function(_$_NoteStateData) then) =
      __$$_NoteStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<NoteItemData> noteItems});
}

/// @nodoc
class __$$_NoteStateDataCopyWithImpl<$Res>
    extends _$NoteStateDataCopyWithImpl<$Res, _$_NoteStateData>
    implements _$$_NoteStateDataCopyWith<$Res> {
  __$$_NoteStateDataCopyWithImpl(
      _$_NoteStateData _value, $Res Function(_$_NoteStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? noteItems = null,
  }) {
    return _then(_$_NoteStateData(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      noteItems: null == noteItems
          ? _value._noteItems
          : noteItems // ignore: cast_nullable_to_non_nullable
              as List<NoteItemData>,
    ));
  }
}

/// @nodoc

class _$_NoteStateData implements _NoteStateData {
  _$_NoteStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<NoteItemData> noteItems = const []})
      : _noteItems = noteItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<NoteItemData> _noteItems;
  @override
  @JsonKey()
  List<NoteItemData> get noteItems {
    if (_noteItems is EqualUnmodifiableListView) return _noteItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noteItems);
  }

  @override
  String toString() {
    return 'NoteStateData(isLoading: $isLoading, isReadyData: $isReadyData, noteItems: $noteItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteStateData &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReadyData, isReadyData) ||
                other.isReadyData == isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._noteItems, _noteItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isReadyData,
      const DeepCollectionEquality().hash(_noteItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteStateDataCopyWith<_$_NoteStateData> get copyWith =>
      __$$_NoteStateDataCopyWithImpl<_$_NoteStateData>(this, _$identity);
}

abstract class _NoteStateData implements NoteStateData {
  factory _NoteStateData(
      {final bool isLoading,
      final bool isReadyData,
      final List<NoteItemData> noteItems}) = _$_NoteStateData;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<NoteItemData> get noteItems;
  @override
  @JsonKey(ignore: true)
  _$$_NoteStateDataCopyWith<_$_NoteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TempNoteItemData {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get noteText => throw _privateConstructorUsedError;
  DateTime? get limit => throw _privateConstructorUsedError;
  bool get isNotify => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempNoteItemDataCopyWith<TempNoteItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempNoteItemDataCopyWith<$Res> {
  factory $TempNoteItemDataCopyWith(
          TempNoteItemData value, $Res Function(TempNoteItemData) then) =
      _$TempNoteItemDataCopyWithImpl<$Res, TempNoteItemData>;
  @useResult
  $Res call(
      {int id, String title, String noteText, DateTime? limit, bool isNotify});
}

/// @nodoc
class _$TempNoteItemDataCopyWithImpl<$Res, $Val extends TempNoteItemData>
    implements $TempNoteItemDataCopyWith<$Res> {
  _$TempNoteItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? noteText = null,
    Object? limit = freezed,
    Object? isNotify = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      noteText: null == noteText
          ? _value.noteText
          : noteText // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotify: null == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempNoteItemDataCopyWith<$Res>
    implements $TempNoteItemDataCopyWith<$Res> {
  factory _$$_TempNoteItemDataCopyWith(
          _$_TempNoteItemData value, $Res Function(_$_TempNoteItemData) then) =
      __$$_TempNoteItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String noteText, DateTime? limit, bool isNotify});
}

/// @nodoc
class __$$_TempNoteItemDataCopyWithImpl<$Res>
    extends _$TempNoteItemDataCopyWithImpl<$Res, _$_TempNoteItemData>
    implements _$$_TempNoteItemDataCopyWith<$Res> {
  __$$_TempNoteItemDataCopyWithImpl(
      _$_TempNoteItemData _value, $Res Function(_$_TempNoteItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? noteText = null,
    Object? limit = freezed,
    Object? isNotify = null,
  }) {
    return _then(_$_TempNoteItemData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      noteText: null == noteText
          ? _value.noteText
          : noteText // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotify: null == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TempNoteItemData implements _TempNoteItemData {
  _$_TempNoteItemData(
      {this.id = 0,
      this.title = '',
      this.noteText = '',
      this.limit = null,
      this.isNotify = true});

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String noteText;
  @override
  @JsonKey()
  final DateTime? limit;
  @override
  @JsonKey()
  final bool isNotify;

  @override
  String toString() {
    return 'TempNoteItemData(id: $id, title: $title, noteText: $noteText, limit: $limit, isNotify: $isNotify)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempNoteItemData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.noteText, noteText) ||
                other.noteText == noteText) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.isNotify, isNotify) ||
                other.isNotify == isNotify));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, noteText, limit, isNotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempNoteItemDataCopyWith<_$_TempNoteItemData> get copyWith =>
      __$$_TempNoteItemDataCopyWithImpl<_$_TempNoteItemData>(this, _$identity);
}

abstract class _TempNoteItemData implements TempNoteItemData {
  factory _TempNoteItemData(
      {final int id,
      final String title,
      final String noteText,
      final DateTime? limit,
      final bool isNotify}) = _$_TempNoteItemData;

  @override
  int get id;
  @override
  String get title;
  @override
  String get noteText;
  @override
  DateTime? get limit;
  @override
  bool get isNotify;
  @override
  @JsonKey(ignore: true)
  _$$_TempNoteItemDataCopyWith<_$_TempNoteItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
