// // dart:io: ファイルの読み書き機能を提供
// // ignore_for_file: depend_on_referenced_packages

// import 'dart:io';
// // dart:convert: jsonファイルのコンバーター
// import 'dart:convert';
// import 'dart:async';

// import 'package:riverpod/riverpod.dart';
// // path_provider: 端末のファイルへアクセスできるパッケージ。状態を保存したいときなどに
// import 'package:path_provider/path_provider.dart';

// import 'note.dart';

// // StateNotifier: 単一の状態変数を保持し、その変数の変更を自動で通知する
// // <List<Note>>: 管理している状態クラスの型
// class NoteList extends StateNotifier<List<Note>> {
//   // ??: もしnullだったなら
//   NoteList([List<Note>? notes]) : super(notes ?? []);

//   // _debounce: 管理している状態変数。Timer型、プライベート変数。意味は「一定時間に１つの信号しか登録できないようにするやつ」
//   Timer? _debounce;

//   @override
//   // dispose(): データ廃棄のメソッド
//   void dispose() {
//     _debounce?.cancel();

//     super.dispose();
//   }

//   void set(List<Note> notes) {
//     state = [...notes];
//   }

//   void add(String name) {
//     state = [
//       ...state,
//       Note(
//         name: name,
//       ),
//     ];
//   }

//   void update({required String id, String? name, String? text}) {
//     if (_debounce?.isActive ?? false) {
//       _debounce?.cancel();
//     }
//     // Timer: １回または繰り返し起動するようにできているカウントダウンタイマー
//     //  Duration: 第一引数：繰り返す間隔の時間を設定。ここでは500msを指定
//     _debounce = Timer(const Duration(milliseconds: 500), () async {
//       // 第２引数として動作させたい処理を書く
//       // final: 再代入できなくする。
//       // firstWhere: 配列を最初から検索して、一番最初に見つかった値を返す関数。第一引数にboolを返す関数。trueでその値を返す
//       final prevNote = state.firstWhere((note) => note.id == id); // returnを省略
//       // 一番最初のノートのコピー作成
//       final nextNote = prevNote.copyWith(
//         name: name,
//         text: text,
//       );

//       // StateNotifierの状態管理変数（noteのリスト）
//       state = state.map((note) {
//         if (note.id == id) {
//           return nextNote;
//         } else {
//           return note;
//         }
//       }).toList();

//       (await _file(id)).writeAsString(jsonEncode(nextNote));
//     });
//   }

//   //
//   void delete(String id) async {
//     state = state.where((note) => note.id != id).toList();

//     final file = await _file(id);
//     // file.exists: デバイスに保存したファイルが存在するかの確認
//     if (await file.exists()) {
//       // 再帰関数で削除リストに登録されたメモを削除する
//       (await _file(id)).delete();
//     }
//   }

//   // 引数idのファイルのpathを返すメソッド
//   Future<File> _file(id) async {
//     return File(
//         '${(await getApplicationDocumentsDirectory()).path}/notes/$id.json');
//   }
// }
