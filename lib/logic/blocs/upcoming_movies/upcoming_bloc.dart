import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/data/repositories/movie/movie_repository.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingInitial()) {
    on<UpcomingEvent>((event, emit) async {
      if (event is GetUpcomingMovies) {
        emit(UpcomingMovLoading());
        try {
          final result = await MovieRepository().getUpcomingMovies();
          debugPrint("list of upcomming movies: $result");
          emit(UpcomingLoaded(result));
        } catch (e) {
          emit(UpcomingError(e.toString()));
        }
      }
    });
  }
}
