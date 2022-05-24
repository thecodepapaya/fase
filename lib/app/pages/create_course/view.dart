import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/course.dart';
import '../../utils/enums.dart';

part 'controller.dart';

class CreateCourseView extends ConsumerWidget {
  final Course? course;

  const CreateCourseView({
    Key? key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      title: 'Create Course',
      body: Container(),
    );
  }
}
