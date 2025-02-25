import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/core/constants/colors_constants.dart';
import 'package:task_management_app/features/my_tasks/view_model/my_task_view_model.dart';
import 'package:task_management_app/features/shared/model/task_model.dart';
import 'package:task_management_app/features/shared/widgets/custom_app_bar.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Tasks',),
      body: Consumer(builder: (context, ref, child) {
        final myTaskData = ref.watch(getTasksProvider);
        return myTaskData.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final myTasks = data[index];
                  return myTaskItem(context,myTasks,index+1);
                },);
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        );
      },),
    );
  }

  Widget myTaskItem(BuildContext context, TaskModel task,int index) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: primary.shade500,
            radius: 15,
            child: Text('$index',style: const TextStyle(color: Colors.white),)),
        title: Text("Title : ${task.title}" ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description : ${task.description}" ?? ''),
            Text("Task Id : ${task.taskId}" ?? ''),
          ],
        ),
      ),
    );
  }
}
