// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import '../providers.dart';

// class Notes extends HookConsumerWidget {
//   const Notes({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final noteList = ref.watch(noteListProvider);
//     final scrollController = useScrollController();
//     final initial = ref.watch(initialProvider);
//     final isLargeScreen = ref.watch(isLargeScreenProvider);

//     // // 広告表示widget
//     // final BannerAd banner = BannerAd(
//     //   adUnitId: 'ca-app-pub-3940256099942544/2934735716',
//     //   size: AdSize.banner,
//     //   request: const AdRequest(),
//     //   listener: const BannerAdListener(),
//     // );
//     // banner.load();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         // leading: Appbarの左側にボタンを配置
//         leading: IconButton(
//           icon: Icon(Icons.info_outlined),
//           onPressed: () {
//             // アプリの情報を表示するwidget
//             showAboutDialog(
//               context: context,
//               applicationName: 'Text Editter',
//             );
//           },
//         ),
//       ),
//       body: initial.when(
//         // パラメータを使わないことを明示している
//         data: (_) => Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 controller: scrollController,
//                 // Spread記法でリストのすべての要素をchildrenにぶっ込んでいる
//                 children: [
//                   for (var i = 0; i < noteList.length; i++) ...[
//                     // リストをスライドして削除することができるメソッド
//                     Dismissible(
//                       // どの項目を削除するか
//                       key: ValueKey(noteList[i].id),
//                       // 実行した時の処理内容
//                       onDismissed: (_) {
//                         ref.read(currentNoteIdProvider.state).state = '';
//                         ref
//                             .read(noteListProvider.notifier)
//                             .delete(noteList[i].id);
//                       },
//                       child: ListTile(
//                         title: Text(noteList[i].name),
//                         onTap: () {
//                           ref.read(currentNoteIdProvider.state).state =
//                               noteList[i].id;

//                           // 大画面ではない場合、編集画面に遷移する実装
//                           if (!isLargeScreen) {
//                             Navigator.pushNamed(context, '/edit');
//                           }
//                         },
//                       ),
//                     ),
//                     // 区切り線をつけるクラス
//                     const Divider(height: 0),
//                   ],
//                 ],
//               ),
//             ),
//             // // 広告の表示部分
//             // Container(
//             //   alignment: Alignment.center,
//             //   child: AdWidget(ad: banner),
//             //   width: banner.size.width.toDouble(),
//             //   height: banner.size.height.toDouble(),
//             // ),
//           ],
//         ),
//         loading: () => const Center(
//           child: CircularProgressIndicator(),
//         ),
//         error: (err, stack) {},
//       ),
//       floatingActionButton: initial.when(
//         data: (_) => Container(
//           // margin: EdgeInsets.only(bottom: banner.size.height.toDouble()),
//           child: FloatingActionButton(
//             onPressed: () {
//               // 新規作成処理の呼び出し
//               ref.read(noteListProvider.notifier).add('Untitled');

//               // スクロールバーの制御をWidgetsBindingで行っている
//               WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//                 scrollController
//                     .jumpTo(scrollController.position.maxScrollExtent);
//               });
//             },
//             child: const Icon(Icons.add),
//           ),
//         ),
//         loading: () => null,
//         error: (err, stack) => null,
//       ),
//     );
//   }
// }
