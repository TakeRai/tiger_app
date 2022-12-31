import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:engineer_study_app/model/db/note_db.dart';

class TimelineDataNotifier extends StateNotifier<List<NoteItemData>> {
  TimelineDataNotifier() : super([]);

  Future<List<NoteItemData>> read() async {
    final db = MyDatabase();
    List<NoteItemData> datas = await db.readAllNoteData();
    return datas;
  }

  void makeLimitList(DateTime now) async {
    List<NoteItemData> list = [];
    List<NoteItemData> datas = await read();
    for (NoteItemData data in datas) {
      if (data.limitDate == null) {
        continue;
      }
      if (data.limitDate!.difference(now).inDays == 0) {
        list.add(data);
      }
      list.sort((a, b) => a.limitDate!.compareTo(b.limitDate!));
      state = list;
    }
  }
}

final timelineDataProvider =
    StateNotifierProvider((ref) => TimelineDataNotifier());
