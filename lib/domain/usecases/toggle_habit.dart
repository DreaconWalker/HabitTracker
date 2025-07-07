import '../entities/habit.dart';

class ToggleHabitUseCase {
  Habit toggle(Habit habit) {
    return Habit(title: habit.title, isCompleted: !habit.isCompleted);
  }
}
