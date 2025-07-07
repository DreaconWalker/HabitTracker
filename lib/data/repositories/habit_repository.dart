import '../../domain/entities/habit.dart';

abstract class HabitRepository {
  Future<List<Habit>> fetchHabits();
  Future<void> addHabit(Habit habit);
  Future<void> removeHabit(Habit habit);
}
