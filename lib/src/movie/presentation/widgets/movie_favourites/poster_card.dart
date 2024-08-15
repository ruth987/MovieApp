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
      padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
