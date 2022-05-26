part of '../view.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 2,
      child: InkWell(
        onTap: () {
          controller.onCourseTapped(course.courseCode);
        },
        child: Column(
          children: [
            Row(
              children: [
                _buildCourseName(),
                _buildTimer(),
              ],
            ),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseName() {
    return Consumer(
      builder: (context, ref, child) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${course.courseCode} : ${course.courseName}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FTextStyle.heading4.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  course.instructor.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FTextStyle.heading4.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimer() {
    return Consumer(
      builder: (context, ref, child) {
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
      },
    );
  }

  Widget _buildActionButton() {
    return Consumer(
      builder: (context, ref, child) {
        final controller = ref.watch(_vsProvider.notifier);

        return Container(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              controller.onStartAttendanceWindow(course.id);
            },
            child: const Text('Start Attendance'),
          ),
        );
      },
    );
  }
}
