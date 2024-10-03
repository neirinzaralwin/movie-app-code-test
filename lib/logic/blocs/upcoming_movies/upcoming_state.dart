part of 'upcoming_bloc.dart';

sealed class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingMovLoading extends UpcomingState {}

final class UpcomingLoaded extends UpcomingState {
  final List<PopularMovieResult> movies;

  const UpcomingLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class UpcomingError extends UpcomingState {
  final String message;

  const UpcomingError(this.message);

  @override
  List<Object> get props => [message];
}
