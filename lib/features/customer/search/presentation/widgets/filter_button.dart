import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/enums/filtter_search_enum.dart';
import 'package:store/features/customer/search/presentation/widgets/search_name_price_buttons.dart';

import '../../data/models/search_request_body.dart';
import '../blocs/search_for_products/search_for_products_bloc.dart';
import 'search_filter_button.dart';
import 'search_for_data_icon.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceMinController = TextEditingController();
  TextEditingController priceMaxController = TextEditingController();

  FiltterSearchEnum filtterSearchEnum = FiltterSearchEnum.non;

  bool showClearButton = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButtons(
                  isSelected: filtterSearchEnum == FiltterSearchEnum.name,
                  title: 'Search by name',
                  onTap: searchByNameTap,
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButtons(
                  isSelected: filtterSearchEnum == FiltterSearchEnum.price,
                  title: 'Search by price',
                  onTap: searchByPriceTap,
                ),
              ),
            ],
          ),
          if (filtterSearchEnum == FiltterSearchEnum.name) ...[
            SizedBox(height: 15.h),
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: nameController,
                hintText: 'Search for name....',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (formKey.currentState!.validate()) {
                    context.read<SearchForProductsBloc>().add(
                          SearchForProductsEvent.searchForProductsbyTitle(
                            title: value!,
                          ),
                        );
                  }
                  setState(() {
                    showClearButton = nameController.text.isNotEmpty;
                  });
                  return null;
                },
                suffixIcon: showClearButton
                    ? IconButton(
                        onPressed: () {
                          nameController.clear();
                          setState(() {
                            showClearButton = false;
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
            ),
          ] else if (filtterSearchEnum == FiltterSearchEnum.price) ...[
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomFadeInRight(
                    duration: 200,
                    child: CustomTextField(
                      controller: priceMinController,
                      keyboardType: TextInputType.number,
                      hintText: 'Price Min',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price min';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: CustomFadeInRight(
                    duration: 200,
                    child: CustomTextField(
                      controller: priceMaxController,
                      keyboardType: TextInputType.number,
                      hintText: 'Price Max',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price max';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            CustomFadeInRight(
              duration: 200,
              child: SearchFilterButton(onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<SearchForProductsBloc>().add(
                        SearchForProductsEvent.searchForProductsbyPrice(
                          body: SearchRequestBody(
                            priceMin:
                                int.tryParse(priceMinController.text.trim()),
                            priceMax:
                                int.tryParse(priceMaxController.text.trim()),
                          ),
                        ),
                      );

                  priceMinController.clear();
                  priceMaxController.clear();
                }
              }),
            ),
          ] else if (filtterSearchEnum == FiltterSearchEnum.non) ...[
            SizedBox(height: 150.h),
            const SearchForDataIcon(),
          ]
        ],
      ),
    );
  }

  void searchByNameTap() {
    if (filtterSearchEnum == FiltterSearchEnum.name) {
      setState(() {
        filtterSearchEnum = FiltterSearchEnum.non;
      });
    } else {
      setState(() {
        filtterSearchEnum = FiltterSearchEnum.name;
      });
    }
    context
        .read<SearchForProductsBloc>()
        .add(const SearchForProductsEvent.resetSearch());
    nameController.clear();
    priceMaxController.clear();
    priceMinController.clear();
  }

  void searchByPriceTap() {
    if (filtterSearchEnum == FiltterSearchEnum.price) {
      setState(() {
        filtterSearchEnum = FiltterSearchEnum.non;
      });
    } else {
      setState(() {
        filtterSearchEnum = FiltterSearchEnum.price;
      });
    }
    context
        .read<SearchForProductsBloc>()
        .add(const SearchForProductsEvent.resetSearch());
    nameController.clear();
    priceMaxController.clear();
    priceMinController.clear();
  }
}
