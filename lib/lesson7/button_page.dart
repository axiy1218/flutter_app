import 'package:flutter/material.dart';

class ButtonView extends StatefulWidget {
  const ButtonView({super.key});

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Buttons'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.red, Colors.yellow, Colors.green])
                        .createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            elevation: 10,
                            shadowColor: Colors.black,
                            side:
                                const BorderSide(width: 5, color: Colors.blue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
                        child: const Text('Elevated button')),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
