import 'package:flutter/material.dart';

class CustomTextFieldView extends StatefulWidget {
  const CustomTextFieldView({super.key});

  @override
  State<CustomTextFieldView> createState() => _CustomTextFieldViewState();
}

class _CustomTextFieldViewState extends State<CustomTextFieldView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom TextField'),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: TextField(
          decoration: InputDecoration(
              // helperText: 'Email',
              // label: Text('Input email'),
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.search),
              prefixIcon: const Icon(Icons.mobile_friendly),
              hintText: 'Email or Phone'),
        ),
      ),
    );
  }
}
