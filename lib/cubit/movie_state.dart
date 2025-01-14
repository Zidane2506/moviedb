part of 'movie_cubit.dart';

@immutable
sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

// MovieInitial: when the app first starts or before loading data
final class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

// MovieLoaded: when movie data has been successfully fetched
final class MovieLoaded extends MovieState {
  final Movie movie;

  MovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

// MovieError: when there is an error loading the data
final class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object> get props => [message];
}
