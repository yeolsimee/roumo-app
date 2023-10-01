import 'package:flutter_riverpod/flutter_riverpod.dart';

final agreementCheckStateProvider =
    StateNotifierProvider<AgreementCheckStateNotifier, AgreementCheckState>(
  (ref) {
    return AgreementCheckStateNotifier();
  },
);

class AgreementCheckStateNotifier extends StateNotifier<AgreementCheckState> {
  AgreementCheckStateNotifier() : super(const AgreementCheckState());

  void checkServiceAgree() {
    state = state.copyWith(isServiceAgree: !state.isServiceAgree);
  }

  void checkPrivacyAgree() {
    state = state.copyWith(isPrivacyAgree: !state.isPrivacyAgree);
  }

  void checkAllAgree() {
    final isAllAgree = state.isAllAgree();

    state = state.copyWith(
      isServiceAgree: !isAllAgree,
      isPrivacyAgree: !isAllAgree,
    );
  }

  Future<void> reset() async {
    await Future.microtask(() => state = const AgreementCheckState());
  }
}

class AgreementCheckState {
  const AgreementCheckState({
    this.isServiceAgree = false,
    this.isPrivacyAgree = false,
  });

  final bool isServiceAgree;
  final bool isPrivacyAgree;

  AgreementCheckState copyWith({
    bool? isServiceAgree,
    bool? isPrivacyAgree,
  }) {
    return AgreementCheckState(
      isServiceAgree: isServiceAgree ?? this.isServiceAgree,
      isPrivacyAgree: isPrivacyAgree ?? this.isPrivacyAgree,
    );
  }

  bool isAllAgree() => isServiceAgree && isPrivacyAgree;
}
