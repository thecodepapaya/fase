part of 'view.dart';

final _vsProvider = StateNotifierProvider<_VSController, _ViewState>((ref) {
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
          courses: [
            defaultCourse,
            defaultCourse,
            defaultCourse,
            defaultCourse,
            defaultCourse,
            defaultCourse,
            defaultCourse,
            defaultCourse,
            defaultCourse,
          ],
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

    state = state.copyWith(apiStatus: ApiStatus.success);

    return Future.value(true);
  }

  Future<void> refresh() async {
    await _fetchCourses();
  }

  void onCourseTapped(String courseId) {}

  void onMarkAttendance(String courseId) {}

  void onStartAttendanceWindow(int courseId) {}

  void onEditCourse(String courseId) {}

  void onCreateCourse() {
    appRouter.navigate(CreateCourseRoute());
  }
}
