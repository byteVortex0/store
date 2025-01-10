import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/loading/empty_screen.dart';
import 'package:store/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';
import 'package:store/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:store/features/admin/users/presentation/widgets/table_for_users.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          const SearchForUsers(),
          SizedBox(height: 20.h),
          Flexible(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                context.read<GetAllUsersBloc>().add(
                      const GetAllUsersEvent.getAllUsers(isNotLoading: true),
                    );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20.h),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              ),
                            );
                          },
                          success: (usersList) {
                            return TableForUsers(usersList: usersList);
                          },
                          empty: EmptyScreen.new,
                          error: Text.new, 
                          search: (searchList) { 
                            return TableForUsers(usersList: searchList);
                           },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
