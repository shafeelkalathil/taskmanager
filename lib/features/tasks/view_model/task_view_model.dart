import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/features/tasks/repositories/task_repository.dart';
import 'package:task_management_app/features/tasks/view_model/task_state.dart';

final taskModelViewModelNotifier = StateNotifierProvider<TaskViewModel, TaskState>(
      (ref) => TaskViewModel(
        taskRepositories: ref.read(taskRepositoriesProvider),
  ),
);

class TaskViewModel extends StateNotifier<TaskState> {
  TaskViewModel({required this.taskRepositories}) : super(TaskStateInitial());

  final TaskRepositories taskRepositories;

  Future<void> getAllTasks() async {

    state = TaskStateLoading();
    final result = await taskRepositories.getAllTasks();

    result.fold((errorMessage) {
      state = TaskStateFailure(errorMessage);
    }, (successMessage) {
      state = TaskStateSuccess(successMessage);
    },
    );
  }
}
