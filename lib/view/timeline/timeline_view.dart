import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeLine extends HookConsumerWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> timelineTiles = [];
    return Scaffold(
      body: Center(
        child: ListView(
          children: timelineTiles,
        ),
      ),
    );
  }
}
