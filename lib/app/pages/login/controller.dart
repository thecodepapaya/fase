part of 'view.dart';

final _vsProvider = StateNotifierProvider((ref) {
  final controller = _VSController();

  return controller;
});

class _ViewState {
  final bool isLoggedIn;

  _ViewState({
    required this.isLoggedIn,
  });

  _ViewState.initial()
      : this(
          isLoggedIn: false,
        );

  _ViewState copyWith({
    bool? isLoggedIn,
  }) {
    return _ViewState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  void onSignInWithGoogle() {
    log('onSignInWithGoogle');
  }
}
