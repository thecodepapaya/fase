import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: FaseApp(),
    ),
  );
}
