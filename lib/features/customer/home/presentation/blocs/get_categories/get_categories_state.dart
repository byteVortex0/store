part of 'get_categories_bloc.dart';

@freezed
class GetCategoriesState with _$GetCategoriesState {
  const factory GetCategoriesState.loading() = LoadingState;
  const factory GetCategoriesState.success(
      {required GetAllCategoriesResponse categories}) = SuccessState;
  const factory GetCategoriesState.empty() = EmptyState;
  const factory GetCategoriesState.error({required String error}) = ErrorState;
}
