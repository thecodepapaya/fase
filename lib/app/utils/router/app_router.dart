// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:fase/app/pages/external_email/view.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/course.dart';
import '../../pages/attendance_record/view.dart';
import '../../pages/course_list/view.dart';
import '../../pages/create_course/view.dart';
import '../../pages/login/view.dart';
import '../../pages/splash/view.dart';
import '../../pages/startup_check/view.dart';
import '../guards/auth_guard.dart';
import '../guards/email_guards.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <CustomRoute>[
    CustomRoute(
      page: SplashScreenView,
      initial: true,
      path: '/splash',
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: LoginView,
      path: '/login',
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn
    ),
    CustomRoute(
      page: StartUpCheckView,
      path: '/startupCheck',
      guards: [
        AuthGuard,
        EmailGuard,
      ],
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: CourseListView,
      path: '/courseList',
      guards: [
        AuthGuard,
        EmailGuard,
      ],
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: CreateCourseView,
      path: '/createCourse',
      guards: [
        AuthGuard,
        EmailGuard,
      ],
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: AttendanceRecordView,
      path: '/attendanceRecord',
      guards: [
        AuthGuard,
        EmailGuard,
      ],
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: ExternalEmailView,
      path: '/externalEmail',
      guards: [
        AuthGuard,
      ],
      // durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter()
      : super(
          authGuard: AuthGuard(),
          emailGuard: EmailGuard(),
        );
}
