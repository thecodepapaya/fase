part of '../view.dart';

class DescriptionField extends ConsumerWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);

    final initialDescription = ref.watch(_vsProvider(params).select((state) => state.course?.description));
    final controller = ref.watch(_vsProvider(params).notifier);

    return TextFormField(
      controller: controller.descriptionController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onDescriptionChanged,
      decoration: InputDecoration(
        hintText: 'Eg. Section A',
        labelText: 'Description',
        border: textFieldBorder,
      ),
      // initialValue: initialDescription,
    );
  }
}
