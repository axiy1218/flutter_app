import 'package:flutter/material.dart';
import 'package:flutter_app/lesson10/intro_second_page.dart';
import 'package:flutter_app/lesson10/lesson_page.dart';
import 'package:flutter_app/lesson8/slivers/slivers_page.dart';

/*
Created by Axmadjon Isaqov on 15:38:20 24.01.2023
© 2023 @axi_dev 
*/
/*
!Theme:::Widgets basics
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroSecondPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  initState() {
    _tabController = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(milliseconds: 600));
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.abc),
            text: 'Abc',
          ),
          Tab(
            icon: Icon(Icons.book_online),
            text: 'Home',
          ),
        ]),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            ColoredBox(
              color: Colors.blue,
              child: Center(
                  child: Text(
                'Home \u{1f600}',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
            ),
            ColoredBox(color: Colors.red),
            ColoredBox(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
