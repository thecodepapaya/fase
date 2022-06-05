import 'dart:async';

import 'package:fase/app/core_widgets/refresh_button.dart';
import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/app/core_widgets/text_styles.dart';
import 'package:fase/app/globals.dart';
import 'package:fase/app/utils/router/app_router.dart';
import 'package:fase/domain/usecases/course_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/course.dart';
import '../../app.dart';
import '../../utils/enums.dart';

part 'controller.dart';
part 'widgets/course_tile/action_button.dart';
part 'widgets/course_tile/course_details.dart';
part 'widgets/course_tile/course_tile.dart';
part 'widgets/course_tile/window_timer.dart';
part 'widgets/create_course_button.dart';
part 'widgets/empty_course_list.dart';

class CourseListView extends ConsumerWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiStatus = ref.watch(_vsProvider.select((state) => state.apiStatus));

    final controller = ref.watch(_vsProvider.notifier);

    return FScaffold(
      title: 'Courses',
      appBarActionButton: RefreshButton(onRefresh: controller.refresh),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: () {
          late Widget widget;

          switch (apiStatus) {
            case ApiStatus.init:
            case ApiStatus.loading:
              widget = const _LoadingBody();
              break;
            case ApiStatus.success:
              widget = const _SuccessBody();
              break;

            case ApiStatus.failed:
              widget = const _FailureBody();
              break;
          }

          return widget;
        }(),
      ),
      floatingActionButton: const CreateCourseButton(),
    );
  }
}

class _SuccessBody extends ConsumerWidget {
  const _SuccessBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(_vsProvider.select((state) => state.courses));
    final isCourseListEmpty = courses.isEmpty;

    return isCourseListEmpty
        ? const EmptyCourseList()
        : ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseTile(course: courses[index]);
            },
          );
  }
}

class _FailureBody extends ConsumerWidget {
  const _FailureBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Please try again later',
        style: FTextStyle.heading3,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _LoadingBody extends ConsumerWidget {
  const _LoadingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
