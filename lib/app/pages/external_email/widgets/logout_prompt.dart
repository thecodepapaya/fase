part of '../view.dart';

class LogoutPrompt extends ConsumerWidget {
  const LogoutPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(top: 25, bottom: 35),
      child: Text(
        'This application is internal to IIIT Vadodara. Please login via your IIITV email.',
        style: FTextStyle.heading3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
