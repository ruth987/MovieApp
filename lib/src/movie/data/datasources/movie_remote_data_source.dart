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
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  final String apiKey;

  MovieRemoteDataSourceImpl({
    required this.client,
    required this.apiKey,
  });

  @override
  Future<List<MovieModel>> getMovies() async {
    final url = Uri.parse('$KBaseUrl/discover/movie?api_key=$apiKey');
    final response = await _getRequest(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List moviesJson = body['results'];
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
}
