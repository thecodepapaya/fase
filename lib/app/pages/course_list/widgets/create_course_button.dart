part of '../view.dart';

class CreateCourseButton extends ConsumerWidget {
  const CreateCourseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    final isFaculty = Globals.profile.isFaculty;

    return isFaculty
        ? FloatingActionButton(
            onPressed: controller.onCreateCourse,
            child: const Icon(Icons.add),
          )
        : const SizedBox();
  }
}
