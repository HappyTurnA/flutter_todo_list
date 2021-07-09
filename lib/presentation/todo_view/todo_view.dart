import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_view_model.dart';

class TodoView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<TodoViewModel>(
        create: (_) => TodoViewModel()..fetchTodos(),
        child: Scaffold(
          body: Consumer<TodoViewModel>(
            builder: (context, model, child) {
              var todoList = model.todoList;
              final listTiles = todoList
                  .map((todo) => ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.check_box),
                          onPressed: () async {
                            await model.completeTodo(todo);
                          },
                        ),
                        title: Text(todo.title),
                      ))
                  .toList();
              return ListView(
                children: listTiles,
              );
            },
          ),
        ),
      ),
    );
  }
}
