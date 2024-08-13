import 'package:flutter/material.dart';
import '../widgets/movie_home/current_movie_card.dart';
import '../widgets/movie_home/custom_text_field.dart';
import '../widgets/movie_home/tag.dart';

import '../widgets/movie_home/movie_card.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hi Ruth.W",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 126, 124, 124),
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(
                "assets/rayaandthelastdragon.jpg",
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 30,
              child: Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                color: Colors.grey,
                Icons.favorite_border_rounded,
              ),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                color: Colors.grey,
                Icons.cloud_download,
              ),
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  color: Colors.grey,
                  Icons.shopping_cart,
                )),
            label: "Profile",
          ),
        ],
      ),
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextField(),
                const SizedBox(
                  height: 20,
                ),
                const Tag(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Raya and the Last Dragon",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const CurrentMovieCard(),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "New Movies",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.orange,
                          size: 30,
                          shadows: [
                            Shadow(
                              color: Colors.yellow,
                              blurRadius: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "See All >",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext builder, int index) {
                      return const MovieCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        ]
      ),
    );
  }
}
