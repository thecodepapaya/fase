// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreenView());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginView());
    },
    StartUpCheckRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StartUpCheckView());
    },
    CourseListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CourseListView());
    },
    CreateCourseRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CreateCourseView());
    },
    AttendanceRecordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AttendanceRecordView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        RouteConfig(SplashScreenRoute.name, path: '/splash'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(StartUpCheckRoute.name,
            path: '/startupCheck', guards: [authGuard]),
        RouteConfig(CourseListRoute.name,
            path: '/courseList', guards: [authGuard]),
        RouteConfig(CreateCourseRoute.name,
            path: '/createCourse', guards: [authGuard]),
        RouteConfig(AttendanceRecordRoute.name,
            path: '/attendanceRecord', guards: [authGuard])
      ];
}

/// generated route for
/// [SplashScreenView]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [StartUpCheckView]
class StartUpCheckRoute extends PageRouteInfo<void> {
  const StartUpCheckRoute()
      : super(StartUpCheckRoute.name, path: '/startupCheck');

  static const String name = 'StartUpCheckRoute';
}

/// generated route for
/// [CourseListView]
class CourseListRoute extends PageRouteInfo<void> {
  const CourseListRoute() : super(CourseListRoute.name, path: '/courseList');

  static const String name = 'CourseListRoute';
}

/// generated route for
/// [CreateCourseView]
class CreateCourseRoute extends PageRouteInfo<void> {
  const CreateCourseRoute()
      : super(CreateCourseRoute.name, path: '/createCourse');

  static const String name = 'CreateCourseRoute';
}

/// generated route for
/// [AttendanceRecordView]
class AttendanceRecordRoute extends PageRouteInfo<void> {
  const AttendanceRecordRoute()
      : super(AttendanceRecordRoute.name, path: '/attendanceRecord');

  static const String name = 'AttendanceRecordRoute';
}
