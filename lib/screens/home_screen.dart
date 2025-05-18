// Imports omitted for brevity
import 'package:aletha_health_assignment/bloc/exercise_bloc.dart';

import 'package:aletha_health_assignment/bloc/exercise_state.dart';

import 'package:aletha_health_assignment/screens/detail_screen.dart';
import 'package:aletha_health_assignment/widgets/exercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aletha Health Workouts',
        ),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          if (state is ExerciseLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ExerciseError) return Center(child: Text(state.message));
          if (state is ExerciseLoaded) {
            final completed = state.exercises
                .where(
                  (e) => state.completedIds.contains(e.id),
                )
                .toList();
            final pending = state.exercises
                .where(
                  (e) => !state.completedIds.contains(e.id),
                )
                .toList();

            return ListView(
              children: [
                if (pending.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Pending Exercises",
                    ),
                  ),
                  ...pending.map((ex) => ExerciseTile(
                        exercise: ex,
                        isCompleted: false,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(exercise: ex),
                          ),
                        ),
                      )),
                ],
                if (completed.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Completed Exercises",
                    ),
                  ),
                  ...completed.map(
                    (ex) => ExerciseTile(
                      exercise: ex,
                      isCompleted: true,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(exercise: ex),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
