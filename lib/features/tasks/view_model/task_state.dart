
import 'package:task_management_app/features/shared/model/task_model.dart';

abstract class TaskState {}

class TaskStateInitial extends TaskState {}

class TaskStateLoading extends TaskState {}

class TaskStateFailure extends TaskState {
  TaskStateFailure(this.message);
  final String message;
}

class TaskStateSuccess extends TaskState {
  TaskStateSuccess(this.data);
  final List<FetchTaskModel> data;
}
