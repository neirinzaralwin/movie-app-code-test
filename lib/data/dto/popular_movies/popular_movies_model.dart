import 'dart:convert';

import 'package:flutter_movie_code_test/constants/api_const.dart';

PopularMovies popularMoviesFromJson(String str) => PopularMovies.fromJson(json.decode(str));

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

  factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<PopularMovieResult>.from(
                json["results"]!.map((x) => PopularMovieResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalPopularMovieResults: json["total_results"],
      );

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
  final String? posterPath;
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

  factory PopularMovieResult.fromJson(Map<String, dynamic> json) => PopularMovieResult(
        adult: json["adult"] == true ? 1 : 0,
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath:
            json["poster_path"] != null ? '${ApiConst.imagePath}${json["poster_path"]}' : null,
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"] == true ? 1 : 0,
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

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
