// // 保存したデータを削除、更新、引用など利用する場面で、
// // 重複しない一意のIDを生成
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:uuid/uuid.dart';

// const _uuid = Uuid();

// class Note {
//   Note({id, required this.name, this.text = '', createdAt, updatedAt})
//       // initializer list: コンストラクタ本体が実行される前にインスタンス変数を初期化している
//       : id = id ?? _uuid.v4(),
//         createdAt = createdAt ?? DateTime.now().toUtc(),
//         updatedAt = updatedAt ?? DateTime.now().toUtc();

//   final String id;
//   final String name;
//   final String text;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   // コンストラクタ
//   Note copyWith({
//     String? name,
//     String? text,
//   }) =>
//       Note(
//         id: id,
//         name: name ?? this.name,
//         text: text ?? this.text,
//         createdAt: createdAt,
//         updatedAt: DateTime.now().toUtc(),
//       );

//   Note.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         name = json['name'],
//         text = json['text'],
//         createdAt = DateTime.parse(json['createdAt']),
//         updatedAt = DateTime.parse(json['updatedAt']);

//   Map<String, String> toJson() => {
//         'id': id,
//         'name': name,
//         'text': text,
//         'createdAt': createdAt.toIso8601String(),
//         'updatedAt': updatedAt.toIso8601String(),
//       };
// }

// // class PreviewNoteNotifier extends StateNotifier {
// //   PreviewNoteNotifier() : super('');

// //   void previewText(String note) {
// //     state = note;
// //   }
// // }
