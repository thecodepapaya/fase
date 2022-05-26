import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/course.dart';
import '../../utils/enums.dart';

part 'controller.dart';
part 'helper.dart';
part 'widgets/course_code_field.dart';
part 'widgets/course_name_field.dart';
part 'widgets/description_field.dart';
part 'widgets/semester_drop_down.dart';
part 'widgets/year_drop_down.dart';

class CreateCourseView extends ConsumerWidget {
  final Course? course;

  CreateCourseView({
    Key? key,
    this.course,
  }) : super(key: key);

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    return FScaffold(
      title: 'Create Course',
      appBarActionButton: IconButton(
        onPressed: controller.onCourseSaved,
        icon: const Icon(Icons.check_rounded),
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CourseCodeField(),
              SizedBox(height: 30),
              CourseNameField(),
              SizedBox(height: 30),
              SemesterDropDown(),
              SizedBox(height: 30),
              YearDropDown(),
              SizedBox(height: 30),
              DescriptionField(),
            ],
          ),
        ),
      ),
    );
  }
}
