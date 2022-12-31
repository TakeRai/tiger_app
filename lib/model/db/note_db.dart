// For more information on using drift, please see https://drift.simonbinder.eu/docs/getting-started/

import 'package:drift/native.dart';
import 'package:engineer_study_app/model/freezed/note/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'note_db.g.dart';

class NoteItem extends Table {
  IntColumn get id => integer().autoIncrement()(); //primary key
  TextColumn get title =>
      text().withDefault(const Constant('')).withLength(min: 1)();
  TextColumn get noteText => text().withDefault(const Constant(''))();
  //nullable()でnullを許容する
  DateTimeColumn get limitDate => dateTime().nullable()();
  //DateTimeではなく,dateTimeであることに注意
  BoolColumn get isNotify => boolean().withDefault(const Constant(true))();
  //通知するかどうかを真理値で表す
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  // これは、ファイルのロケーションを探すのに使えるLazyDatabase utilを許可します。
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    // ここに、db.sqliteというファイルを、あなたのアプリのドキュメントフォルダに置きます。
    final dbFolder = await getApplicationDocumentsDirectory();
    //Path to a directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application.
    //データを配置することができるディレクトリのパス。
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [NoteItem])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //全てのデータ取得
  Future<List<NoteItemData>> readAllNoteData() => select(noteItem).get();
  //SELECT * FROM ToDoItemTable

  //追加
  Future writeNote(NoteItemCompanion data) => into(noteItem).insert(data);
  //INSERT INTO ToDoItemTable VALUES(id, 'title', 'description', 'limitDate')

  //更新
  Future<int> updateNote(TempNoteItemData temp, int id) {
    return (update(noteItem)..where((tbl) => tbl.id.equals(id))).write(
      NoteItemCompanion(
        id: Value(id),
        title: Value(temp.title),
        noteText: Value(temp.noteText),
        isNotify: Value(temp.isNotify)
      ),
    );
  }
  //UPDATE ToDoItemTable SET title = 'title', description = 'description', limitDate = 'limitDate'

  //削除
  Future deleteNote(int id){
    print("delete");
    return (delete(noteItem)..where((it) => it.id.equals(id))).go();
  }
  //DELETE FROM ToDoItemTable WHERE id = id
}
