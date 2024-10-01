part of 'popular_movies_bloc.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesLoaded extends PopularMoviesState {
  final PopularMovies model;

  const PopularMoviesLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

final class PopularMoviesError extends PopularMoviesState {
  final String? message;

  const PopularMoviesError({this.message = "something wrong"});

  @override
  List<Object> get props => [message!];
}
