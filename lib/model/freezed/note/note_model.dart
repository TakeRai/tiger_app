import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';

@freezed
abstract class NoteStateData with _$NoteStateData {
  //このクラスは、DBの状態を保持するクラスです。
  factory NoteStateData({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default([]) List<NoteItemData> noteItems,
  }) = _NoteStateData;
}

@freezed
abstract class TempNoteItemData with _$TempNoteItemData {
  //このクラスは、入力中のtodoを保持するクラスです。
  factory TempNoteItemData({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String noteText,
    @Default(null) DateTime? limit,
    @Default(true) bool isNotify,
  }) = _TempNoteItemData;
}
