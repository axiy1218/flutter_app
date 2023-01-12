import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/other_page.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ImagePicker? _imagePicker;
  File? _imageFile;

  @override
  void initState() {
    _imagePicker = ImagePicker();
    super.initState();
  }

  void getImage() async {
    try {
      XFile? image = await _imagePicker!.pickImage(source: ImageSource.gallery);
      _imageFile = File(image!.path);
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _imageFile == null
              ? IconButton(
                  onPressed: () {
                    Future.microtask(() => getImage());
                  },
                  icon: Icon(Icons.add))
              : Image.file(_imageFile!),
        ),
      ),
    );
  }
}
