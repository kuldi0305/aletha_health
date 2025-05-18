import 'package:aletha_health_assignment/models/exercise.dart';
import 'package:aletha_health_assignment/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Exercise exercise;

  const DetailScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exercise.description),
            const SizedBox(height: 10),
            Text(
              'Duration: ${exercise.duration} seconds',
            ),
            Text(
              'Difficulty: ${exercise.difficulty}',
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TimerScreen(exercise: exercise),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
