import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/movie/presentation/widgets/movie_home/current_movie_card.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 5),
      children: const [
        Text('Downloads', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 30),),
        CurrentMovieCard(imageUrl: 'https://ultramookie.com/images/2021/raya-and-the-last-dragon.jpg'),
        CurrentMovieCard(imageUrl: 'https://ultramookie.com/images/2021/raya-and-the-last-dragon.jpg'),
        CurrentMovieCard(imageUrl: 'https://ultramookie.com/images/2021/raya-and-the-last-dragon.jpg'),
        CurrentMovieCard(imageUrl: 'https://ultramookie.com/images/2021/raya-and-the-last-dragon.jpg'),
        CurrentMovieCard(imageUrl: 'https://ultramookie.com/images/2021/raya-and-the-last-dragon.jpg'),
        CurrentMovieCard(imageUrl: 'https://ultramookie.com/images/2021/raya-and-the-last-dragon.jpg'),
      ],
    );
  }
}
