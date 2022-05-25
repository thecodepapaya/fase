part of 'view.dart';

class _VSControllerParams extends Equatable {
  final VoidCallback onSuccess;

  const _VSControllerParams({
    required this.onSuccess,
  });

  @override
  List<Object?> get props => [onSuccess];
}

final _paramsProvider = Provider<_VSControllerParams>((ref) {
  throw UnimplementedError();
});

final _vsProvider =
    StateNotifierProvider.autoDispose.family<_VSController, _ViewState, _VSControllerParams>((ref, params) {
  final controller = _VSController(params);

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
  final _VSControllerParams params;

  _VSController(this.params) : super(_ViewState.initial());

  Future<void> onSignInWithGoogle() async {
    log('onSignInWithGoogle');

    final user = await AuthUsecase.instance.signInUser();

    if (user != null) {
      params.onSuccess();
    }
  }
}
