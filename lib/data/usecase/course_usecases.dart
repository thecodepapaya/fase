import 'package:fase/domain/entities/course.dart';
import 'package:fase/domain/repositories/course_repository.dart';
import 'package:fase/domain/usecases/course_usecases.dart';

class CourseUsecaseImpl implements CourseUsecase {
  @override
  Future<Course> createCourse() {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Future<Course> editCourse() {
    // TODO: implement editCourse
    throw UnimplementedError();
  }

  @override
  Future<List<Course>?> getCoursesList() async {
    final coursesList = await CourseRepository.instance.getCoursesList();

    return coursesList;
  }
}