import 'package:flutter/material.dart';

/*
Created by Axmadjon Isaqov on 15:50:28 19.01.2023
© 2023 @axi_dev 
*/
/*
Theme:::Navigator 1.0
*/
void main() {
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
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? title = "salom";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: CustomText(
        title: title ?? "hello",
      ))),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (title!.toLowerCase() == 'salom') {
              title = "Flutter g4 guruh";
            } else {
              title = 'salom';
            }
            setState(() {});
          },
          label: const Text('Change title')),
    );
  }

  Widget _customText({required String title}) {
    return Text(title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600));
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600));
  }
}
