part of '../../view.dart';

class AttendancePercentage extends ConsumerWidget {
  final Course course;

  const AttendancePercentage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: course.color,
        ),
      ),
    );
  }
}
