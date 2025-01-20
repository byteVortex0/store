part of 'get_category_details_bloc.dart';

@freezed
class GetCategoryDetailsEvent with _$GetCategoryDetailsEvent {
  const factory GetCategoryDetailsEvent.started() = _Started;
  const factory GetCategoryDetailsEvent.getCategoryDetails({required int id}) =
      FetchCategoryDetailsEvent;
}
