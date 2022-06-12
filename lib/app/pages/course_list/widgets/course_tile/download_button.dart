part of '../../view.dart';

class DownloadButton extends ConsumerWidget {
  final Course course;

  const DownloadButton({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);
    final showDownloadButton = Globals.profile.isFaculty;

    return showDownloadButton
        ? IconButton(
            tooltip: 'Download attendance for ${course.courseCode} as spreadsheet',
            icon: const Icon(Icons.file_download),
            onPressed: () {
              controller.onDownloadAttendance(course);
            },
          )
        : const SizedBox();
  }
}
