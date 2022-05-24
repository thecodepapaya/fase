import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('StringResources.signIn'),
              onPressed: () {
                // Globals.isFaculty = false;
                // signInWithGoogle();
              },
            ),
            //TODO this button must be removed
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('StringResources.signIn' + ' as faculty'),
              onPressed: () {
                // Globals.isFaculty = true;
                // signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
