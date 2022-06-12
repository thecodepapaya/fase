class Endpoints {
  // Auth
  static const login = '/api/v1/login/';

  // Metadata
  static const getMetadata = '/api/v1/metadata/';
  static const pingServer = '/api/v1/ping/';

  // Registration
  static const verifyRegistration = '/api/v1/registration/verify/';
  static const register = '/api/v1/registration/';

  // Courses
  static const coursesList = '/api/v1/courses/';
  static editCourse(int courseID) => '/api/v1/courses/$courseID/';
  static const createCourse = '/api/v1/courses/';
  static getCourse(int id) => '/api/v1/courses/$id/';

  // Attendance
  static const markAttendance = '/api/v1/attendance/';
  static downloadAttendanceSpreadsheet(int courseId) => '/generate/$courseId/';
}
