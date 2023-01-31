/*
Created by Axmadjon Isaqov on 15:03:23 31.01.2023
© 2023 @axi_dev 
*/
/*
!Theme:::Navigation Rail and Slivers
*/

import 'package:flutter/material.dart';

class RailPage extends StatefulWidget {
  const RailPage({super.key});

  @override
  State<RailPage> createState() => _RailPageState();
}

class _RailPageState extends State<RailPage> {
  late final PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              backgroundColor: Colors.green,
              onDestinationSelected: (newIndex) {
                _currentIndex = newIndex;
                _pageController.animateToPage(newIndex,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn);
                setState(() {});
              },
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('abc')),
                NavigationRailDestination(
                    icon: Icon(Icons.alarm), label: Text('abc')),
                NavigationRailDestination(
                    icon: Icon(Icons.bookmark), label: Text('abc')),
              ],
              selectedIndex: _currentIndex),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (newIndex) {
              _currentIndex = newIndex;
              setState(() {});
            },
            scrollDirection: Axis.vertical,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.grey,
              ),
              Container(
                color: Colors.yellow,
              )
            ],
          ))
        ],
      ),
    );
  }
}
