part of 'upcoming_bloc.dart';

sealed class UpcomingEvent extends Equatable {
  const UpcomingEvent();

  @override
  List<Object> get props => [];
}

final class GetUpcomingMovies extends UpcomingEvent {}
