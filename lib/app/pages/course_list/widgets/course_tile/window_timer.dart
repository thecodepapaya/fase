part of '../../view.dart';

class WindowTimer extends ConsumerWidget {
  const WindowTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_vsProvider);
    final controller = ref.watch(_vsProvider.notifier);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        child: Column(
          children: const [
            Icon(Icons.timer_outlined),
            SizedBox(height: 4),
            Text('5:32'),
          ],
        ),
      ),
    );
  }
}
