// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'widgets/home.dart';
// import 'widgets/editor.dart';
// import 'widgets/layout.dart';
// import 'providers.dart';

// void main() {
//   runApp(
//     // アプリ全てをプロバイダー適用内に指定している
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   // ・コンストラクタで、keyという名称でKeyクラスを受け取ることを可能としている。
//   // ・MyHomePageのコンストラクタでオブジェクトを生成する際、
//   // 　superclassここではStatefulWidgetだが、
//   // 　このコンストラクタにMyHomePageのコンストラクタで受け取ったkeyを渡し初期化している。
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       // primarySwatch: 自分で定義したMaterialColorを使うこともできる
//       theme: ThemeData(primarySwatch: Colors.blueGrey),
//       // darkTheme: ダークモード用のテーマを設定
//       darkTheme: ThemeData.dark(),
//       // initialRoute: それぞれ指定したWidgetに遷移ができる
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const Layout(child: Home()),
//         '/edit': (context) => const Layout(child: Editor()),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:engineer_study_app/view/root.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      // primarySwatch: 自分で定義したMaterialColorを使うこともできる
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // darkTheme: ダークモード用のテーマを設定
      darkTheme: ThemeData.dark(),
      home: Root(),
    );
  }
}
