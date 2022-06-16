part of '../../view.dart';

class CourseInfoRow extends ConsumerWidget {
  final Course course;

  const CourseInfoRow({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoRowTextStyle = FTextStyle.small.copyWith(color: Colors.grey);

    final showSection = course.section != null;

    final courseSectionString = ' - ${course.section ?? ''}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            '${course.semester.capitalize} (${course.academicYear})',
            style: infoRowTextStyle,
          ),
          Expanded(
            child: showSection
                ? Text(
                    courseSectionString,
                    style: infoRowTextStyle,
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
