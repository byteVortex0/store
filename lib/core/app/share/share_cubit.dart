import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store/core/services/dynamic_links/dynamic_links.dart';

part 'share_state.dart';
part 'share_cubit.freezed.dart';

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(const ShareState.initial());

  sendDynamicLinkProduct({
    required String productId,
    required String title,
    required String image,
  }) async {
    emit(ShareState.loading(productId: productId));

    await DynamicLinks()
        .generateDynamicLink(
          productId: productId,
          title: title,
          image: image,
        )
        .then(
          (value) => Share.share(value),
        );

    emit(const ShareState.success());
  }
}
