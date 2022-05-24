import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/app/core_widgets/text_styles.dart';
import 'package:fase/app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'controller.dart';
part 'widgets/action_button.dart';
part 'widgets/check_icon.dart';
part 'widgets/circular_loader.dart';
part 'widgets/refresh_button.dart';
part 'widgets/side_drawer.dart';
part 'widgets/table.dart';

class StartUpCheckView extends ConsumerWidget {
  const StartUpCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      title: 'Startup Check',
      drawer: const SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                StartupCheckTable(),
                SizedBox(height: 50),
                ActionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
