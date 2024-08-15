import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieTag extends StatelessWidget {
  const MovieTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.7,
        child: Chip(
          label: const Text(
            'FREE',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Adjust the radius to make it more rounded
          ),
        ));
  }
}
