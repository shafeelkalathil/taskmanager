import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/core/utils/helpers/helpers.dart';
import 'package:task_management_app/features/my_tasks/repositories/mytask_repository.dart';
import 'package:task_management_app/features/shared/model/task_model.dart';

final myTaskViewModelProvider = NotifierProvider<MyTaskViewModel,bool>(()=>MyTaskViewModel());
final getTasksProvider = StreamProvider((ref)=>ref.read(myTaskViewModelProvider.notifier).getTasks());


class MyTaskViewModel extends Notifier<bool>{
  @override
  bool build() {
    return false;
  }

  MyTaskRepositories get _homeRepository=>ref.read(myTaskRepositoriesProvider);

  Stream<List<TaskModel>> getTasks() {
    return _homeRepository.getTasks();
  }

  Future<void> addTask({required BuildContext context, required TaskModel taskModel})async{
    state=true;
    var res=await _homeRepository.addTask(taskModel: taskModel);
    state=false;
    res.fold((l)=>HelperFunctions.failureSnackBar(context: context,message: l), (r) {
      HelperFunctions.successSnackBar(context: context, message: 'new task added');
    },);
  }
}