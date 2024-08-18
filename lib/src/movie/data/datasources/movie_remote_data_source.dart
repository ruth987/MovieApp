import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/src/movie/data/models/movie_model.dart';
import 'package:movie_app/src/movie/data/models/video_model.dart';

import '../../../../core/util/constants.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();

  Future<MovieModel> getMovieDetails(int id);

  Future<List<VideoModel>> getMovieVideos(int id);

  Future<List<MovieModel>> getFanFavorites();


}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({
    required this.client,});

  static const apiKey = '43893186eamshf2cd3663e497950p127425jsn095550fdfbe4';
  static const apiHost = 'imdb188.p.rapidapi.com';

  @override
  Future<List<MovieModel>> getMovies() async {
    print("request made");
    final url = Uri.parse('https://imdb188.p.rapidapi.com/api/v1/getWeekTop10');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'x-rapidapi-ua': 'RapidAPI-Playground',
        'x-rapidapi-key': apiKey,
        'x-rapidapi-host': apiHost,
      },
    );

    print("response");
    print(response);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List moviesJson = body['data']; // Adjust this if the actual key is different
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        message: 'Failed to load movies',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int id) async {
    final url = Uri.parse(
        '$KBaseUrl/movie/$id?api_key=$apiKey&append_to_response=videos,images');
    final response = await _getRequest(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return MovieModel.fromJson(body);
    } else {
      throw ServerException(
        message: 'Failed to load movie details',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<List<VideoModel>> getMovieVideos(int id) async {
    final url = Uri.parse('$KBaseUrl/movie/$id/videos?api_key=$apiKey');
    final response = await _getRequest(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List videosJson = body['results'];
      return videosJson.map((json) => VideoModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        message: 'Failed to load movie videos',
        statusCode: response.statusCode,
      );
    }
  }

  Future<http.Response> _getRequest(Uri url) async {
    try {
      return await client.get(url);
    } catch (e) {
      throw const ServerException(
        message: 'Network error occurred',
        statusCode: 0,
      );
    }
  }

  @override
  Future<List<MovieModel>> getFanFavorites() async {
    final url = Uri.parse(
        'https://imdb188.p.rapidapi.com/api/v1/getFanFavorites');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'x-rapidapi-ua': 'RapidAPI-Playground',
        'x-rapidapi-key': apiKey,
        'x-rapidapi-host': apiHost,
      },
    );

    print("Fan Favorites response");
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      print("Decoded body: $body");

      try {
        final data = body['data'];
        if (data != null && data is Map<String, dynamic>) {
          final list = data['list'];
          if (list != null && list is List) {
            print("Movies list: $list");
            return list.map((json) => MovieModel.fromJson(json)).toList();
          } else {
            throw Exception(
                'Unexpected structure for fan favorites: list is null or not a list');
          }
        } else {
          throw Exception(
              'Unexpected structure for fan favorites: data is null or not a map');
        }
      } catch (e) {
        throw Exception("Error processing response: $e");
      }
    } else {
      throw ServerException(
        message: 'Failed to load fan favorites',
        statusCode: response.statusCode,
      );
    }
  }
}