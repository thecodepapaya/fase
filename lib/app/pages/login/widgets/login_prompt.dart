part of '../view.dart';

class LoginPrompt extends ConsumerWidget {
  const LoginPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(top: 25, bottom: 35),
      child: Text(
        'Login to IIITV Attendance system',
        style: FTextStyle.heading3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
