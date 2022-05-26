part of '../../view.dart';

class CourseDetails extends ConsumerWidget {
  final Course course;
  const CourseDetails({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              style: FTextStyle.heading5.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
