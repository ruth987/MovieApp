import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const PosterCard({
    required this.imagePath,
    this.width = 200,
    this.height = 300,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
