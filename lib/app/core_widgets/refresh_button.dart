import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefreshButton extends ConsumerWidget {
  final VoidCallback onRefresh;

  const RefreshButton({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onRefresh,
      icon: const Icon(Icons.refresh_rounded),
    );
  }
}
