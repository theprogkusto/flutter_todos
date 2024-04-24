import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_repository/todos_repository.dart';
import 'edit_todo_state.dart';
import 'package:uuid/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_todo_notifier.g.dart';

@riverpod
class EditTodoNotifier extends AutoDisposeNotifier<EditTodoState> {
  late final TodosRepository? todosRepository;
  late final Todo? initialTodo;

 
  @override
  EditTodoState build() {
    return EditTodoState(initialTodo: initialTodo);
  }

  void titleChanged(String title) => state = state.copyWith(title: title);
  void descriptionChanged(String description) =>
      state = state.copyWith(description: description);

  Future<void> submit() async {
    state = state.copyWith(status: EditTodoStatus.loading);
    try {
      final todo = state.initialTodo?.copyWith(
            title: state.title,
            description: state.description,
          ) ??
          Todo(
              id: const Uuid().v4(),
              title: state.title,
              description: state.description);

      await todosRepository?.saveTodo(todo);
      state = state.copyWith(status: EditTodoStatus.success);
    } catch (e) {
      state = state.copyWith(status: EditTodoStatus.failure);
    }
  }
}
