import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/habit.dart';
import '../../domain/usecases/toggle_habit.dart';
import '../../core/error/failure.dart';

class HabitCubit extends Cubit<List<Habit>> {
  HabitCubit() : super([]);

  void addHabit(Habit habit) {
    try {
      final updatedList = List<Habit>.from(state)..add(habit);
      emit(updatedList);
    } catch (e) {
      throw Failure('Failed to add habit');
    }
  }

  void toggleHabit(int index) {
    try {
      final toggler = ToggleHabitUseCase();
      final updatedList = List<Habit>.from(state);
      updatedList[index] = toggler.toggle(updatedList[index]);
      emit(updatedList);
    } catch (e) {
      throw Failure('Failed to toggle habit');
    }
  }

  void removeHabit(int index) {
    try {
      final updatedList = List<Habit>.from(state)..removeAt(index);
      emit(updatedList);
    } catch (e) {
      throw Failure('Failed to remove habit');
    }
  }
}
