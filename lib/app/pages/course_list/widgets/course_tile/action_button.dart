part of '../../view.dart';

class ActionButton extends ConsumerWidget {
  final Course course;

  const ActionButton({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          controller.onStartAttendanceWindow(course.id!);
        },
        //TODO Fetch current user isFaculty flag to decide if user should the mark attendance or start attendance
        child: const Text('Start Attendance'),
      ),
    );
  }
}
