import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../widgets/movie_detail/genre.dart';
import '../widgets/movie_detail/rating.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.transparent],
                  stops: [0.9, 50], // Adjust fade height as needed
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: SizedBox(
                height: 790,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            height: 420,
                            child: Column(children: [
                              SizedBox(
                                height: 420,
                              ),
                            ]),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white, Colors.transparent],
                                  stops: [
                                    0.8,
                                    50
                                  ], // Adjust fade height as needed
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: SizedBox(
                                height: 400,
                                width: 500,
                                child: Image.network(
                                  movie.primaryImage.imageUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 25,
                              left: 25,
                              child:Container(
                                width: 40, // Adjust the size as needed
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.3),
                                  border: Border.all(color: Colors.white, width: 3), // Customize border width
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: Colors.white,
                                    size: 24, // Adjust icon size as needed
                                  ),
                                ),
                              )
                          ),
                          Positioned(
                            width: 400,
                            height: 200,
                            top: 375,
                            left: 18,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext builder, int index) {
                                return const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Genre(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                       Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 500,
                              // height: 700,
                              child: Text(
                                movie.title ?? 'No title available',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Text(
                              "Family , Fantasy , Animation - 1hr 25min",
                              style: TextStyle(
                                color: Color.fromARGB(255, 119, 118, 118),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Rating(),
                                SizedBox(
                                  width: 20,
                                ),
                                Rating(),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. However, when sinister monsters known as the Druun threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, those same monsters have returned, and it's up to a lone warrior to track down the last dragon and stop the Druun for good.",
                              style: TextStyle(
                                color: Color.fromARGB(255, 140, 139, 139),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Watch Movie",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
