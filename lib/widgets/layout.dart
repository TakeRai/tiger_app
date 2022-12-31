// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:engineer_study_app/providers.dart';

// class Layout extends HookConsumerWidget {
//   const Layout({Key? key, required Widget this.child}) : super(key: key);

//   final Widget child;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // MediaQuery: 端末の情報を返すことができるwidget
//     // ここで定義されているLargeScreenとは横幅600px以上の画面のこと
//     final isLargeScreen = MediaQuery.of(context).size.width > 600;

//     return ProviderScope(
//       overrides: [
//         // overrideWithValue: プロバイダーの返す値を上書きしている
//         isLargeScreenProvider.overrideWithValue(isLargeScreen),
//       ],
//       child: child,
//     );
//   }
// }
