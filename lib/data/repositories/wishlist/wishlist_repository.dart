import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/data/local_datasource/wishlist/wishlist_datasource.dart';

class WishlistRepository {
  Future<List<PopularMovieResult>> getWishlistMovies() async {
    final local = WishlistDatasource();
    return local.getWishlistMovies();
  }
}
