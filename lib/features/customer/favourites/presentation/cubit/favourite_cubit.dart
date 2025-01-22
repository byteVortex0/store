import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/services/hive/hive_database.dart';
import 'package:store/features/customer/favourites/data/models/favourite_model.dart';

part 'favourite_state.dart';
part 'favourite_cubit.freezed.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteState.initial());

  Future<void> manageAddAndRemove({
    required String productId,
    required String title,
    required List<String> image,
    required double price,
    required String categoryName,
  }) async {
    emit(const FavouriteState.initial());

    final exitingIndex = HiveDatabase()
        .favouriteBox!
        .values
        .toList()
        .indexWhere((e) => e.id == productId);

    if (exitingIndex >= 0) {
      await HiveDatabase().favouriteBox!.deleteAt(exitingIndex);
    } else {
      await HiveDatabase().favouriteBox!.add(
            FavouriteModel(
              id: productId,
              title: title,
              image: image,
              price: price,
              categoryName: categoryName,
            ),
          );

      emit(const FavouriteState.addAndRemoveFavourite());
    }
  }

  bool isFavourite(String id) =>
      HiveDatabase().favouriteBox!.values.any((e) => e.id == id);

  List<FavouriteModel> get getFavouritesList =>
      HiveDatabase().favouriteBox!.values.toList();
}
