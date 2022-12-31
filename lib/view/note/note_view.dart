import 'package:drift/drift.dart';
import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:engineer_study_app/model/freezed/note/note_model.dart';
import 'package:engineer_study_app/view/note/editor/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:engineer_study_app/view_model/note/note_provider.dart';

class NoteList extends HookConsumerWidget {
  const NoteList({Key? key}) : super(key: key);

  // List<Widget> _buildNoteList(
  //     List<NoteItemData> noteItemList, NoteDatabaseNotifier db) {
  //   //追加
  //   List<Widget> list = [];
  //   for (NoteItemData item in noteItemList) {
  //     Widget tile = Slidable(
  //       child: ListTile(
  //         title: Text(item.title),
  //         subtitle:
  //             Text(item.limitDate == null ? "" : item.limitDate.toString()),
  //       ),
  //       endActionPane: ActionPane(
  //         //スライドしたときに表示されるボタン
  //         motion: DrawerMotion(),
  //         //スライドしたときのアニメーション
  //         children: [
  //           SlidableAction(
  //             flex: 1,
  //             //長さ
  //             onPressed: (_) {
  //               //押された時の処理
  //               db.deleteData(item);
  //             },
  //             icon: Icons.delete,
  //             //アイコン
  //           ),
  //           SlidableAction(
  //             flex: 1,
  //             onPressed: (_) {
  //               NoteItemData data = NoteItemData(
  //                 id: item.id,
  //                 title: item.title,
  //                 noteText: item.noteText,
  //                 limitDate: item.limitDate,
  //                 isNotify: !item.isNotify,
  //               );
  //               db.updateData(data);
  //             },
  //             icon: item.isNotify
  //                 ? Icons.notifications_off
  //                 : Icons.notifications_active,
  //           ),
  //         ],
  //       ),
  //     );
  //     list.add(tile);
  //     //listにtileを追加
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final noteState = ref.watch(noteDatabaseProvider);
    //Providerの状態が変化したさいに再ビルドします
    final noteProvider = ref.watch(noteDatabaseProvider.notifier);
    //Providerのメソッドや値を取得します
    //bottomsheetが閉じた際に再ビルドするために使用します。
    List<NoteItemData> noteItems = noteProvider.state.noteItems;
    //Providerが保持しているtodoItemsを取得します。
    TempNoteItemData temp = TempNoteItemData();
    //追加

    // List<Widget> tiles = _buildNoteList(noteItems, noteProvider);
    //showAlert(context);
    return Scaffold(

      body: ListView(children: [
        for (var i = 0; i < noteItems.length; i++) ...[
          Slidable(
            endActionPane: ActionPane(
              //スライドしたときに表示されるボタン
              motion: const DrawerMotion(),
              //スライドしたときのアニメーション
              children: [
                SlidableAction(
                  flex: 1,
                  //長さ
                  onPressed: (_) {
                    //押された時の処理
                    ref
                        .watch(noteDatabaseProvider.notifier)
                        .deleteData(noteItems[i].id);
                  },
                  icon: Icons.delete,
                  //アイコン
                ),
                // SlidableAction(
                //   flex: 1,
                //   onPressed: (_) {
                //     ref
                //         .watch(noteDatabaseProvider.notifier)
                //         .updateData(noteItems[i]);
                //   },
                //   icon: noteItems[i].isNotify
                //       ? Icons.notifications_off
                //       : Icons.notifications_active,
                // ),
              ],
            ),
            child: ListTile(
              title: Text(noteItems[i].title),
              subtitle: Text(noteItems[i].limitDate == null
                  ? ""
                  : noteItems[i].limitDate.toString()),
              onTap: () {
                ref.read(currentNoteIndexProvider.notifier).state = i;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Editor()));
              },
            ),
          ),
        ]
      ]),
      //ListViewでtilesを表示します。
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          temp = temp.copyWith(title: 'Untitled', noteText: 'Memo');
          noteProvider.writeData(temp);
        },
        // onPressed: () async {
        //   await showModalBottomSheet<void>(
        //     context: context,
        //     useRootNavigator: true,
        //     isScrollControlled: true,
        //     builder: (context2) {
        //       return HookConsumer(
        //         builder: (context3, ref, _) {
        //           final limit = useState<DateTime?>(null);
        //           //DatePickerが閉じた際に再ビルドするために使用します。
        //           return Padding(
        //             padding: MediaQuery.of(context3).viewInsets,
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: <Widget>[
        //                 TextField(
        //                   decoration: InputDecoration(
        //                     labelText: '新規メモ',
        //                   ),
        //                   onChanged: (value) {
        //                     //追加
        //                     temp = temp.copyWith(title: value);
        //                   },
        //                   onSubmitted: (value) {
        //                     //追加
        //                     temp = temp.copyWith(title: value);
        //                   },
        //                 ),
        //                 TextField(
        //                   decoration: InputDecoration(
        //                     labelText: 'メモ',
        //                   ),
        //                   onChanged: (value) {
        //                     //追加
        //                     temp = temp.copyWith(noteText: value);
        //                   },
        //                   // 入力完了後の処理
        //                   onSubmitted: (value) {
        //                     //追加
        //                     temp = temp.copyWith(noteText: value);
        //                   },
        //                 ),
        //                 Table(
        //                   defaultVerticalAlignment:
        //                       TableCellVerticalAlignment.values[0],
        //                   children: [
        //                     TableRow(
        //                       children: [
        //                         ElevatedButton(
        //                           onPressed: () {
        //                             DatePicker.showDateTimePicker(
        //                               context,
        //                               showTitleActions: true,
        //                               minTime: DateTime.now(),
        //                               onConfirm: (date) {
        //                                 limit.value = date;
        //                                 temp = temp.copyWith(limit: date);
        //                                 //追加
        //                               },
        //                               currentTime: DateTime.now(),
        //                               locale: LocaleType.jp,
        //                             );
        //                           },
        //                           child: Row(
        //                             children: [
        //                               Icon(Icons.calendar_today),
        //                               Text(limit.value == null
        //                                   ? ""
        //                                   : limit.value
        //                                       .toString()
        //                                       .substring(0, 10)),
        //                             ],
        //                           ),
        //                         ),
        //                         Container(
        //                           width: 10,
        //                         ),
        //                         ElevatedButton(
        //                           onPressed: () {
        //                             noteProvider.writeData(temp);
        //                             //追加
        //                             Navigator.pop(context3);
        //                           },
        //                           child: Text('OK'),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   );
        //   temp = TempNoteItemData();
        //   //追加
        //   //floatingActionButtonの処理はここで終わりです
        // },
      ),
    );
  }
}
