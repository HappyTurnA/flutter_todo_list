import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(hintText: "タスク名"),
                        onChanged: (val) {
                          model.taskName = val;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                          onPressed: () {
                            model.addTodo();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add_task),
                              Text("登録する"),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
