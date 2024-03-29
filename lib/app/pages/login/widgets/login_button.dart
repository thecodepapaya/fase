part of '../view.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);
    final controller = ref.watch(_vsProvider(params).notifier);

    return ElevatedButton(
      onPressed: controller.onSignInWithGoogle,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Login',
          style: FTextStyle.heading4,
        ),
      ),
    );
  }
}
