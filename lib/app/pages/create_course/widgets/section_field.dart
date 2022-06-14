part of '../view.dart';

class SectionField extends ConsumerWidget {
  const SectionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);

    final controller = ref.watch(_vsProvider(params).notifier);

    return TextFormField(
      controller: controller.sectionController,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: controller.onSectionChanged,
      maxLength: 25,
      decoration: InputDecoration(
        hintText: 'Eg. Section A/Lab Group B',
        labelText: 'Section (Optional)',
        border: textFieldBorder,
      ),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      // initialValue: initialDescription,
    );
  }
}
