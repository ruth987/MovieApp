import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  const Genre({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 80,
      height: 35,
      decoration: BoxDecoration(
        color:  Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text("FREE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}