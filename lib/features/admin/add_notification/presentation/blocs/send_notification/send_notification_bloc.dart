import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_notification/data/repos/add_notification_repo.dart';

part 'send_notification_event.dart';
part 'send_notification_state.dart';
part 'send_notification_bloc.freezed.dart';

class SendNotificationBloc
    extends Bloc<SendNotificationEvent, SendNotificationState> {
  SendNotificationBloc(this.repo) : super(const _Initial()) {
    on<SendNewNotificationEvent>(sendNotification);
  }

  final AddNotificationRepo repo;

  FutureOr<void> sendNotification(
    SendNewNotificationEvent event,
    Emitter<SendNotificationState> emit,
  ) async {
    try {
      emit(SendNotificationState.loading(indexId: event.indexId));
      final result = await repo.sendNotification(
        title: event.title,
        body: event.body,
        productId: event.productId,
      );
      result.when(
        success: (_) => emit(const SendNotificationState.success()),
        failure: (error) => emit(SendNotificationState.error(error: error)),
      );
    } catch (e, stackTrace) {
      log('Send Notification failed: $e\n$stackTrace');
      emit(const SendNotificationState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
