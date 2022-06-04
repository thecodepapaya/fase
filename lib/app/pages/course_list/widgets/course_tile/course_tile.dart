part of '../../view.dart';

class CourseTile extends ConsumerWidget {
  final Course course;

  const CourseTile({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    final now = DateTime.now();
    final attendanceDuration = Duration(minutes: course.attendanceDurationInMinutes);
    final attendanceEndTime = course.startTimestamp?.add(attendanceDuration);
    final hasEnded = attendanceEndTime?.isAfter(now) ?? false;

    final isEnabled = !course.isAlreadyMarked || !hasEnded;

    return Opacity(
      opacity: isEnabled ? 1 : 0.4,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: isEnabled
              ? () {
                  controller.onCourseTapped(course.id!);
                }
              : null,
          child: Column(
            children: [
              Row(
                children: [
                  CourseDetails(course: course),
                  WindowTimer(course: course),
                ],
              ),
              ActionButton(course: course),
            ],
          ),
        ),
      ),
    );
  }
}
