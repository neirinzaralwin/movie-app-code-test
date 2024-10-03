import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/data/repositories/wishlist/wishlist_repository.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    final wishlistRepo = WishlistRepository();

    on<WishlistEvent>((event, emit) async {
      if (event is GetWishListEvent) {
        emit(WishlistLoading());
        try {
          final movies = await wishlistRepo.getWishlistMovies();
          emit(WishlistLoaded(movies));
        } catch (e) {
          emit(WishlistError("Getting wishlist failed : $e"));
        }
      }

      if (event is InsertWishListEvent) {
        await wishlistRepo.insert(event.movie);
        if (event.isReload ?? true) {
          add(GetWishListEvent());
        }
      }

      if (event is RemoveWishListEvent) {
        await wishlistRepo.remove(event.movie);
        if (event.isReload ?? true) {
          add(GetWishListEvent());
        }
      }
    });
  }
}
