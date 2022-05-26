part of 'view.dart';

final _vsProvider = StateNotifierProvider<_VSController, _ViewState>((ref) {
  final controller = _VSController();

  controller.initState();

  return controller;
});

final currentYear = DateTime.now().year;
final currentAcademicYear = '$currentYear-${currentYear + 1}';

class _ViewState {
  final ApiStatus apiStatus;
  final Course? course;
  final String selectedSemester;
  final String selectedAcademicYear;

  final List<String> academicYearsList;

  _ViewState({
    required this.apiStatus,
    required this.course,
    required this.selectedSemester,
    required this.selectedAcademicYear,
    required this.academicYearsList,
  });

  _ViewState.initial()
      : this(
          apiStatus: ApiStatus.init,
          course: null,
          selectedAcademicYear: currentAcademicYear,
          selectedSemester: SemesterEnum.autumn,
          academicYearsList: [currentAcademicYear],
        );

  _ViewState copyWith({
    ApiStatus? apiStatus,
    Course? course,
    String? selectedSemester,
    String? selectedAcademicYear,
    List<String>? academicYearsList,
    String? description,
  }) {
    return _ViewState(
      apiStatus: apiStatus ?? this.apiStatus,
      course: course ?? this.course,
      selectedSemester: selectedSemester ?? this.selectedSemester,
      selectedAcademicYear: selectedAcademicYear ?? this.selectedAcademicYear,
      academicYearsList: academicYearsList ?? this.academicYearsList,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  late final TextEditingController courseCodeController;
  late final TextEditingController courseNameController;
  late final TextEditingController descriptionController;

  Future<void> initState() async {
    courseCodeController = TextEditingController();
    courseNameController = TextEditingController();
    descriptionController = TextEditingController();

    _populateAcademicYears();
    await _fetchCourseDetails();
  }

  Future<bool> _fetchCourseDetails() async {
    state = state.copyWith(apiStatus: ApiStatus.loading);

    state = state.copyWith(apiStatus: ApiStatus.success);

    return Future.value(true);
  }

  Future<void> refresh() async {
    await _fetchCourseDetails();
  }

  void onCourseSaved() {}

  void onCourseNameChanged(String courseName) {}

  void onCourseCodeChanged(String courseCode) {}

  void onDescriptionChanged(String description) {}

  void onSemesterDropDownChanged(String? selectedSemester) {
    state = state.copyWith(selectedSemester: selectedSemester);
  }

  void onYearDropDownChanged(String? selectedAcademicYear) {
    state = state.copyWith(selectedAcademicYear: selectedAcademicYear);
  }

  void _populateAcademicYears() {
    final yearsList = <String>[];

    for (int year = currentYear; year >= 2020; year--) {
      final academicYear = '$year-${year + 1}';

      yearsList.add(academicYear);
    }

    state = state.copyWith(academicYearsList: yearsList);
  }
}
