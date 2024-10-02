part of 'popular_movies_bloc.dart';

sealed class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovies extends PopularMoviesEvent {
  final int? page;

  const GetPopularMovies({this.page = 1});

  @override
  List<Object> get props => [page!];
}
