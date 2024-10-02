part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final List<PopularMovieResult> movies;

  const WishlistLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class WishlistError extends WishlistState {
  final String message;

  const WishlistError(this.message);

  @override
  List<Object> get props => [message];
}
