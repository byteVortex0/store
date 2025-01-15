import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/services/hive/hive_database.dart';
import '../../../data/models/add_notification_model.dart';

part 'get_all_notification_event.dart';
part 'get_all_notification_state.dart';
part 'get_all_notification_bloc.freezed.dart';

class GetAllNotificationBloc
    extends Bloc<GetAllNotificationEvent, GetAllNotificationState> {
  GetAllNotificationBloc() : super(const GetAllNotificationState.loading()) {
    on<FetchAllNotification>(getAllNotification);
  }

  FutureOr<void> getAllNotification(
    FetchAllNotification event,
    Emitter<GetAllNotificationState> emit,
  ) async {
    try {
      emit(const GetAllNotificationState.loading());

      final notificationsList = HiveDatabase().notificationBox!.values.toList();
      if (notificationsList.isEmpty) {
        emit(const GetAllNotificationState.empty());
      } else {
        emit(GetAllNotificationState.success(notifications: notificationsList));
      }
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Get All Notification failed: $e\n$stackTrace');
      emit(const GetAllNotificationState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
