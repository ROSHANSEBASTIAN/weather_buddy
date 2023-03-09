part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Settings settings;
  const SettingsState({required this.settings});

  @override
  List<Object> get props => [settings];
}

class SettingsInitial extends SettingsState {
  SettingsInitial() : super(settings: Settings(selPlace: Config.defaultPlace));
}
