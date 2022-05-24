part of '../view.dart';

class Logo extends ConsumerWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.asset('assets/iiitv.png');
  }
}
