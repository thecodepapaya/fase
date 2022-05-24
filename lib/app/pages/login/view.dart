import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_widgets/scaffold.dart';
import '../../core_widgets/text_styles.dart';

part 'controller.dart';
part 'widgets/login_button.dart';
part 'widgets/login_prompt.dart';
part 'widgets/logo.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Logo(),
              LoginPrompt(),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
