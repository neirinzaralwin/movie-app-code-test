import 'package:flutter_movie_code_test/database/movies/popular_movies_operations.dart';
import 'package:flutter_movie_code_test/database/movies/upcoming_movies_operations.dart';
import 'package:flutter_movie_code_test/database/wishlists/wishlist_movies_operations.dart';
import 'package:sqflite/sqflite.dart';

class DbSingeleton {
  static PopularMoviesOperations? _popularMoviesOperations;
  static WishlistMoviesOperations? _wishlistMoviesOperations;
  static Database? db;

  static PopularMoviesOperations get popularMovies {
    _popularMoviesOperations ??= PopularMoviesOperations(db: db!);
    return _popularMoviesOperations!;
  }

  static UpcomingMoviesOperations get upcomingMovies {
    return UpcomingMoviesOperations(db: db!);
  }

  static WishlistMoviesOperations get wishlistMovies {
    _wishlistMoviesOperations ??= WishlistMoviesOperations(db: db!);
    return _wishlistMoviesOperations!;
  }
}
