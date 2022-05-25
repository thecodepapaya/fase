part of '../view.dart';

class CourseNameField extends ConsumerWidget {
  const CourseNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialCourseName = ref.watch(_vsProvider.select((state) => state.course?.courseName));
    final controller = ref.watch(_vsProvider.notifier);

    return TextFormField(
      controller: controller.courseNameController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onCourseNameChanged,
      decoration: const InputDecoration(
        hintText: 'Course Name',
      ),
      initialValue: initialCourseName,
    );
  }
}
