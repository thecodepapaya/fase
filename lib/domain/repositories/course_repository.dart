import 'package:fase/domain/entities/course.dart';

abstract class CourseRepository {
  Future<Course> getCourse(int courseId);

  Future<List<Course>> getCoursesWithActiveAttendance();

  Future<Course> createCourse();
}
