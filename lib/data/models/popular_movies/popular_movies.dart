import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies.g.dart';

@JsonSerializable(createToJson: false)
class PopularMovies extends Equatable {
  const PopularMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalPopularMovieResults,
  });

  @JsonKey(defaultValue: 0)
  final num page;
  @JsonKey(defaultValue: [])
  final List<PopularMovieResult>? results;

  @JsonKey(name: 'total_pages', defaultValue: 0)
  final num totalPages;

  @JsonKey(name: 'total_results', defaultValue: 0)
  final num totalPopularMovieResults;

  factory PopularMovies.fromJson(Map<String, dynamic> json) => _$PopularMoviesFromJson(json);

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalPopularMovieResults,
      ];
}

@JsonSerializable(createToJson: false)
class PopularMovieResult extends Equatable {
  const PopularMovieResult({
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

  final bool? adult;

  @JsonKey(name: 'backdrop_path', defaultValue: "")
  final String? backdropPath;

  @JsonKey(name: 'genre_ids', defaultValue: [])
  final List<num>? genreIds;
  @JsonKey(defaultValue: 0)
  final int? id;

  @JsonKey(name: 'original_language', defaultValue: "")
  final String? originalLanguage;

  @JsonKey(name: 'original_title', defaultValue: "")
  final String? originalTitle;
  @JsonKey(defaultValue: "")
  final String? overview;
  @JsonKey(defaultValue: 0)
  final num? popularity;

  @JsonKey(name: 'poster_path', defaultValue: "")
  final String? posterPath;

  @JsonKey(name: 'release_date', defaultValue: "")
  final String? releaseDate;
  @JsonKey(defaultValue: "")
  final String? title;
  @JsonKey(defaultValue: false)
  final bool? video;

  @JsonKey(name: 'vote_average', defaultValue: 0)
  final num? voteAverage;

  @JsonKey(name: 'vote_count', defaultValue: 0)
  final num? voteCount;

  factory PopularMovieResult.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResultFromJson(json);

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

/*
{
	"page": 1,
	"results": [
		{
			"adult": false,
			"backdrop_path": "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
			"genre_ids": [
				28,
				35,
				878
			],
			"id": 533535,
			"original_language": "en",
			"original_title": "Deadpool & Wolverine",
			"overview": "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
			"popularity": 2691.119,
			"poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
			"release_date": "2024-07-24",
			"title": "Deadpool & Wolverine",
			"video": false,
			"vote_average": 7.688,
			"vote_count": 3280
		}
	],
	"total_pages": 46282,
	"total_results": 925640
}*/