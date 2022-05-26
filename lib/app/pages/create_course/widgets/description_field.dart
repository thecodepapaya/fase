part of '../view.dart';

class DescriptionField extends ConsumerWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialDescription = ref.watch(_vsProvider.select((state) => state.course?.description));
    final controller = ref.watch(_vsProvider.notifier);

    return TextFormField(
      controller: controller.descriptionController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onDescriptionChanged,
      decoration: const InputDecoration(
        hintText: 'Eg. Section A',
        labelText: 'Description',
      ),
      initialValue: initialDescription,
    );
  }
}
