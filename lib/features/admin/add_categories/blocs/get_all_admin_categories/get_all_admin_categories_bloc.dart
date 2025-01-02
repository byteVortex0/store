import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';

part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';
part 'get_all_admin_categories_bloc.freezed.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  GetAllAdminCategoriesBloc(this.repo)
      : super(const GetAllAdminCategoriesState.loading()) {
    on<FetchAllCategoriesEvent>(_fetchAllCategories);
  }

  final GetAllCategoriesResponse repo;

  FutureOr<void> _fetchAllCategories(
    FetchAllCategoriesEvent event,
    Emitter<GetAllAdminCategoriesState> emit,
  ) {
    
  }
}
