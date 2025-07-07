import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/habit.dart';
import '../bloc/habit_cubit.dart';

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabitCubit(),
      child: BlocBuilder<HabitCubit, List<Habit>>(
        builder: (context, habits) {
          return ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];
              return ListTile(
                title: Text(habit.title),
                trailing: IconButton(
                  icon: Icon(
                    habit.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                  ),
                  onPressed: () => context.read<HabitCubit>().toggleHabit(index),
                ),
                onLongPress: () => context.read<HabitCubit>().removeHabit(index),
              );
            },
          );
        },
      ),
    );
  }
}
