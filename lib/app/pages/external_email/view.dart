import 'package:fase/app/app.dart';
import 'package:fase/app/utils/router/app_router.dart';
import 'package:fase/domain/usecases/auth_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_widgets/logo.dart';
import '../../core_widgets/scaffold.dart';
import '../../core_widgets/text_styles.dart';

part 'controller.dart';
part 'widgets/logout_button.dart';
part 'widgets/logout_prompt.dart';

class ExternalEmailView extends ConsumerWidget {
  const ExternalEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Logo(),
            LogoutPrompt(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
