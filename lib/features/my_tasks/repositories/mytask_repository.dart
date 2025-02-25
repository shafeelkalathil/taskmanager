import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_management_app/core/constants/firebase_constants.dart';
import 'package:task_management_app/features/shared/model/task_model.dart';

final myTaskRepositoriesProvider = Provider((ref) => MyTaskRepositories(),);

class MyTaskRepositories {

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  CollectionReference get _tasks =>
      _fireStore.collection(FirebaseConstants.tasks);

  Future<Either<String,String>> addTask({required TaskModel taskModel})async{
    try{
      DocumentReference taskDoc=_tasks.doc();
      // final updatedUserData=taskModel.copyWith(id: userDoc.id);
      await _tasks.doc(taskDoc.id).set(taskModel.toJson());
      return right('');
    }on FirebaseException catch(e){
      throw e.message!;
    }catch(e){
      return left(e.toString());
    }
  }

  Stream<List<TaskModel>> getTasks() {
    return _tasks
        .snapshots().map(
            (data) => data.docs
            .map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>)).toList());
  }

}
