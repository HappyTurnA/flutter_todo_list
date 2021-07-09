import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterTodoModel extends ChangeNotifier {
  String taskName = "";

  Future<void> addTodo() async {
    print(taskName);
    await FirebaseFirestore.instance.collection("todos").add({
      'name': this.taskName,
      'is_complete': false,
      'created_at': Timestamp.now()
    });
  }
}
