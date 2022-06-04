import 'package:fase/domain/entities/course.dart';

import '../../data/repositories/course_repository.dart';

abstract class CourseRepository {
  CourseRepository._();

  static final instance = CourseRepositoryImpl();

  Future<Course> getCourse(int courseId);

  Future<List<Course>> getCoursesWithActiveAttendance();

  Future<Course> createCourse();
}
