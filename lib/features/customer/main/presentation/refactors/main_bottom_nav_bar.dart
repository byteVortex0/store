import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:store/features/customer/main/presentation/widgets/notificatin_bar_icon.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/enums/nav_bar_enum.dart';
import '../../../../../core/style/images/app_images.dart';
import '../widgets/icon_tab_nav_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 103.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // icons
              Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    height: 88.h,
                    width: MediaQuery.of(context).size.width,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 45.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                              final cubit = context.read<MainCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconTabNavBar(
                                    icon: AppImages.homeTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.home,
                                    onTap: () {
                                      cubit.selectedNavBarIcon(NavBarEnum.home);
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.selectedNavBarIcon(
                                          NavBarEnum.notifications);
                                    },
                                    child: NotificatinBarIcon(
                                        isSelected: cubit.navBarEnum ==
                                            NavBarEnum.notifications),
                                  ),
                                  IconTabNavBar(
                                    icon: AppImages.favouritesTab,
                                    isSelected: cubit.navBarEnum ==
                                        NavBarEnum.favourites,
                                    onTap: () {
                                      cubit.selectedNavBarIcon(
                                          NavBarEnum.favourites);
                                    },
                                  ),
                                  IconTabNavBar(
                                    icon: AppImages.profileTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.profile,
                                    onTap: () {
                                      cubit.selectedNavBarIcon(
                                          NavBarEnum.profile);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Background
              Positioned(
                top: -12,
                left: -8,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.asset.bigNavBar!),
                    ),
                  ),
                ),
              ),

              // car icon
              Positioned(
                left: 35,
                top: 17,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
