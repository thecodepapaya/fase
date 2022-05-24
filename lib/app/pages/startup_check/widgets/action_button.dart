part of '../view.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRegistrationValid = ref.watch(_vsProvider.select((state) => state.isRegistrationValid));
    final ifAllChecksPassed = ref.watch(_vsProvider.select((state) => state.allChecksPassed));

    final controller = ref.watch(_vsProvider.notifier);

    final infoText = _getInfoText(
      didAllCheckPass: ifAllChecksPassed,
      isRegistrationValid: isRegistrationValid,
    );

    final enableActionButton = _enableActionButton(
      didAllCheckPass: ifAllChecksPassed,
      isRegistrationValid: isRegistrationValid,
    );

    final buttonText = _getButtonText(isRegistrationValid: isRegistrationValid);

    return Column(
      children: [
        Text(infoText, style: FTextStyle.heading),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: enableActionButton ? controller.onActionButtonPressed : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buttonText),
            ],
          ),
        ),
      ],
    );
  }

  String _getInfoText({
    required bool didAllCheckPass,
    required bool? isRegistrationValid,
  }) {
    late final String text;

    if (isRegistrationValid == null) {
      text = 'Checking device info ...';
    } else if (!didAllCheckPass) {
      text = 'Some Checks Failed';
    } else if (isRegistrationValid) {
      text = 'All Checks Passed!';
    } else {
      text = 'Registration Pending';
    }

    return text;
  }

  bool _enableActionButton({
    required bool didAllCheckPass,
    required bool? isRegistrationValid,
  }) {
    late final bool enableActionButton;

    if (isRegistrationValid == null) {
      enableActionButton = false;
    } else if (didAllCheckPass || !isRegistrationValid) {
      enableActionButton = true;
    } else {
      enableActionButton = false;
    }

    return enableActionButton;
  }

  String _getButtonText({required bool? isRegistrationValid}) {
    late final String text;

    switch (isRegistrationValid) {
      case false:
        text = 'Registration Pending';
        break;
      case true:
      case null:
        text = 'Proceed';
        break;
    }

    return text;
  }
}
