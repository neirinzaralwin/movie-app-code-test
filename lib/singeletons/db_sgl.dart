import 'package:flutter_movie_code_test/database/movies/popular_movies_operations.dart';
import 'package:sqflite/sqflite.dart';

class DbSingeleton {
  static PopularMoviesOperations? _popularMoviesOperations;
  static Database? db;

  static PopularMoviesOperations get popularMovies {
    _popularMoviesOperations ??= PopularMoviesOperations(db: db!);
    return _popularMoviesOperations!;
  }
}
