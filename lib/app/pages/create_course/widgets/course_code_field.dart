part of '../view.dart';

class CourseCodeField extends ConsumerWidget {
  const CourseCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialCourseCode = ref.watch(_vsProvider.select((state) => state.course?.courseCode));
    final controller = ref.watch(_vsProvider.notifier);

    return TextFormField(
      controller: controller.courseCodeController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onCourseCodeChanged,
      decoration: const InputDecoration(
        labelText: 'Course Code',
        hintText: 'Eg. CS101',
      ),
      initialValue: initialCourseCode,
    );
  }
}
