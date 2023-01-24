import 'dart:developer';

import 'package:flutter/material.dart';

class MyOtherWidget extends StatelessWidget {
  const MyOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('2 BUILD');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('Other Page'),
      ),
    );
  }
}
