part of 'fixtures_bloc.dart';

abstract class FixturesState extends Equatable {
  const FixturesState();

  @override
  List<Object> get props => [];
}

class FixturesInitial extends FixturesState {}

class LoadingFixturesState extends FixturesState {}

class ErrorFixturesState extends FixturesState {
  final String message;
  ErrorFixturesState({required this.message});
  @override
  List<Object> get props => [message];
}

class LoadedFixturessState extends FixturesState {
  final List<Fixtures> fixtures;
  LoadedFixturessState({required this.fixtures});
  @override
  List<Object> get props => [fixtures];
}
