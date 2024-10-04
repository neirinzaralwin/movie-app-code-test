import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:sqflite/sqflite.dart';

class UpcomingMoviesOperations {
  final Database db;

  UpcomingMoviesOperations({required this.db});

  Future<void> createTables() async {
    await db.transaction((txn) async {
      await txn.execute(_createUpcomingMoviesTableQuery());
    });
  }

  String _createUpcomingMoviesTableQuery() => '''
    CREATE TABLE IF NOT EXISTS upcoming_movies (
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

  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    return await db.query('upcoming_movies');
  }

  Future<void> insertOrReplaceMovies(PopularMovies model) async {
    await db.transaction((txn) async {
      final batch = txn.batch();
      _batchInsertUpcomingMovies(batch, model.results ?? []);
      await batch.commit(noResult: true);
    });
  }

  Future<void> _batchInsertUpcomingMovies(Batch batch, List<PopularMovieResult> movies) async {
    for (var movie in movies) {
      batch.insert(
        'upcoming_movies',
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
  }

  Future<void> deleteAllUpcomingMovies() async {
    await db.delete('upcoming_movies');
  }
}
