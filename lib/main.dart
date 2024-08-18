import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/Auth/presentation/views/sign_in_page.dart';
import 'package:movie_app/src/Auth/presentation/views/splash_page.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/src/movie/presentation/views/movie_home_page.dart';
import 'package:movie_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => di.sl<MovieBloc>(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Scaffold(
              body: SplashPage(),
            )
            // const MyHomePage(title: 'Flutter Demo Home Page'),
            ));
  }
}

Future<void> testApi() async {
  const apiKey = '43893186eamshf2cd3663e497950p127425jsn095550fdfbe4';
  const apiHost = 'imdb188.p.rapidapi.com';
  final url = Uri.parse('https://imdb188.p.rapidapi.com/api/v1/getWeekTop10');

  try {
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'x-rapidapi-ua': 'RapidAPI-Playground',
        'x-rapidapi-key': apiKey,
        'x-rapidapi-host': apiHost,
      },
    );
    print(response);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      // Optionally parse and print the JSON response
      final data = jsonDecode(response.body);
      print("Parsed data: $data");
    } else {
      print("Failed to load data");
    }
  } catch (e) {
    print("Error: $e");
  }
}
