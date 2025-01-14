import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_db/model/movie.dart';

class MovieService {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String apiKey = 'fb26682f322c9ac9163fca07115cb02a'; // Replace with your actual API key

  // Method to fetch movies from the API based on the endpoint path (e.g. 'popular')
  Future<Movie> fetchMovies(String path) async {
    final String url = '$baseUrl/$path?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    // Check if the response is successful (status code 200)
    if (response.statusCode == 200) {
      return movieFromJson(response.body); // Parse and return Movie object
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
