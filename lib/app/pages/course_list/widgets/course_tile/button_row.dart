part of '../../view.dart';

class ButtonRow extends ConsumerWidget {
  final Course course;
  final bool isEnabled;

  const ButtonRow({
    Key? key,
    required this.course,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDownloadButton = Globals.profile.isFaculty;
    final showAttendanceMarker = !Globals.profile.isFaculty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showDownloadButton) DownloadButton(course: course),
        if (showAttendanceMarker) AttendancePercentage(course: course),
        ActionButton(course: course, isEnabled: isEnabled),
      ],
    );
  }
}
