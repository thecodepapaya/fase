// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../pages/attendance_record/view.dart';
import '../../pages/course_list/view.dart';
import '../../pages/create_course/view.dart';
import '../../pages/login/view.dart';
import '../../pages/splash_screen/view.dart';
import '../../pages/startup_check/view.dart';
import '../guards/auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <CustomRoute>[
    CustomRoute(
      page: SplashScreenView,
      initial: true,
      path: '/splash',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: LoginView,
      path: '/login',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: StartUpCheckView,
      path: '/startupCheck',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: CourseListView,
      path: '/courseList',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: CreateCourseView,
      path: '/createCourse',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: AttendanceRecordView,
      path: '/attendanceRecord',
      guards: [AuthGuard],
      durationInMilliseconds: 300,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super(authGuard: AuthGuard());
}
