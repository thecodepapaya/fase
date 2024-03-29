part of '../view.dart';

class CourseNameField extends ConsumerWidget {
  const CourseNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);

    final controller = ref.watch(_vsProvider(params).notifier);

    return TextFormField(
      controller: controller.courseNameController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onCourseNameChanged,
      maxLength: 80,
      decoration: InputDecoration(
        labelText: 'Course Name',
        hintText: 'Eg. Introduction to Quantum Computing',
        border: textFieldBorder,
      ),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      // initialValue: initialCourseName,
    );
  }
}
