import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/movie/presentation/widgets/movie_favourites/scrollable_posters.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollablePosters();
  }
}
