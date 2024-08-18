import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_event.dart';
import 'package:movie_app/src/movie/presentation/views/downloads_page.dart';
import 'package:movie_app/src/movie/presentation/views/favourites_page.dart';
import '../widgets/movie_home/current_movie_card.dart';
import '../widgets/movie_home/custom_text_field.dart';
import '../widgets/movie_home/tag.dart';
import '../widgets/movie_home/movie_card.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';

import 'movie_detail_page.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(const GetMoviesEvent());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Switch to the selected page
  }

  void _navigateToMovieDetail(Movie movie) {
    print('Navigating to movie detail for: ${movie.title}');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(
          movie: movie,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
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
                      "assets/raya.jpg",
                    ),
                  ),
                ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor:
                  _selectedIndex == 0 ? Colors.black : Colors.white,
              radius: 30,
              child: Icon(
                Icons.home_rounded,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor:
                  _selectedIndex == 1 ? Colors.black : Colors.white,
              radius: 30,
              child: Icon(
                Icons.favorite_border_rounded,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor:
                  _selectedIndex == 2 ? Colors.black : Colors.white,
              radius: 30,
              child: Icon(
                Icons.cloud_download,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
            label: "Downloads",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor:
                  _selectedIndex == 3 ? Colors.black : Colors.white,
              radius: 30,
              child: Icon(
                Icons.shopping_cart,
                color: _selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // Home Page
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                print("state");
                print(state.movies);
                final List<Movie> movies = state.movies;
                final Movie? currentMovie =
                    movies.isNotEmpty ? movies.first : null;

                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextField(labelText: "Search"),
                          const SizedBox(height: 20),
                          const Tag(),
                          const SizedBox(height: 10),
                          if (currentMovie != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentMovie.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                CurrentMovieCard(
                                  imageUrl: currentMovie.primaryImage.imageUrl,
                                ),
                              ],
                            ),
                          const SizedBox(height: 24),
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
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (BuildContext context, int index) {
                                final movie = movies[index];
                                return MovieCard(
                                    movie: movie,
                                    onTap: () => _navigateToMovieDetail(movie));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is MovieError) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text('No data'));
              }
            },
          ),
          // Favourites Page
          const FavouritesPage(),
          // Downloads Page
          const Center(child: DownloadsPage()),
          // Profile Page
          const Center(child: Text('Profile Page')),
        ],
      ),
    );
  }
}
