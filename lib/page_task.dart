import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageExample extends StatefulWidget {
  const PageExample({super.key});

  @override
  State<PageExample> createState() => _PageExampleState();
}

class _PageExampleState extends State<PageExample> {
  late final String? data;
  int _currentIndex = 0;
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Map<String, dynamic> map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (map.containsKey('text') && map['text'] != null) {
      data = map['text'];
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data ?? 'AppBar2'),
      ),
      body: PageView.custom(
        scrollDirection: Axis.horizontal,
        childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => ColoredBox(color: colorList[index]),
            childCount: colorList.length),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (newIndex) {
          _currentIndex = newIndex;
          setState(() {});
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(
              icon: Icon(Icons.notification_add), label: 'notification'),
          NavigationDestination(
              icon: Icon(Icons.notification_add), label: 'notification'),
        ],
      ),
    );
  }
}
