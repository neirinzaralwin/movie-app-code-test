// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovies _$PopularMoviesFromJson(Map<String, dynamic> json) =>
    PopularMovies(
      page: json['page'] as num? ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map(
                  (e) => PopularMovieResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalPages: json['total_pages'] as num? ?? 0,
      totalPopularMovieResults: json['total_results'] as num? ?? 0,
    );

PopularMovieResult _$PopularMovieResultFromJson(Map<String, dynamic> json) =>
    PopularMovieResult(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String? ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      id: (json['id'] as num?)?.toInt() ?? 0,
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: json['popularity'] as num? ?? 0,
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: json['vote_average'] as num? ?? 0,
      voteCount: json['vote_count'] as num? ?? 0,
    );
