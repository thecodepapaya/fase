import 'package:equatable/equatable.dart';
import 'package:fase/app/app.dart';
import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/app/core_widgets/text_styles.dart';
import 'package:fase/app/globals.dart';
import 'package:fase/app/utils/extensions.dart';
import 'package:fase/app/utils/router/app_router.dart';
import 'package:fase/domain/usecases/course_usecases.dart';
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
  final int? courseID;

  const CreateCourseView({
    Key? key,
    this.courseID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = _VSControllerParams(courseID: courseID);

    final apiStatus = ref.watch(_vsProvider(params).select((state) => state.apiStatus));
    final controller = ref.watch(_vsProvider(params).notifier);

    return FScaffold(
      title: courseID == null ? 'Create Course' : 'Edit Course',
      appBarActionButton: IconButton(
        onPressed: controller.onCourseSaved,
        icon: const Icon(Icons.check_rounded),
      ),
      body: ProviderScope(
        overrides: [_paramsProvider.overrideWithValue(params)],
        child: () {
          late final Widget body;

          switch (apiStatus) {
            case ApiStatus.loading:
              body = const _LoadingBody();
              break;
            case ApiStatus.init:
            case ApiStatus.success:
              body = _SuccessBody();

              break;
            case ApiStatus.failed:
              body = const _FailureBody();

              break;
          }

          return body;
        }(),
      ),
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

class _SuccessBody extends ConsumerWidget {
  _SuccessBody({Key? key}) : super(key: key);

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Form(
        key: _globalKey,
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
