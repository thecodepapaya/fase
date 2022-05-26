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

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          controller.onCourseTapped(course.courseCode);
        },
        child: Column(
          children: [
            Row(
              children: [
                CourseDetails(course: course),
                const WindowTimer(),
              ],
            ),
            ActionButton(course: course),
          ],
        ),
      ),
    );
  }
}
