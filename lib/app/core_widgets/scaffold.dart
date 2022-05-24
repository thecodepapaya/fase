import 'package:flutter/material.dart';

class FScaffold extends StatelessWidget {
  final String? title;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;

  const FScaffold({
    Key? key,
    this.title,
    this.body,
    this.drawer,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: body,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
