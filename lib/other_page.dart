import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyOtherWidget extends StatelessWidget {
  const MyOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('2 BUILD');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Other Page'),
      ),
    );
  }
}
