import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/services/hive/hive_database.dart';

import '../../../data/models/add_notification_model.dart';

part 'add_notification_event.dart';
part 'add_notification_state.dart';
part 'add_notification_bloc.freezed.dart';

class AddNotificationBloc
    extends Bloc<AddNotificationEvent, AddNotificationState> {
  AddNotificationBloc() : super(const _Initial()) {
    on<CreateNotificationEvent>(createNotification);
    on<DeleteNotificationEvent>(deleteNotification);
  }

  FutureOr<void> createNotification(
    CreateNotificationEvent event,
    Emitter<AddNotificationState> emit,
  ) async {
    try {
      emit(const AddNotificationState.loading());
      await HiveDatabase().notificationBox!.add(event.notification);
      emit(const AddNotificationState.success());
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const AddNotificationState.error(
          error: 'An unexpected error occurred'));
    }
  }

  FutureOr<void> deleteNotification(
    DeleteNotificationEvent event,
    Emitter<AddNotificationState> emit,
  ) async {
    try {
      emit(const AddNotificationState.loading());
      await event.notificationModel.delete();
      emit(const AddNotificationState.success());
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const AddNotificationState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
