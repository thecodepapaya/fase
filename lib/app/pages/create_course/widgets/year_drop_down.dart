part of '../view.dart';

class YearDropDown extends ConsumerWidget {
  const YearDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAcademicYear = ref.watch(_vsProvider.select((state) => state.selectedAcademicYear));
    final academicYearsList = ref.watch(_vsProvider.select((state) => state.academicYearsList));
    final controller = ref.watch(_vsProvider.notifier);

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
