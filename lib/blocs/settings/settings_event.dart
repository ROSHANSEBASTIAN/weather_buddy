part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SaveSelPlace extends SettingsEvent {
  final Place selPlace;
  const SaveSelPlace({required this.selPlace});

  @override
  List<Object> get props => [selPlace];
}
