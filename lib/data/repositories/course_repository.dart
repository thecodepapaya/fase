import 'package:fase/domain/entities/course.dart';
import 'package:fase/domain/entities/user.dart';
import 'package:fase/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<Course> createCourse() {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Future<Course> getCourse(int courseId) {
    // TODO: implement getCourse
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getCoursesWithActiveAttendance() {
    // TODO: implement getCoursesWithActiveAttendance
    throw UnimplementedError();
  }
}
