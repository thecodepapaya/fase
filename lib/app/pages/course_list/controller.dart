part of 'view.dart';

final _vsProvider = StateNotifierProvider.autoDispose<_VSController, _ViewState>((ref) {
  final controller = _VSController();

  controller._fetchCourses();

  return controller;
});

class _ViewState {
  final ApiStatus apiStatus;
  final List<Course> courses;

  _ViewState({
    required this.apiStatus,
    required this.courses,
  });

  _ViewState.initial()
      : this(
          apiStatus: ApiStatus.init,
          courses: [],
        );

  _ViewState copyWith({
    ApiStatus? apiStatus,
    List<Course>? courses,
  }) {
    return _ViewState(
      apiStatus: apiStatus ?? this.apiStatus,
      courses: courses ?? this.courses,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  final isFaculty = Globals.profile.isFaculty;

  Future<bool> _fetchCourses({bool silent = false}) async {
    if (!silent) state = state.copyWith(apiStatus: ApiStatus.loading);

    final coursesList = await CourseUsecase.instance.getCoursesList();

    if (coursesList == null) {
      state = state.copyWith(apiStatus: ApiStatus.failed);
      return false;
    }

    state = state.copyWith(
      apiStatus: ApiStatus.success,
      courses: coursesList,
    );

    return true;
  }

  Future<void> refresh({bool silent = false}) async {
    await _fetchCourses(silent: silent);
  }

  void onCourseTapped(Course course) {
    if (isFaculty) {
      appRouter.navigate(CreateCourseRoute(courseID: course.id));
    }
  }

  void onMarkAttendance(Course course) async {
    final isSuccess = await AttendanceUsecases.instance.markAttendance(course.id!);

    if (isSuccess) {
      await refresh(silent: true);
      _showSnackbar('Successfully marked attendance for ${course.courseCode}.');
    } else {
      _showSnackbar('Failed to mark attendance for ${course.courseCode}. Please try again.');
    }
  }

  void onStartAttendanceWindow(Course course) async {
    final isSuccess = await CourseUsecase.instance.startAttendanceWindow(course);

    if (isSuccess) {
      await refresh(silent: true);
      _showSnackbar('Opened attendance for ${course.courseCode} for ${course.attendanceDurationInMinutes} minutes.');
    } else {
      _showSnackbar('Failed to start attendance for ${course.courseCode}. Please try again.');
    }
  }

  void _showSnackbar(String message) {
    final snackbar = SnackBar(content: Text(message));
    final context = Globals.context;

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  void onCreateCourse() {
    appRouter.navigate(CreateCourseRoute());
  }
}
