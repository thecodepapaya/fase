import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  final double? size;

  const Logo({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/iiitv.png',
      height: size,
      width: size,
    );
  }
}
