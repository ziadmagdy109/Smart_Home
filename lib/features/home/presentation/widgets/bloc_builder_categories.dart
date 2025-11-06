import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/features/home/presentation/cubit/room_tabs_cubit.dart';

class BlocBuilderCategories extends StatelessWidget {
  const BlocBuilderCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomTabsCubit, int>(
      builder: (context, isSelectIndex) {
        final cubit = context.read<RoomTabsCubit>();
        final categories = ['Bed Room', 'Kitchen', 'Living Room'];
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(categories.length, (i) {
              final isSelected = isSelectIndex == i;
              return GestureDetector(
                onTap: () => cubit.changeTab(i),
                child: Container(
                  margin: EdgeInsets.only(right: 14.w, left: 20.w),
                  height: 36.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.myGreen : AppColors.myWhite,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.myGrey),
                  ),
                  child: Center(
                    child: Text(
                      categories[i],
                      style: AppTextStyles.font16wight500weight.copyWith(
                        color: isSelected ? Colors.white : AppColors.myGrey,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
