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
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SplashScreenView(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoginView(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    StartUpCheckRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const StartUpCheckView(),
          opaque: true,
          barrierDismissible: false);
    },
    CourseListRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CourseListView(),
          opaque: true,
          barrierDismissible: false);
    },
    CreateCourseRoute.name: (routeData) {
      final args = routeData.argsAs<CreateCourseRouteArgs>(
          orElse: () => const CreateCourseRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: CreateCourseView(key: args.key, course: args.course),
          opaque: true,
          barrierDismissible: false);
    },
    AttendanceRecordRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const AttendanceRecordView(),
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
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
class CreateCourseRoute extends PageRouteInfo<CreateCourseRouteArgs> {
  CreateCourseRoute({Key? key, Course? course})
      : super(CreateCourseRoute.name,
            path: '/createCourse',
            args: CreateCourseRouteArgs(key: key, course: course));

  static const String name = 'CreateCourseRoute';
}

class CreateCourseRouteArgs {
  const CreateCourseRouteArgs({this.key, this.course});

  final Key? key;

  final Course? course;

  @override
  String toString() {
    return 'CreateCourseRouteArgs{key: $key, course: $course}';
  }
}

/// generated route for
/// [AttendanceRecordView]
class AttendanceRecordRoute extends PageRouteInfo<void> {
  const AttendanceRecordRoute()
      : super(AttendanceRecordRoute.name, path: '/attendanceRecord');

  static const String name = 'AttendanceRecordRoute';
}
