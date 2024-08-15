import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 30,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 249, 231, 210),
      ),
      child: const Center(
        child: Text("#1 - Best Animated Movie",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 153, 29),
            fontSize: 13,
          ),
        ),
      ),

    );
  }
}