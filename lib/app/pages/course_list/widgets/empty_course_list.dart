part of '../view.dart';

class EmptyCourseList extends ConsumerWidget {
  const EmptyCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'It looks lik you are not enrolled in any course. Please contact your respective course instructors.',
        style: FTextStyle.heading3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
