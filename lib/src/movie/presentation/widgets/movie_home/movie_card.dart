import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 150,
      height: 160,
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            // Ensure the image covers the entire card
            Positioned.fill(
              child: Image.asset(
                "assets/raya.jpg",
                fit: BoxFit.cover,
              ),
            ),
            // Positioned text
            const Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wonder Women",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black54, // Optional background for better readability
                    ),
                  ),
                  Text(
                    "1984",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      backgroundColor: Colors.black54, // Optional background for better readability
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
