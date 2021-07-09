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
              return Center(child: Text("todo 完了"));
            },
          ),
        ),
      ),
    );
  }
}
