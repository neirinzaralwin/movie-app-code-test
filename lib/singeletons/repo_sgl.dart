import 'package:dio/dio.dart';
import 'package:flutter_movie_code_test/data/remote_datasource/movie/remote_movie_datasource.dart';

class RepoSingeleton {
  static RemoteMovieDatasource? _movieDatasource;
  static Dio? dio;
  static RemoteMovieDatasource get movie {
    _movieDatasource ??= RemoteMovieDatasource(dio ?? Dio());
    return _movieDatasource!;
  }
}
