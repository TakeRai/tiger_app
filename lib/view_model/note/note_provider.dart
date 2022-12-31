import 'package:engineer_study_app/model/freezed/note/note_model.dart';
import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart';

class NoteDatabaseNotifier extends StateNotifier<NoteStateData> {
  //データベースの状態が変わるたびTodoのviewをビルドするようにするクラスです。
  NoteDatabaseNotifier() : super(NoteStateData());
  //ここからはデータベースに関する処理をこのクラスで行えるように記述します。
  final _db = MyDatabase();
  //書き込み処理部分
  writeData(TempNoteItemData data) async {
    if (data.title.isEmpty) {
      return;
    }
    NoteItemCompanion entry = NoteItemCompanion(
      title: Value(data.title),
      noteText: Value(data.noteText),
      limitDate: Value(data.limit),
      isNotify: Value(data.isNotify),
    );
    state = state.copyWith(isLoading: true);
    await _db.writeNote(entry);
    readData();
    //書き込むたびにデータベースを読み込む
  }

  //削除処理部分
  deleteData(
    // NoteItemData data
    int id
    ) async {
    state = state.copyWith(isLoading: true);
    await _db.deleteNote(id);
    readData();
    //削除するたびにデータベースを読み込む
  }

  //更新処理部分
  updateData(TempNoteItemData temp,int id) async {
    print("tess");
    if (temp.title.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    print("before");
    await _db.updateNote(temp,id);
    // await _db.deleteNote(temp.id);

    readData();
    //更新するたびにデータベースを読み込む
  }

  //データ読み込み処理
  readData() async {
    state = state.copyWith(isLoading: true);

    final noteItems = await _db.readAllNoteData();

    state = state.copyWith(
        isLoading: false, isReadyData: true, noteItems: noteItems);
    //stateを更新します
    //freezedを使っているので、copyWithを使うことができます
    //これは、stateの中身をすべて更新する必要がありません。例えば
    //state.copyWith(isLoading: true)のように一つの値だけを更新することもできます。
    //複数の値を監視したい際、これはとても便利です。
  }
}

final noteDatabaseProvider = StateNotifierProvider((_) {
  NoteDatabaseNotifier notify = NoteDatabaseNotifier();
  notify.readData();
  //初期化処理
  return notify;
});

final StateProvider<int> currentNoteIndexProvider =
    StateProvider<int>((ref) => 0);
