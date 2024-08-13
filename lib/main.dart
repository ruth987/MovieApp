import 'package:flutter/material.dart';
import 'package:movie_app/src/movie/presentation/views/movie_detail_page.dart';
import 'package:movie_app/src/movie/presentation/views/movie_home_page.dart';
import 'package:movie_app/src/movie/presentation/widgets/movie_favourites/scrollable_posters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: MovieDetailPage(),
      )


      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
