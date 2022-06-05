part of '../../view.dart';

class ActionButton extends ConsumerWidget {
  final Course course;
  final bool isEnabled;

  const ActionButton({
    Key? key,
    this.isEnabled = true,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: isEnabled
            ? () {
                final isFaculty = Globals.profile.isFaculty;

                if (isFaculty) {
                  controller.onStartAttendanceWindow(course);
                } else {
                  controller.onMarkAttendance(course);
                }
              }
            : null,
        child: Text(actionButtonText),
      ),
    );
  }

  String get actionButtonText {
    final isFaculty = Globals.profile.isFaculty;

    final text = isFaculty ? 'Start Attendance' : 'Mark Attendance';

    return text;
  }
}
