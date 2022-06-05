import 'dart:developer';

import 'package:fase/app/utils/extensions.dart';
import 'package:fase/data/repositories/endpoints/endpoints.dart';
import 'package:fase/domain/entities/course.dart';
import 'package:fase/domain/repositories/course_repository.dart';
import 'package:fase/domain/services/dio/dio_service.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<Course?> createCourse(Course course) async {
    const endPoint = Endpoints.createCourse;
    final payload = course.toMap();

    try {
      final response = await FDioService.instance.client.post(endPoint, data: payload);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      final data = response.data;

      if (isSuccess) {
        final course = Course.fromMap(data);
        return course;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }

  @override
  Future<Course?> editCourse(Course course) async {
    final endPoint = Endpoints.editCourse(course.id!);
    final payload = course.toMap();

    try {
      final response = await FDioService.instance.client.patch(endPoint, data: payload);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      final data = response.data;

      if (isSuccess) {
        final course = Course.fromMap(data);
        return course;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }

  @override
  Future<Course?> getCourse(int courseId) async {
    final endPoint = Endpoints.getCourse(courseId);

    try {
      final response = await FDioService.instance.client.get(endPoint);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      final data = response.data;

      if (isSuccess) {
        final course = Course.fromMap(data);
        return course;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }

  @override
  Future<List<Course>?> getCoursesList() async {
    const endPoint = Endpoints.coursesList;

    try {
      final response = await FDioService.instance.client.get(endPoint);

      final isSuccess = response.statusCode?.isSuccess ?? false;

      final data = response.data;

      if (isSuccess) {
        final coursesList = List<Course>.from(data.map((course) {
          return Course.fromMap(course);
        }));

        return coursesList;
      }
    } catch (error, stackTrace) {
      log(endPoint, error: error, stackTrace: stackTrace, name: 'API Error');
      return null;
    }

    return null;
  }
}
