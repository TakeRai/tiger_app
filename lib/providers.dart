// import 'dart:io';
// import 'dart:convert';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:path_provider/path_provider.dart';

// import 'note_list.dart';
// import 'note.dart';

// // refを受け取ってNoteList()を管理、変更するプロバイダー
// final noteListProvider =
//     StateNotifierProvider<NoteList, List<Note>>((ref) => NoteList());

// // // リアルタイムでプレビュータブに編集タブの変更を反映するプロバイダー
// // final previewProvider = StateNotifierProvider((ref) => PreviewNoteNotifier());

// // refを受け取って非同期処理を実行するプロバイダー
// final initialProvider = FutureProvider<bool>((ref) async {
//   // noteのファイル保管ディレクトリをアプリ内に作成
//   final directory =
//       Directory('${(await getApplicationDocumentsDirectory()).path}/notes');
//   await directory.create();

//   // json形式のNoteを↑で作成したディレクトリにリストとして格納
//   final List<Note> notes = [];
//   await for (final item in directory.list()) {
//     if (!item.path.endsWith('.json')) {
//       continue;
//     }

//     final jsonString = await File(item.path).readAsString();
//     // jsonコードにパースする
//     Map<String, dynamic> noteMap = jsonDecode(jsonString);
//     final note = Note.fromJson(noteMap);

//     // リストに新しいノート（json形式）を追加
//     notes.add(note);
//   }

//   // 作成日によってnoteの並び順を変えるメソッド
//   notes.sort((a, b) => a.createdAt.compareTo(b.createdAt));

//   // 値に変化があったらnotesに反映する
//   ref.read(noteListProvider.notifier).set(notes);

//   // // iOSにおいて、トラッキング許可を求めるダイアログを表示する
//   // await AppTrackingTransparency.requestTrackingAuthorization();

//   return true;
// });

// final StateProvider<String> currentNoteIdProvider =
//     StateProvider<String>((ref) => '');
// // 大きい画面に対する実装をまだ提供していないことに対する例外を通知
// final isLargeScreenProvider =
//     Provider<bool>((ref) => throw UnimplementedError());
