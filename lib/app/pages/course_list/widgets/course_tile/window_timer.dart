part of '../../view.dart';

class WindowTimer extends StatelessWidget {
  final String timerText;

  const WindowTimer({
    Key? key,
    required this.timerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        children: [
          const Icon(Icons.timer_outlined),
          const SizedBox(height: 4),
          Text(timerText),
        ],
      ),
    );
  }
}
