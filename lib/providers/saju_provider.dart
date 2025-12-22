import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/fortune/saju/models/saju_profile.dart';

final sajuProvider = StateNotifierProvider<SajuNotifier, SajuState>((ref) {
  return SajuNotifier();
});

class SajuState {
  final List<SajuProfile> profiles;
  final SajuProfile? mainProfile;
  final bool isLoading;

  SajuState({
    this.profiles = const [],
    this.mainProfile,
    this.isLoading = true,
  });

  SajuState copyWith({
    List<SajuProfile>? profiles,
    SajuProfile? mainProfile,
    bool? isLoading,
  }) {
    return SajuState(
      profiles: profiles ?? this.profiles,
      mainProfile: mainProfile ?? this.mainProfile,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SajuNotifier extends StateNotifier<SajuState> {
  SajuNotifier() : super(SajuState()) {
    loadProfiles();
  }

  Future<void> loadProfiles() async {
    state = state.copyWith(isLoading: true);
    final profiles = await SajuProfile.loadProfiles();
    final mainProfile = await SajuProfile.loadProfile();
    state = state.copyWith(
      profiles: profiles,
      mainProfile: mainProfile,
      isLoading: false,
    );
  }

  Future<void> saveProfile(SajuProfile profile, {bool isMain = true}) async {
    await SajuProfile.saveProfile(profile);
    if (isMain) {
      // SajuProfile.saveProfile already saves to 'saju_profile' and 'saju_profiles'
      // But we need to make sure the single profile is updated too if it's main
    }
    await loadProfiles();
  }

  Future<void> deleteProfile(SajuProfile profile) async {
    await SajuProfile.deleteProfile(profile);
    await loadProfiles();
  }
}
