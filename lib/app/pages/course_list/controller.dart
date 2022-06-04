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

  Future<bool> _fetchCourses() async {
    state = state.copyWith(apiStatus: ApiStatus.loading);

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

  Future<void> refresh() async {
    await _fetchCourses();
  }

  void onCourseTapped(int courseId) {}

  void onMarkAttendance(String courseId) {}

  void onStartAttendanceWindow(int courseId) {}

  void onEditCourse(String courseId) {}

  void onCreateCourse() {
    appRouter.navigate(CreateCourseRoute());
  }
}
