import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroSecondPage extends StatefulWidget {
  const IntroSecondPage({super.key});

  @override
  State<IntroSecondPage> createState() => _IntroSecondPageState();
}

class _IntroSecondPageState extends State<IntroSecondPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (newIndex) {
              _currentIndex = newIndex;
              setState(() {});
            },
            children: const [
              _FirstPage(),
              _FirstPage(),
              _FirstPage(),
              _FirstPage(),
            ],
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 42.5,
              bottom: 200,
              child: SizedBox(
                height: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _InticatorWidget(isSelected: _currentIndex == 0),
                    const SizedBox(
                      width: 8,
                    ),
                    _InticatorWidget(isSelected: _currentIndex == 1),
                    const SizedBox(
                      width: 8,
                    ),
                    _InticatorWidget(isSelected: _currentIndex == 2),
                    const SizedBox(
                      width: 8,
                    ),
                    _InticatorWidget(isSelected: _currentIndex == 3),
                  ],
                ),
              )),
          _currentIndex == 3
              ? const SizedBox.shrink()
              : Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 40,
                  bottom: 150,
                  child: SizedBox(
                    height: 40,
                    width: 80,
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        _pageController.jumpToPage(3);
                      },
                      child: const Text('skip'),
                    ),
                  ),
                )
        ],
      )),
    );
  }
}

class _InticatorWidget extends StatelessWidget {
  final bool isSelected;
  const _InticatorWidget({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      height: 12,
      width: isSelected ? 25 : 12,
      decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(6)),
    );
  }
}

class _FirstPage extends StatelessWidget {
  const _FirstPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/png/placeholder.png',
          width: 216,
          height: 133,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          'Turpis amet tellus',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 21,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Hemos identificado que existe una invitación de su empresa. Completa tu registro para desbloquear tus horas libres!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
