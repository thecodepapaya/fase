class Endpoints {
  // Auth
  static const login = '/login/';

  // Metadata
  static const getMetadata = '/metadata/';
  static const pingServer = '/ping/';

  // Registration
  static const verifyRegistration = '/registration/verify/';
  static const register = '/registration/';

  // Courses
  static const coursesList = '/courses/';
  static editCourse(int courseID) => '/courses/$courseID/';

  // Attendance
  static const markAttendance = '/attendance/';
}
