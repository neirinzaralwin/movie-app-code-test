import 'package:sqflite/sqflite.dart';

class PopularMoviesOperations {
  final Database db;

  PopularMoviesOperations({required this.db});

  Future<void> createTable() async {
    await db.execute('''''');
  }

  // get Table
  Future<Map<String, dynamic>> getTable() async {
    final List<Map<String, dynamic>> result = await db.query('popular_movies');
    return result.first;
  }
}
