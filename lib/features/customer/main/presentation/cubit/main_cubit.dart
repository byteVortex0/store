import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/enums/nav_bar_enum.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  NavBarEnum navBarEnum = NavBarEnum.home;

  void selectedNavBarIcon(NavBarEnum navBar) {
    if (navBar == NavBarEnum.home) {
      navBarEnum = NavBarEnum.home;
    } else if (navBar == NavBarEnum.notifications) {
      navBarEnum = NavBarEnum.notifications;
    } else if (navBar == NavBarEnum.favourites) {
      navBarEnum = NavBarEnum.favourites;
    } else if (navBar == NavBarEnum.profile) {
      navBarEnum = NavBarEnum.profile;
    }

    emit(MainState.barSelectedIcons(navBar: navBarEnum));
  }
}
