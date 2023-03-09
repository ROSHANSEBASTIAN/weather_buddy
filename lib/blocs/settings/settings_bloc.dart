import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/place/place.dart';
import '../../models/settings/settings.dart';
import '../../utils/config.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SaveSelPlace>((event, emit) {
      Settings settings = state.settings;
      settings.selPlace = event.selPlace;

      return emit(SettingsState(settings: settings));
    });
  }
}
