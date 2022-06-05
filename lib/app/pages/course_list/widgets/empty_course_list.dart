part of '../view.dart';

class EmptyCourseList extends ConsumerWidget {
  const EmptyCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        emptyCourseListText,
        style: FTextStyle.heading3,
        textAlign: TextAlign.center,
      ),
    );
  }

  String get emptyCourseListText {
    final isFaculty = Globals.profile.isFaculty;

    final text = isFaculty
        ? 'You have not created any course yet. Please create a course or ask the admin to create a course and enroll students.'
        : 'It looks lik you are not enrolled in any course. Please contact your respective course instructors.';

    return text;
  }
}
