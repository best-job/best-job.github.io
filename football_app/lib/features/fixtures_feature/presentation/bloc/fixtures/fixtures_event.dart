part of 'fixtures_bloc.dart';

abstract class FixturesEvent extends Equatable {
  const FixturesEvent();

  @override
  List<Object> get props => [];
}

class GetAllFixturesEvent extends FixturesEvent {}

class NaviDetailsEvent extends FixturesEvent {}
