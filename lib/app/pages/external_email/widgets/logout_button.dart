part of '../view.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    return ElevatedButton(
      onPressed: controller.onLogoutButtonTapped,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Logout',
          style: FTextStyle.heading4,
        ),
      ),
    );
  }
}
