import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/complete_view/complete_view.dart';
import 'package:todo_list/presentation/register_todo/register_todo.dart';
import 'package:todo_list/presentation/todo_view/todo_view.dart';

import 'main_model.dart';

void main() async {
  // main()の中で非同期処理を行う際には、下記を実行しなければいけないらしい
  WidgetsFlutterBinding.ensureInitialized();
  // iOS,androidともに縦向き固定
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainModel()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  static List<Widget> _pageList = [RegisterTodo(), TodoView(), CompleteView()];

  @override
  Widget build(BuildContext context) {
    final bottomNavBar = Provider.of<MainModel>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavBar.currentTabIndex,
            onTap: (int index) {
              bottomNavBar.currentTabIndex = index;
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.add_task),
                label: "登録",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.computer),
                label: "タスク",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_box),
                label: "完了済み",
              ),
            ],
          ),
          body: _pageList[bottomNavBar.currentTabIndex],
        ),
      ),
    );
  }
}
