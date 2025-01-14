import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/movie.dart';
import '../service/service.dart';
import '../service/movies_endpoint.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieService movieService;

  MovieCubit(this.movieService) : super(MovieInitial());

  // Method to fetch popular movies
  Future<void> fetchPopularMovies() async {
    try {
      emit(MovieInitial()); // Emit initial state to indicate loading
      final movie = await movieService.fetchMovies(MoviesEndpoint.popular);
      emit(MovieLoaded(movie)); // Emit MovieLoaded state when data is fetched
    } catch (e) {
      emit(MovieError(e.toString())); // Emit MovieError state on failure
    }
  }
}
