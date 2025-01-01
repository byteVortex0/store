part of 'number_of_categories_bloc.dart';

@freezed
class NumberOfCategoriesEvent with _$NumberOfCategoriesEvent {
  const factory NumberOfCategoriesEvent.started() = _Started;
  const factory NumberOfCategoriesEvent.numberOfCategories() =
      GetNumberOfCategoriesEvent;
}
