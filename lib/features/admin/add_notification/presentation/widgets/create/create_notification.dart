import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/add_notification/add_notification_bloc.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/create/create_notification_buttom_sheet.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/button_sheet/custom_button_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Notifications',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottonSheet.showBottomSheet(
              context: context,
              child: BlocProvider(
                create: (context) => sl<AddNotificationBloc>(),
                child: const CreateNotificationButtomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllNotificationBloc>().add(
                      const GetAllNotificationEvent.getAllNotification(),
                    );
              },
            );
          },
          text: 'Add',
          width: 90.w,
          height: 35.h,
          lastRadius: 10.r,
          threeRadius: 10.r,
          backgroundColor: ColorsDark.blueDark,
        ),
      ],
    );
  }
}
