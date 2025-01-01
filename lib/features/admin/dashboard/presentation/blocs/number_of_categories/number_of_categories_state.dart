part of 'number_of_categories_bloc.dart';

@freezed
class NumberOfCategoriesState with _$NumberOfCategoriesState {
  const factory NumberOfCategoriesState.loading() = LoadingState;
  const factory NumberOfCategoriesState.success(
      {required String numberOfCategories}) = SuccessState;
  const factory NumberOfCategoriesState.error({required String error}) =
      ErrorState;
}
