part of 'view.dart';

final _vsProvider = StateNotifierProvider((ref) {
  final controller = _VSController();

  return controller;
});

class _ViewState {
  final bool isLoggedIn;
  final bool? isIIITVEmail;

  _ViewState({
    required this.isLoggedIn,
    required this.isIIITVEmail,
  });

  _ViewState.initial()
      : this(
          isLoggedIn: false,
          isIIITVEmail: null,
        );

  _ViewState copyWith({
    bool? isLoggedIn,
    bool? isIIITVEmail,
  }) {
    return _ViewState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isIIITVEmail: isIIITVEmail ?? this.isIIITVEmail,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  Future<void> onLogoutButtonTapped() async {
    await AuthUsecase.instance.logOutUser();

    appRouter.pushAndPopUntil(const SystemCheckRoute(), predicate: (_) => false);
  }
}
