part of 'favourite_cubit.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;
  const factory FavouriteState.addAndRemoveFavourite() =
      AddAndRemoveFavouriteState;
}
