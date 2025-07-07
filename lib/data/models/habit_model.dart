import '../../domain/entities/habit.dart';

class HabitModel extends Habit {
  HabitModel({
    required String title,
    required bool isCompleted,
  }) : super(title: title, isCompleted: isCompleted);
}
