import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/exercise_repository.dart';
import 'exercise_event.dart';
import 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository repository;

  final Set<String> _completedIds = {};

  ExerciseBloc(this.repository) : super(ExerciseInitial()) {
    on<LoadExercises>(
      (event, emit) async {
        emit(ExerciseLoading());
        try {
          final exercises = await repository.fetchExercises();
          emit(
            ExerciseLoaded(exercises, completedIds: _completedIds),
          );
        } catch (e) {
          emit(ExerciseError(e.toString()));
        }
      },
    );

    on<MarkExerciseCompleted>((event, emit) async {
      _completedIds.add(event.id);
      if (state is ExerciseLoaded) {
        emit(ExerciseLoaded((state as ExerciseLoaded).exercises,
            completedIds: _completedIds));
      }
    });
  }
}
