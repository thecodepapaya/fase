import 'package:fase/domain/entities/course.dart';
import 'package:fase/domain/repositories/course_repository.dart';
import 'package:fase/domain/usecases/course_usecases.dart';

class CourseUsecaseImpl implements CourseUsecase {
  @override
  Future<Course?> createCourse(Course course) {
    final createdCourse = CourseRepository.instance.createCourse(course);

    return createdCourse;
  }

  @override
  Future<Course?> editCourse(Course course) async {
    final editedCourse = await CourseRepository.instance.editCourse(course);

    return editedCourse;
  }

  @override
  Future<List<Course>?> getCoursesList() async {
    final coursesList = await CourseRepository.instance.getCoursesList();

    return coursesList;
  }

  @override
  Future<bool> startAttendanceWindow(Course course) async {
    course = course.copyWith(startTimestamp: DateTime.now());

    final editedCourse = await editCourse(course);

    final isSuccess = editedCourse != null ? true : false;

    return isSuccess;
  }

  @override
  Future<Course?> getCourse(int courseID) async {
    final course = await CourseRepository.instance.getCourse(courseID);

    return course;
  }
}
