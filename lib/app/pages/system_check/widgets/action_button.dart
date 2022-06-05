part of '../view.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_vsProvider);
    final controller = ref.watch(_vsProvider.notifier);

    final actionButtonState = _getActionButtonState(state);

    final infoText = _getInfoText(actionButtonState: actionButtonState);
    final enableActionButton = _enableActionButton(actionButtonState: actionButtonState);
    final buttonText = _getButtonText(actionButtonState: actionButtonState);

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

  String _getInfoText({required ActionButtonState actionButtonState}) {
    late final String text;

    switch (actionButtonState) {
      case ActionButtonState.checkingStatus:
        text = 'Checking device info ...';
        break;
      case ActionButtonState.allChecksPass:
        text = 'All Checks Passed!';
        break;
      case ActionButtonState.someCheckFailed:
        text = 'Some Checks Failed';
        break;
      case ActionButtonState.registrationInvalid:
        text = 'Registration Pending';
        break;
    }

    return text;
  }

  bool _enableActionButton({required ActionButtonState actionButtonState}) {
    late final bool enableActionButton;

    switch (actionButtonState) {
      case ActionButtonState.someCheckFailed:
      case ActionButtonState.checkingStatus:
        enableActionButton = false;
        break;
      case ActionButtonState.allChecksPass:
      case ActionButtonState.registrationInvalid:
        enableActionButton = true;
        break;
    }

    return enableActionButton;
  }

  String _getButtonText({required ActionButtonState actionButtonState}) {
    late final String text;

    switch (actionButtonState) {
      case ActionButtonState.checkingStatus:
        text = 'Checking';
        break;
      case ActionButtonState.allChecksPass:
      case ActionButtonState.someCheckFailed:
        text = 'Proceed';
        break;
      case ActionButtonState.registrationInvalid:
        text = 'Register';
        break;
    }

    return text;
  }

  ActionButtonState _getActionButtonState(_ViewState state) {
    final ActionButtonState actionButtonState;

    if (state.isCheckingStatus) {
      // Checking status of all checks
      actionButtonState = ActionButtonState.checkingStatus;
    } else if (state.allChecksPassed) {
      // All checks valid, can proceed to course selection
      actionButtonState = ActionButtonState.allChecksPass;
    } else {
      // Some checks have failed

      if (state.everythingExceptRegistrationPassed) {
        // All checks passed but registration failed, can proceed for registration
        actionButtonState = ActionButtonState.registrationInvalid;
      } else {
        // Something other than registration failed, cannot proceed forward
        actionButtonState = ActionButtonState.someCheckFailed;
      }
    }

    return actionButtonState;
  }
}
