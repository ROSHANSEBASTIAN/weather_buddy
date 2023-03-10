part of 'astronomy_bloc.dart';

abstract class AstronomyState extends Equatable {
  const AstronomyState();

  @override
  List<Object> get props => [];
}

class AstronomyInitial extends AstronomyState {
  final bool loading;
  const AstronomyInitial() : loading = false;
}

class AstronomyInfoLoading extends AstronomyState {
  final bool loading;
  const AstronomyInfoLoading() : loading = true;
}

class AstronomyInfoLoadSuccess extends AstronomyState {
  final bool loading;
  final AstroInfo astroInfo;
  const AstronomyInfoLoadSuccess({required this.astroInfo}) : loading = false;
}

class AstronomyInfoLoadError extends AstronomyState {
  final bool loading;
  final String error;
  const AstronomyInfoLoadError({required this.error}) : loading = false;
}
