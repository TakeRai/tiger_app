import 'dart:developer';

import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:engineer_study_app/note.dart';
import 'package:engineer_study_app/note_list.dart';
import 'package:engineer_study_app/view/note/note_view.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:engineer_study_app/view_model/note/note_provider.dart';
import 'package:engineer_study_app/model/freezed/note/note_model.dart';

class Editor extends HookConsumerWidget {
  const Editor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 各プロバイダーの状態を監視している
    final noteIndex = ref.read(currentNoteIndexProvider.notifier).state;
    // final isLargeScreen = ref.watch(isLargeScreenProvider);
    final noteProvider = ref.watch(noteDatabaseProvider.notifier);
    List<NoteItemData> noteItems = noteProvider.state.noteItems;
    // 画面表示のノート数は４つなのに8番目の要素にアクセスしようとしている
    final currentNoteItem = noteItems[noteIndex];

    TempNoteItemData temp = TempNoteItemData();

    // 新規作成の場合の処理
    final titleController = useTextEditingController();
    titleController.text = currentNoteItem.title ;

    final textController = useTextEditingController();
    textController.text = currentNoteItem.noteText ;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)
                      ),
                  onPressed: () async {
                    await noteProvider.updateData(temp,currentNoteItem.id);
                    
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.view_list)),
              actions: [
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    )
                  ],
                  onSelected: (_) {
                    ref
                        .watch(noteDatabaseProvider.notifier)
                        .deleteData(currentNoteItem.id);
                  },
                ),
              ],
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text('preview'),
                ),
                Tab(
                  child: Text('editing'),
                )
              ]),
            ),
            // widgetの大きさが端末画面以上になる場合にスクロールできるようにするwidget
            body: TabBarView(children: [
              // previewタブの実装
              Container(
                  margin: const EdgeInsets.all(20),
                  child: Markdown(data: currentNoteItem.noteText)),
              // editingタブの実装
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 16, right: 16, top: 24, bottom: 4),
                          hintText: 'Note name',
                        ),
                        controller: titleController,
                        onChanged: (value) {
                          //追加
                          temp = temp.copyWith(title: value);
                        },
                        onSubmitted: (value) {
                          //追加
                          temp = temp.copyWith(title: value);
                        },
                        enabled: currentNoteItem != null,
                      ),
                    ),
                    // メモ本文入力フィールドの実装
                    SizedBox(
                      child: TextField(
                        maxLines: null,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 16, right: 16, top: 4, bottom: 16),
                          hintText: 'Note content',
                        ),
                        controller: textController,
                        onChanged: (value) {
                          //追加
                          temp = temp.copyWith(noteText: value);
                        },
                        // 入力完了後の処理
                        onSubmitted: (value) {
                          //追加
                          temp = temp.copyWith(noteText: value);
                        },
                        // onChanged: (nextText) {
                        //   // ref
                        //   //     .watch(previewProvider.notifier)
                        //   //     .previewText(nextText);
                        //   ref
                        //       .read(noteListProvider.notifier)
                        //       .update(id: noteId, text: nextText);
                        // },
                        enabled: currentNoteItem != null,
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
