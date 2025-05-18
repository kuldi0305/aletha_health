import 'package:aletha_health_assignment/bloc/exercise_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/exercise_bloc.dart';
import 'repository/exercise_repository.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    const AlethaHealthApp(),
  );
}

class AlethaHealthApp extends StatelessWidget {
  const AlethaHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ExerciseRepository(),
      child: BlocProvider(
        create: (context) => ExerciseBloc(
          context.read<ExerciseRepository>(),
        )..add(
            LoadExercises(),
          ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aletha Health',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
