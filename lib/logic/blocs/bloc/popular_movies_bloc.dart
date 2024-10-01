import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_code_test/data/models/popular_movies/popular_movies.dart';
import 'package:flutter_movie_code_test/data/repositories/movie/movie_repository.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(PopularMoviesInitial()) {
    final movieRepo = MovieRepository();

    on<PopularMoviesEvent>((event, emit) async {
      if (event is GetPopularMovies) {
        emit(PopularMoviesLoading());
        try {
          final model = await movieRepo.getPopularMovies();
          emit(PopularMoviesLoaded(model: model));
        } catch (e) {
          emit(PopularMoviesError(message: "error in fectching popular movies : $e"));
        }
      }
    });
  }
}
