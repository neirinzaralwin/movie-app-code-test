import 'dart:convert';

import 'package:flutter_movie_code_test/constants/api_const.dart';
import 'package:flutter_movie_code_test/services/save_image_service.dart';

Future<PopularMovies> popularMoviesFromJson(String str) async =>
    await PopularMovies.fromJsonAsync(json.decode(str));

String popularMoviesToJson(PopularMovies data) => json.encode(data.toJson());

class PopularMovies {
  final int? page;
  final List<PopularMovieResult>? results;
  final int? totalPages;
  final int? totalPopularMovieResults;

  PopularMovies({
    this.page,
    this.results,
    this.totalPages,
    this.totalPopularMovieResults,
  });

  static Future<PopularMovies> fromJsonAsync(Map<String, dynamic> json) async {
    List<PopularMovieResult> results = [];
    if (json["results"] != null) {
      results = await Future.wait(
        json["results"]!
            .map<Future<PopularMovieResult>>((x) => PopularMovieResult.fromJsonAsync(x)),
      );
    }

    return PopularMovies(
      page: json["page"],
      results: results,
      totalPages: json["total_pages"],
      totalPopularMovieResults: json["total_results"],
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalPopularMovieResults,
      };
}

class PopularMovieResult {
  final int? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  String? posterPath;
  final String? releaseDate;
  final String? title;
  final int? video;
  final double? voteAverage;
  final int? voteCount;

  PopularMovieResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  static Future<PopularMovieResult> fromJsonAsync(Map<String, dynamic> json) async {
    String? posterPath;
    final service = SaveImageService();

    if (json["poster_path"] != null) {
      posterPath =
          await service.saveToDir('${ApiConst.imagePath}${json["poster_path"]}', "popular_movies");
    }

    return PopularMovieResult(
      adult: json["adult"] == true ? 1 : 0,
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: posterPath,
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"] == true ? 1 : 0,
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
    );
  }

  factory PopularMovieResult.fromJson(Map<String, dynamic> json) {
    return PopularMovieResult(
      adult: json["adult"] == true ? 1 : 0,
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"] == true ? 1 : 0,
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
