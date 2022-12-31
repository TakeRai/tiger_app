// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:engineer_study_app/providers.dart';
// import 'package:engineer_study_app/view/note/editor/editor.dart';

// import 'notes.dart';
// import '../view/note/editor/editor.dart';

// class Home extends HookConsumerWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isLargeScreen = ref.watch(isLargeScreenProvider);

//     return isLargeScreen
//         ? Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Notes(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Editor(),
//               ),
//             ],
//           )
//         : Notes();
//   }
// }
