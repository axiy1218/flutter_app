import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedPage extends StatefulWidget {
  const SpeedPage({super.key});

  @override
  State<SpeedPage> createState() => _SpeedPageState();
}

class _SpeedPageState extends State<SpeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Page'),
      ),
      floatingActionButton: SpeedDial(
        activeBackgroundColor: Colors.blue,
        backgroundColor: Colors.red,
        icon: Icons.abc_rounded,
        overlayColor: Colors.grey,
        overlayOpacity: 0.5,
        activeIcon: Icons.mobile_friendly,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.home),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              labelWidget: const Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          SpeedDialChild(
              child: const Icon(Icons.abc),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              labelWidget: const Text(
                'Text',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          SpeedDialChild(
              child: const Icon(Icons.home),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              labelWidget: const Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
