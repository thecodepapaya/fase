part of 'view.dart';

class _VSControllerParams extends Equatable {
  final int? courseID;

  const _VSControllerParams({
    required this.courseID,
  });

  @override
  List<Object?> get props => [courseID];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  throw UnimplementedError();
});

final _vsProvider =
    StateNotifierProvider.family.autoDispose<_VSController, _ViewState, _VSControllerParams>((ref, params) {
  final controller = _VSController(params);

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
  final _VSControllerParams params;
  _VSController(this.params) : super(_ViewState.initial());

  late final TextEditingController courseCodeController;
  late final TextEditingController courseNameController;
  late final TextEditingController sectionController;

  Future<void> initState() async {
    courseCodeController = TextEditingController();
    courseNameController = TextEditingController();
    sectionController = TextEditingController();

    _populateAcademicYears();
    await _fetchCourseDetails();
  }

  Future<bool> _fetchCourseDetails({bool silent = false}) async {
    bool isSuccess = false;

    if (params.courseID == null) {
      return isSuccess;
    }

    if (!silent) {
      state = state.copyWith(apiStatus: ApiStatus.loading);
    }

    final course = await CourseUsecase.instance.getCourse(params.courseID!);

    if (course == null) {
      state = state.copyWith(apiStatus: ApiStatus.failed);
      isSuccess = false;
    } else {
      state = state.copyWith(apiStatus: ApiStatus.success);
      isSuccess = true;

      _populateCourseDataInTextFields(course);
    }

    return isSuccess;
  }

  void _populateCourseDataInTextFields(Course course) {
    courseCodeController.text = course.courseCode;
    courseNameController.text = course.courseName;
    sectionController.text = course.section ?? '';

    state = state.copyWith(
      selectedSemester: course.semester.capitalize,
      selectedAcademicYear: course.academicYear,
      course: course,
    );
  }

  Future<void> refresh({bool silent = false}) async {
    await _fetchCourseDetails(silent: silent);
  }

  void onCourseSaved() async {
    final isEditing = params.courseID != null;
    Course? createdCourse;

    final course = Course(
      id: params.courseID,
      academicYear: state.selectedAcademicYear,
      courseCode: courseCodeController.text,
      courseName: courseNameController.text,
      semester: state.selectedSemester.toLowerCase(),
      section: sectionController.text,
      attendanceDurationInMinutes: state.course?.attendanceDurationInMinutes ?? 5,
    );

    if (isEditing) {
      createdCourse = await CourseUsecase.instance.editCourse(course);
    } else {
      createdCourse = await CourseUsecase.instance.createCourse(course);
    }

    if (createdCourse == null) {
      _showFailureSnackbar();
    } else {
      _showSuccessSnackbar();
      appRouter.navigate(const CourseListRoute());
    }
  }

  void _showFailureSnackbar() {
    final message = params.courseID == null ? 'Failed to create course' : 'Failed to save course details';
    Globals.showSnackbar(message);
  }

  void _showSuccessSnackbar() {
    final message = params.courseID == null ? 'Successfully created course' : 'Successfully saved course details';
    Globals.showSnackbar(message);
  }

  void onCourseNameChanged(String courseName) {}

  void onCourseCodeChanged(String courseCode) {}

  void onSectionChanged(String description) {}

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
