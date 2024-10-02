import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:sqflite/sqflite.dart';

class PopularMoviesOperations {
  final Database db;

  PopularMoviesOperations({required this.db});

  Future<void> createTables() async {
    await db.transaction((txn) async {
      await txn.execute(_createPopularMoviesTableQuery());
      await txn.execute(_createPaginatedMoviesTableQuery());
    });
  }

  String _createPopularMoviesTableQuery() => '''
    CREATE TABLE IF NOT EXISTS popular_movies (
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

  String _createPaginatedMoviesTableQuery() => '''
    CREATE TABLE IF NOT EXISTS paginated_popular_movies (
        id INTEGER PRIMARY KEY,
        page INTEGER,
        total_pages INTEGER,
        total_popular_movie_results INTEGER
    );
  ''';

  Future<Map<String, dynamic>> getPaginatedPopularMovies() async {
    final result = await db.query('paginated_popular_movies');
    return result.isNotEmpty ? result.first : {};
  }

  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    return await db.query('popular_movies');
  }

  Future<void> insertOrReplaceMovies(PopularMovies model) async {
    await db.transaction((txn) async {
      final batch = txn.batch();

      _batchInsertPopularMovies(batch, model.results ?? []);

      _batchInsertPaginatedMovies(batch, model);

      await batch.commit(noResult: true);
    });
  }

  Future<void> _batchInsertPopularMovies(Batch batch, List<PopularMovieResult> movies) async {
    // final saveService = SaveImageService();

    for (var movie in movies) {
      // final savedPosterPath = await saveService.saveToDir(movie.posterPath ?? '');
      // final savedBackdropPath = await saveService.saveToDir(movie.backdropPath ?? '');

      batch.insert(
        'popular_movies',
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

  // Private method to insert or replace paginated movie metadata
  void _batchInsertPaginatedMovies(Batch batch, PopularMovies model) {
    batch.insert(
      'paginated_popular_movies',
      {
        'id': 1,
        'page': model.page,
        'total_pages': model.totalPages,
        'total_popular_movie_results': model.totalPopularMovieResults,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
