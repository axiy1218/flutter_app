import 'package:flutter/material.dart';
import 'package:flutter_app/lesson8/detail_page.dart';

class RailView extends StatefulWidget {
  const RailView({super.key});

  @override
  State<RailView> createState() => _RailViewState();
}

class _RailViewState extends State<RailView> {
  int _selectedIndex = 0;
  late final PageController _pageController;
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
          //* Navigation Rail
          NavigationRail(
              onDestinationSelected: (newIndex) {
                _selectedIndex = newIndex;
                _pageController.animateToPage(newIndex,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn);
                setState(() {});
              },
              leading: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/image/monkey.jpeg'),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune,
                        color: Color(0xFFD5C1A3),
                      ))
                ],
              ),
              groupAlignment: 1.0,
              backgroundColor: const Color(0xFF2D2E35),
              labelType: NavigationRailLabelType.none,
              destinations: const [
                NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    icon: _CustomRailDestination(
                      title: 'Popular',
                      isSelected: false,
                    ),
                    selectedIcon: _CustomRailDestination(
                      title: 'Popular',
                      isSelected: true,
                    ),
                    label: Text(
                      'icon',
                    )),
                NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    icon: _CustomRailDestination(
                      title: 'Favourite',
                      isSelected: false,
                    ),
                    selectedIcon: _CustomRailDestination(
                      title: 'Favourite',
                      isSelected: true,
                    ),
                    label: Text('icon')),
                NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    icon: _CustomRailDestination(
                      title: 'Inspiration',
                      isSelected: false,
                    ),
                    selectedIcon: _CustomRailDestination(
                      title: 'Inspiration',
                      isSelected: true,
                    ),
                    label: Text('icon')),
                NavigationRailDestination(
                    icon: _CustomRailDestination(
                      title: 'All',
                      isSelected: false,
                    ),
                    selectedIcon: _CustomRailDestination(
                      title: 'All',
                      isSelected: true,
                    ),
                    label: Text('icon')),
              ],
              selectedIndex: _selectedIndex),
          //& body
          Expanded(
              child: Scaffold(
                  backgroundColor: const Color(0xFF282B2E),
                  appBar: AppBar(
                    backgroundColor: const Color(0xFF282B2E),
                    elevation: .0,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Color(0xFFD5C1A3),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Color(0xFFD5C1A3),
                        ),
                      ),
                    ],
                  ),
                  body: PageView(
                    controller: _pageController,
                    onPageChanged: (newIndex) {
                      _selectedIndex = newIndex;
                      setState(() {});
                    },
                    children: const [
                      DetailPage(title: 'Popular'),
                      DetailPage(title: 'Favourite'),
                      DetailPage(title: 'Inspiration'),
                      DetailPage(title: 'All')
                    ],
                  )))
        ],
      ),
    );
  }
}

class _CustomRailDestination extends StatelessWidget {
  final String title;
  final bool isSelected;
  const _CustomRailDestination({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: FittedBox(
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? const Color(0xFFD5C1A3) : Colors.white,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 18),
        ),
      ),
    );
  }
}
