import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/app/core_widgets/text_styles.dart';
import 'package:fase/app/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/course.dart';
import '../../../domain/entities/faculty.dart';
import '../../app.dart';
import '../../utils/enums.dart';

part 'controller.dart';
part 'widgets/course_tile.dart';

class CourseListView extends ConsumerWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final courses = ref.watch(_vsProvider.select((state) => state.courses));
    final controller = ref.watch(_vsProvider.notifier);

    final Course defaultCourse = Course(
      id: 2,
      instructor:
          Faculty(instituteEmail: "instituteEmail@iiitvadodara.ac.in", googleUid: "googleUid", name: "Pramit Mazumdar"),
      courseCode: "CS101",
      courseName: "A very long name for a very ",
      semester: "autumn",
      academicYear: "2022-23",
      startTimestamp: DateTime.now(),
      attendanceDurationInMinutes: 5,
    );

    final courses = [
      defaultCourse,
      defaultCourse,
      defaultCourse,
      defaultCourse,
      defaultCourse,
      defaultCourse,
      defaultCourse,
      defaultCourse,
    ];

    return FScaffold(
      title: 'Courses',
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: ListView(
          children: courses
              .map(
                (c) => CourseTile(course: c),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onCreateCourse,
        child: const Icon(Icons.add),
      ),
    );
  }
}
