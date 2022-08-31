import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';

import '../../../../../core/error/failutes.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/usecases/get_api.dart';

part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  final GetApiFixturesUseCase getAllFixtures;

  FixturesBloc({required this.getAllFixtures}) : super(FixturesInitial()) {
    on<FixturesEvent>((event, emit) async {
      if (event is GetAllFixturesEvent) {
        emit(LoadingFixturesState());
        final failureOrFixtures = await getAllFixtures(true);
        emit(_mapFailureOrFixturesToState(failureOrFixtures));
      }
    });
  }
  FixturesState _mapFailureOrFixturesToState(
      Either<Failure, List<Fixtures>> either) {
    return either.fold(
      (failure) => ErrorFixturesState(message: _mapFailureToMessage(failure)),
      (fixtures) => LoadedFixturessState(
        fixtures: fixtures,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
