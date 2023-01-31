import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: _CustomImageWidget(
                image: 'assets/image/pixel.jpg',
              )),
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: _CustomImageWidget(
                image: 'assets/image/home.jpg',
              )),
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: _CustomImageWidget(
                image: 'assets/image/pexel3.jpg',
              )),
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: _CustomImageWidget(
                image: 'assets/image/pixel1.jpg',
              )),
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: _CustomImageWidget(
                image: 'assets/image/pexel4.jpg',
              )),
        ],
      ),
    ));
  }
}

//& custom image widget
class _CustomImageWidget extends StatelessWidget {
  final String image;
  const _CustomImageWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          image,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          cacheHeight: 200,
          cacheWidth: 300,
        ),
      ),
    );
  }
}
