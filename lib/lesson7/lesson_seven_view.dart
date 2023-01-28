import 'package:flutter/material.dart';

/*
Created by Axmadjon Isaqov on 16:25:55 28.01.2023
© 2023 @axi_dev 
*/
/*
!Theme:::Widgets Advanced
*/
class LessonSevenView extends StatefulWidget {
  const LessonSevenView({super.key});

  @override
  State<LessonSevenView> createState() => _LessonSevenViewState();
}

class _LessonSevenViewState extends State<LessonSevenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 7'),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage('assets/image/image.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ])),
          ),
        ),
      ),
    );
  }
}
