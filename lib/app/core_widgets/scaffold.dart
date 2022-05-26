import 'package:flutter/material.dart';

class FScaffold extends StatelessWidget {
  final String? title;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? appBarActionButton;

  const FScaffold({
    Key? key,
    this.title,
    this.body,
    this.drawer,
    this.floatingActionButton,
    this.appBarActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showAppBar = appBarActionButton != null || title != null;

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title ?? ''),
              actions: [appBarActionButton ?? Container()],
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: body,
      ),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
