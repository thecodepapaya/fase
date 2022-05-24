// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:fase/app/utils/guards/auth_guard.dart';
import 'package:flutter/material.dart';

import '../../pages/attendance_record/view.dart';
import '../../pages/course_list/view.dart';
import '../../pages/create_course/view.dart';
import '../../pages/login/view.dart';
import '../../pages/splash_screen/view.dart';
import '../../pages/startup_check/view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreenView,
      initial: true,
      path: '/splash',
    ),
    AutoRoute(
      page: LoginView,
      path: '/login',
    ),
    AutoRoute(
      page: StartUpCheckView,
      path: '/startupCheck',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: CourseListView,
      path: '/courseList',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: CreateCourseView,
      path: '/createCourse',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: AttendanceRecordView,
      path: '/attendanceRecord',
      guards: [AuthGuard],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super(authGuard: AuthGuard());
}
