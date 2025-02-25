import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/core/constants/colors_constants.dart';
import 'package:task_management_app/features/my_tasks/view_model/my_task_view_model.dart';
import 'package:task_management_app/features/shared/model/task_model.dart';
import 'package:task_management_app/features/shared/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/tasks/view_model/task_state.dart';
import 'package:task_management_app/features/tasks/view_model/task_view_model.dart';



class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  TextEditingController searchController = TextEditingController();

  String _searchQuery = '';
  List<FetchTaskModel> filteredTaskData = [];

  @override
  void initState() {
    Future.microtask(() {
      ref.read(taskModelViewModelNotifier.notifier).getAllTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskModelViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Task Manager",
      ),
      body: taskState is TaskStateSuccess
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value ;
                  if(_searchQuery.isNotEmpty){
                    filteredTaskData = taskState.data.map((fetchTask) {
                      var filteredTasks = fetchTask.tasks?.where((task) {
                        return task.title?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false;
                      }).toList();

                      return FetchTaskModel(
                        date: fetchTask.date,
                        tasks: filteredTasks,
                      );
                    }).where((fetchTask) => fetchTask.tasks != null && fetchTask.tasks!.isNotEmpty).toList();
                  }
                });
              },
            ),
          ),
          Expanded(
            child:  ListView.builder(
              itemCount: _searchQuery.isNotEmpty ? filteredTaskData.length :taskState.data.length ?? 0,
              itemBuilder: (context, index) {
                TaskModel taskData = taskState.data[index].tasks?[0] ?? TaskModel();
                return buildTaskItem(context,taskData);
                // return Text('data');
              },
            ),
          ),
        ],
      )
          : taskState is TaskStateFailure
          ? Text(taskState.message)
          :taskState is TaskStateLoading
          ? const Center(child: CircularProgressIndicator())
          :const SizedBox(),
    );
  }

  Widget buildTaskItem(BuildContext context, TaskModel task) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        title: Text(task.title ?? ''),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary.shade500,
            minimumSize: const Size(30, 30),
            padding: EdgeInsets.zero,
          ),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            ref.read(myTaskViewModelProvider.notifier).
            addTask(context: context, taskModel: task);
          },
        ),
        children: task.subtasks != null
            ? task.subtasks!.map((subtask) {
          return Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListTile(
              title: Text(subtask.title ?? ''),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary.shade500,
                  minimumSize: const Size(30, 30),
                  padding: EdgeInsets.zero,
                ),
                child: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  ref.read(myTaskViewModelProvider.notifier).
                  addTask(context: context, taskModel: subtask);
                },
              ),
            ),
          );
        }).toList()
            : [],
      ),
    );
  }
}


