import 'package:flutter_movie_code_test/constants/app_const.dart';
import 'package:flutter_movie_code_test/singeletons/db_sgl.dart';
import 'package:flutter_movie_code_test/singeletons/repo_sgl.dart';
import 'db_config.dart';
import 'dio_config.dart';

Future<void> appConfig({required bool isProduction}) async {
  final dioConfig = DioConfig(baseUrl: AppConst.baseUrl, token: AppConst.accessToken);
  final db = await DbConfig().database;
  RepoSingeleton.dio = dioConfig.dio;
  DbSingeleton.db = db;
}
