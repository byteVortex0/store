import 'package:flutter/material.dart';
import 'package:store/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Dashboard',
      ),
      body: DashboardBody(),
    );
  }
}