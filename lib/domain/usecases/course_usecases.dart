import 'package:fase/data/usecase/course_usecases.dart';
import 'package:fase/domain/entities/course.dart';

abstract class CourseUsecase {
  CourseUsecase._();

  static final instance = CourseUsecaseImpl();

  Future<List<Course>?> getCoursesList();

  Future<Course?> getCourse(int courseID);

  Future<Course?> createCourse(Course course);

  Future<Course?> editCourse(Course course);

  Future<bool> startAttendanceWindow(Course course);
}
