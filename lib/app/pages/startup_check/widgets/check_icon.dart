part of '../view.dart';

class CheckIcon extends ConsumerWidget {
  final bool? isValid;

  const CheckIcon({
    Key? key,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final Widget icon;

    if (isValid == true) {
      icon = const Icon(Icons.check_circle_outline_rounded, color: Colors.green);
    } else if (isValid == false) {
      icon = const Icon(Icons.error_outline_rounded, color: Colors.red);
    } else {
      icon = const CircularLoader();
    }

    return icon;
  }
}
