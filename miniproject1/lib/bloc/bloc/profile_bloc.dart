import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/profile_model.dart';
import '../../services/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService _profileService;

  ProfileBloc(this._profileService) : super(ProfileInitial()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await _profileService.fetchProfile();
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError('Failed to fetch profile'));
      }
    });
  }
}
