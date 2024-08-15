import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_event.dart';
import 'package:movie_app/src/movie/presentation/widgets/movie_favourites/poster_card.dart';

class ScrollablePosters extends StatefulWidget {
  const ScrollablePosters({super.key});

  @override
  _ScrollablePostersState createState() => _ScrollablePostersState();
}

class _ScrollablePostersState extends State<ScrollablePosters> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieBloc>(context).add(const GetFavouritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is GettingFavourites) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavouritesLoaded) {
          print('Favourites data: ${state.favourites}');
          final movies = state.favourites;
          if (movies.isEmpty) {
            return Center(child: Text('No favourites found.'));
          }

          final currentMovie = movies[_currentIndex];

          return Stack(
            children: [
              // Blurred background
              Positioned.fill(
                bottom: 550,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    key: ValueKey<int>(_currentIndex),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(currentMovie.primaryImage.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              // Carousel slider
              Positioned(
                bottom: 320,
                left: 0,
                right: 0,
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: movies.length,
                  itemBuilder: (context, index, realIndex) {
                    final movie = movies[index];
                    bool isFocused = _currentIndex == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: isFocused ? 0 : 3),
                      width: isFocused ? 900 : 900,
                      height: isFocused ? 400 : 150,
                      transform: Matrix4.translationValues(
                        0,
                        isFocused ? -30 : 0,
                        0,
                      )..scale(isFocused ? 1.08 : 0.9),
                      child: PosterCard(
                        imagePath: movie.primaryImage.imageUrl,
                        width: isFocused ? 900 : 900,
                        height: isFocused ? 600 : 150,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400,
                    viewportFraction: 0.6,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentMovie.title,
                        style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '1hr 35min • ',
                                  style: TextStyle(color: Colors.black54, fontSize: 16),
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2),
                                    child: Icon(Icons.star, color: Colors.yellow, size: 20),
                                  ),
                                ),
                                TextSpan(
                                  text: '${currentMovie.rating} ',
                                  style: TextStyle(color: Colors.black54, fontSize: 16),
                                ),
                                TextSpan(
                                  text: '/10',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Wrap(
                        spacing: 8,
                        children: ["hap", "ap"].map<Widget>((genre) {
                          return Chip(
                            label: Text(genre, style: const TextStyle(color: Colors.black)),
                            backgroundColor: Colors.white70,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30, // Adjust icon size here
                        ),
                        label: const Text(
                          'Watch Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18, // Adjust font size here
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Adjust padding here
                          minimumSize: const Size(200, 60), // Adjust minimum size here
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is MovieError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No favourites found.'));
        }
      },
    );
  }
}
