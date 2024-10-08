import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/services/save_image_service.dart';
import 'package:flutter_movie_code_test/singeletons/db_sgl.dart';

class WishlistDatasource {
  Future<List<PopularMovieResult>> getWishlistMovies() async {
    final operation = DbSingeleton.wishlistMovies;
    final movieList = await operation.getWishlistMovies();
    // same model with popular movies
    return movieList.map((e) => PopularMovieResult.fromJson(e)).toList();
  }

  Future<void> insertOrReplace(PopularMovieResult movie) async {
    final saveService = SaveImageService();
    movie.posterPath = await saveService.copyAndSaveToDir(movie.posterPath!, "wishlist_movies");
    final operation = DbSingeleton.wishlistMovies;
    await operation.insertOrReplaceMovies(movie);
  }

  Future<void> remove(PopularMovieResult movie) async {
    final imageService = SaveImageService();
    final operation = DbSingeleton.wishlistMovies;
    await operation.deleteMovie(movie.id!);
    await imageService.deleteFileFromDir(movie.posterPath!);
  }
}
