import 'dart:async';

import 'package:aletha_health_assignment/bloc/exercise_bloc.dart';
import 'package:aletha_health_assignment/bloc/exercise_event.dart';
import 'package:aletha_health_assignment/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerScreen extends StatefulWidget {
  final Exercise exercise;

  const TimerScreen({super.key, required this.exercise});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late int remaining;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remaining = widget.exercise.duration;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remaining == 0) {
        t.cancel();
        context
            .read<ExerciseBloc>()
            .add(MarkExerciseCompleted(widget.exercise.id));
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text(
              'Completed',
            ),
            content: Text(
              '${widget.exercise.name} is complete!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      } else {
        setState(() => remaining--);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise Timer',
        ),
      ),
      body: Center(
        child: Text(
          '$remaining',
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
