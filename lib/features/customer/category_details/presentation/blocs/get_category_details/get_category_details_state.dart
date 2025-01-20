part of 'get_category_details_bloc.dart';

@freezed
class GetCategoryDetailsState with _$GetCategoryDetailsState {
  const factory GetCategoryDetailsState.loading() = LoadingState;
  const factory GetCategoryDetailsState.success(
      {required GetAllProductsResponse data}) = SuccessState;
  const factory GetCategoryDetailsState.empty() = EmptyState;
  const factory GetCategoryDetailsState.error({required String error}) =
      ErrorState;
}
