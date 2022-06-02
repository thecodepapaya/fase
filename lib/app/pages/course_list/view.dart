import 'package:fase/app/core_widgets/refresh_button.dart';
import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/app/core_widgets/text_styles.dart';
import 'package:fase/app/utils/router/app_router.dart';
import 'package:fase/data/repositories/course_repository.dart';
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
part 'widgets/empty_course_list.dart';

class CourseListView extends ConsumerWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(_vsProvider.select((state) => state.courses));
    final controller = ref.watch(_vsProvider.notifier);

    final isCourseListEmpty = courses.isEmpty;

    return FScaffold(
      title: 'Courses',
      appBarActionButton: RefreshButton(onRefresh: controller.refresh),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: isCourseListEmpty
            ? const EmptyCourseList()
            : ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseTile(course: courses[index]);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onCreateCourse,
        child: const Icon(Icons.add),
      ),
    );
  }
}
