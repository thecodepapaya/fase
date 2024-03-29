part of '../view.dart';

class CourseCodeField extends ConsumerWidget {
  const CourseCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);

    final controller = ref.watch(_vsProvider(params).notifier);

    return TextFormField(
      controller: controller.courseCodeController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onCourseCodeChanged,
      maxLength: 20,
      decoration: InputDecoration(
        labelText: 'Course Code',
        hintText: 'Eg. CS101',
        border: textFieldBorder,
      ),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      // initialValue: initialCourseCode,
    );
  }
}
