import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'complete_view_model.dart';

class CompleteView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<CompleteViewModel>(
        create: (_) => CompleteViewModel(),
        child: Scaffold(
          body: Consumer<CompleteViewModel>(
            builder: (context, model, child) {
              var todoList = model.todoList;
              final listTiles = todoList
                  .map((todo) => ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.check_box),
                          onPressed: () {},
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
