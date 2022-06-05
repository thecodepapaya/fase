import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:fase/domain/usecases/firebase_auth_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_widgets/logo.dart';
import '../../core_widgets/scaffold.dart';
import '../../core_widgets/text_styles.dart';

part 'controller.dart';
part 'widgets/login_button.dart';
part 'widgets/login_prompt.dart';

class LoginView extends ConsumerWidget {
  const LoginView({
    Key? key,
    required this.onSuccess,
  }) : super(key: key);

  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = _VSControllerParams(onSuccess: onSuccess);

    return FScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            const LoginPrompt(),
            ProviderScope(
              overrides: [_paramsProvider.overrideWithValue(params)],
              child: const LoginButton(),
            ),
          ],
        ),
      ),
    );
  }
}
