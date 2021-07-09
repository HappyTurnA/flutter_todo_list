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
        create: (_) => TodoViewModel(),
        child: Scaffold(
          body: Consumer<TodoViewModel>(
            builder: (context, model, child) {
              return Center(child: Text("todo 閲覧"));
            },
          ),
        ),
      ),
    );
  }
}
