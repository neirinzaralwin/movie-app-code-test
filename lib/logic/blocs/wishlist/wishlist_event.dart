part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

final class GetWishListEvent extends WishlistEvent {}

final class InsertWishListEvent extends WishlistEvent {
  final PopularMovieResult movie;
  final bool? isReload;

  const InsertWishListEvent({required this.movie, this.isReload = true});

  @override
  List<Object> get props => [movie, isReload!];
}

final class RemoveWishListEvent extends WishlistEvent {
  final PopularMovieResult movie;
  final bool? isReload;

  const RemoveWishListEvent({required this.movie, this.isReload = true});

  @override
  List<Object> get props => [movie, isReload!];
}
