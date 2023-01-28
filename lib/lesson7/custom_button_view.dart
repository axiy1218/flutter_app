import 'package:flutter/material.dart';

class CustomButtonView extends StatefulWidget {
  const CustomButtonView({super.key});

  @override
  State<CustomButtonView> createState() => _CustomButtonViewState();
}

class _CustomButtonViewState extends State<CustomButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Button'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //&Gesture Detector
              GestureDetector(
                onHorizontalDragUpdate: (details) {
                  debugPrint(details.delta.dx.toString());
                  setState(() {});
                },
                onVerticalDragUpdate: (details) {
                  debugPrint(details.delta.dy.toString());
                  setState(() {});
                },
                child: const Text(
                  'Press Button',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                onTap: () {
                  debugPrint('Button PRESSEDDDDD');
                },
              ),

              //& InkWell
              InkWell(
                child: const Text(
                  'Press Inked Button',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                onTap: () {
                  debugPrint(
                    'Button Inked PRESSEDDDDD',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
