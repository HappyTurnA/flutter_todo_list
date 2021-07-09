import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_todo_model.dart';

class RegisterTodo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<RegisterTodoModel>(
        create: (_) => RegisterTodoModel(),
        child: Scaffold(
          body: Consumer<RegisterTodoModel>(
            builder: (context, model, child) {
              return Center(child: Text("todo 登録"));
            },
          ),
        ),
      ),
    );
  }
}
