import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:sqflite/sqflite.dart';

class PopularMoviesOperations {
  final Database db;

  PopularMoviesOperations({required this.db});

  Future<void> createTable() async {
    const createTableQuery = '''
    CREATE TABLE popular_movies (
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
    await db.execute(createTableQuery);
    const createPaginatedTable = '''
    CREATE TABLE paginated_popular_movies (
        id INTEGER PRIMARY KEY,
        page INTEGER,
        total_pages INTEGER,
        total_popular_movie_results INTEGER
      );
    ''';
    await db.execute(createPaginatedTable);
  }

  // get paginated popular movies
  Future<Map<String, dynamic>> getPaginatedPopularMovies() async {
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM paginated_popular_movies');
    return result.isNotEmpty ? result.first : {};
  }

  Future<List<Map<String, dynamic>>> getPopularMovieTable() async {
    return await db.rawQuery('SELECT * FROM popular_movies');
  }

  Future<void> insertOrReplace(PopularMovies model) async {
    final List<PopularMovieResult> dataList = model.results!;

    final batch = db.batch();
    for (var e in dataList) {
      batch.rawInsert('''
      INSERT OR REPLACE INTO popular_movies (
        id,
        title,
        overview,
        poster_path,
        backdrop_path,
        release_date,
        vote_average,
        vote_count,
        popularity,
        original_language,
        adult,
        video
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        e.id,
        e.title,
        e.overview,
        e.posterPath,
        e.backdropPath,
        e.releaseDate,
        e.voteAverage,
        e.voteCount,
        e.popularity,
        e.originalLanguage,
        e.adult,
        e.video,
      ]);
    }

    batch.rawInsert('''
    INSERT OR REPLACE INTO paginated_popular_movies (
      id,
      page,
      total_pages,
      total_popular_movie_results
    ) VALUES (?, ?, ?, ?)
    ''', [
      1,
      model.page,
      model.totalPages,
      model.totalPopularMovieResults,
    ]);

    await batch.commit(noResult: true);
  }
}
