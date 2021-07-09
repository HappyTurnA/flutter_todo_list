import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/todo.dart';

class CompleteViewModel extends ChangeNotifier {
  List<Todo> todoList = [];

  Future fetchTodos() async {
    FirebaseFirestore.instance
        .collection("todos")
        .where("is_complete", isEqualTo: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        todoList.add(Todo(doc.id, doc['name'], true));
        notifyListeners();
      });
    });
  }

  Future<void> completeTodo(Todo todo) async {
    final doc = FirebaseFirestore.instance.collection("todos").doc(todo.id);
    await doc.update({'is_complete': true, 'completed_at': Timestamp.now()});
  }
}
