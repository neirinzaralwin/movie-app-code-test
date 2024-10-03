import 'package:dio/dio.dart';
import 'package:flutter_movie_code_test/constants/api_const.dart';
import 'package:retrofit/retrofit.dart';
part 'remote_movie_datasource.g.dart';

@RestApi()
abstract class RemoteMovieDatasource {
  factory RemoteMovieDatasource(Dio dio, {String? baseUrl}) = _RemoteMovieDatasource;

  @GET(ApiConst.getPopularMovies)
  Future<dynamic> getPopularMovies();

  @GET(ApiConst.getUpcommingMovies)
  Future<dynamic> getUpcomingMovies();
}
