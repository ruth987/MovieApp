import 'package:flutter/material.dart';
import 'package:movie_app/src/movie/presentation/widgets/movie_detail/genre.dart';
import 'package:movie_app/src/movie/presentation/widgets/movie_home/movie_tag.dart';

class CurrentMovieCard extends StatelessWidget {
  const CurrentMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: double.infinity,
        height: 250,
        child: Card(
          elevation: 20,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Image.asset(
            "assets/raya.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
      Opacity(
        opacity: 0.5,
        child: Container(
          color: Colors.transparent, // Make the container transparent
          child: const Center(
            child: Icon(
              Icons.play_circle_rounded,
              size: 80,
              color: Colors.white, // Adjust icon color as needed
            ),
          ),
        ),
      ),
      const Positioned(
        bottom: 20,
        left: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MovieTag(),
            const SizedBox(width: 10),
            MovieTag(),
          ],
        ),
      ),
    ]);
  }
}
