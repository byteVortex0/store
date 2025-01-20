import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/customer/home/data/repos/home_repo.dart';

part 'get_banners_event.dart';
part 'get_banners_state.dart';
part 'get_banners_bloc.freezed.dart';

class GetBannersBloc extends Bloc<GetBannersEvent, GetBannersState> {
  GetBannersBloc(this.repo) : super(const GetBannersState.loading()) {
    on<FetchBannersEvent>(getBanners);
  }

  final HomeRepo repo;

  FutureOr<void> getBanners(
    FetchBannersEvent event,
    Emitter<GetBannersState> emit,
  ) async {
    try {
      emit(const GetBannersState.loading());
      final result = await repo.getBanners();
      result.when(
        success: (imagesList) {
          if (imagesList.getBannersList.isEmpty) {
            emit(const GetBannersState.empty());
          } else {
            emit(
                GetBannersState.success(imagesList: imagesList.getBannersList));
          }
        },
        failure: (error) {
          emit(GetBannersState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Banners failed: $e\n$stackTrace');
      emit(const GetBannersState.error(error: 'An unexpected error occurred'));
    }
  }
}
