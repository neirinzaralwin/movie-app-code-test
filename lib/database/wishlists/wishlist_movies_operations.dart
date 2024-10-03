import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:sqflite/sqflite.dart';

class WishlistMoviesOperations {
  final Database db;

  WishlistMoviesOperations({required this.db});

  Future<void> createTables() async {
    await db.transaction((txn) async {
      await txn.execute(_createWishlistMoviesTableQuery());
    });
  }

  String _createWishlistMoviesTableQuery() => '''
    CREATE TABLE IF NOT EXISTS wishlist_movies (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        poster_path TEXT,
        backdrop_path TEXT,
        release_date TEXT,
        vote_average REAL,
        vote_count INTEGER,
        popularity REAL,
        original_language TEXT,
        adult INTEGER,
        video INTEGER
    );
  ''';

  Future<List<Map<String, dynamic>>> getWishlistMovies() async {
    return await db.query('wishlist_movies');
  }

  Future<void> insertOrReplaceMovies(PopularMovieResult movie) async {
    await db.transaction((txn) async {
      final batch = txn.batch();
      _batchInsertWishlist(batch, movie);

      await batch.commit(noResult: true);
    });
  }

  // Private method to insert or replace paginated movie metadata
  void _batchInsertWishlist(Batch batch, PopularMovieResult movie) {
    batch.insert(
      'wishlist_movies',
      {
        'id': movie.id,
        'title': movie.title,
        'overview': movie.overview,
        'poster_path': movie.posterPath,
        'backdrop_path': movie.backdropPath,
        'release_date': movie.releaseDate,
        'vote_average': movie.voteAverage,
        'vote_count': movie.voteCount,
        'popularity': movie.popularity,
        'original_language': movie.originalLanguage,
        'adult': movie.adult,
        'video': movie.video,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteMovie(int id) async {
    // delete single movie from wishlist
    await db.delete(
      'wishlist_movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
