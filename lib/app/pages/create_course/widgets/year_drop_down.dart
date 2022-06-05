part of '../view.dart';

class YearDropDown extends ConsumerWidget {
  const YearDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(_paramsProvider);

    final selectedAcademicYear = ref.watch(_vsProvider(params).select((state) => state.selectedAcademicYear));
    final academicYearsList = ref.watch(_vsProvider(params).select((state) => state.academicYearsList));
    final controller = ref.watch(_vsProvider(params).notifier);

    return DropdownButton<String>(
      value: selectedAcademicYear,
      items: academicYearsList.map(_mapYearsToDropDownMenuItems).toList(),
      onChanged: controller.onYearDropDownChanged,
    );
  }

  DropdownMenuItem<String> _mapYearsToDropDownMenuItems(String academicYear) {
    return DropdownMenuItem(
      value: academicYear,
      child: Text(academicYear),
    );
  }
}
