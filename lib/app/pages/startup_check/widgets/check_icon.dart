part of '../view.dart';

class CheckIcon extends ConsumerWidget {
  final CheckState state;

  const CheckIcon({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final Widget icon;

    if (state == CheckState.valid) {
      icon = const Icon(Icons.check_circle_outline_rounded, color: Colors.green);
    } else if (state == CheckState.invalid) {
      icon = const Icon(Icons.error_outline_rounded, color: Colors.red);
    } else {
      icon = const CircularLoader();
    }

    return icon;
  }
}
