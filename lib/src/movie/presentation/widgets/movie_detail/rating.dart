import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 214, 214).withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "8.5/10",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "IMDb",
          ),
        ],
      ),
    );
  }
}
