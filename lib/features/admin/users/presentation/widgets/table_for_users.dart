import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/users/presentation/widgets/table_cell_title_widget.dart';

import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../data/models/get_all_users_response.dart';
import 'delet_user_widget.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({
    super.key,
    required this.usersList,
  });

  final List<GetUsers> usersList;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsDark.blueLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(MediaQuery.of(context).size.width / 3),
        1: FlexColumnWidth(MediaQuery.of(context).size.width / 2),
        2: FlexColumnWidth(MediaQuery.of(context).size.width / 3),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(
            color: ColorsDark.blueDark,
          ),
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.person,
                title: 'Name',
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.email_outlined,
                title: 'Email',
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.delete_forever,
                title: 'Delete',
              ),
            ),
          ],
        ),
        ...List.generate(
          usersList.length,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextApp(
                    text: usersList[index].name!,
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextApp(
                    text: usersList[index].email!,
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DeletUserWidget(id: usersList[index].id!),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
