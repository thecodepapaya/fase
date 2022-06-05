part of '../view.dart';

class SemesterDropDown extends ConsumerWidget {
  const SemesterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);

    final selectedSemester = ref.watch(_vsProvider(params).select((state) => state.selectedSemester));
    final controller = ref.watch(_vsProvider(params).notifier);

    return DropdownButton<String>(
      value: selectedSemester,
      items: const <DropdownMenuItem<String>>[
        DropdownMenuItem(
          value: SemesterEnum.autumn,
          child: Text(SemesterEnum.autumn),
        ),
        DropdownMenuItem(
          value: SemesterEnum.winter,
          child: Text(SemesterEnum.winter),
        ),
      ],
      onChanged: controller.onSemesterDropDownChanged,
    );
  }
}
