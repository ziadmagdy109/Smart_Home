import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/custom_app_bar.dart';
import 'package:smart_home/features/home/presentation/cubit/room_tabs_cubit.dart';
import 'package:smart_home/features/home/presentation/widgets/add_device_bottom_sheet.dart';
import 'package:smart_home/features/home/presentation/widgets/bed_Room_body.dart';
import 'package:smart_home/features/home/presentation/widgets/bloc_builder_categories.dart';
import 'package:smart_home/features/home/presentation/widgets/kitchen_body.dart';
import 'package:smart_home/features/home/presentation/widgets/living_room_body.dart';

class AddNewRoomHomeView extends StatelessWidget {
  AddNewRoomHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomTabsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: AppConstants.kDeviceList),
        body: Column(
          children: [
            BlocBuilderCategories(),
            Expanded(
              child: BlocBuilder<RoomTabsCubit, int>(
                builder: (context, selectedIndex) {
                  switch (selectedIndex) {
                    case 0:
                      return BedRoomBody();
                    case 1:
                      return KitchenBody();
                    case 2:
                      return LivingRoomBody();
                    default:
                      return BedRoomBody();
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 30.h),
              child: OutlinedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.70,
                        minChildSize: 0.35,
                        maxChildSize: 0.9,
                        builder: (context, scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                      20,
                                ),
                                child: const AddDeviceBottomSheet(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                label: Text(
                  AppConstants.kAddNewRoom,
                  style: AppTextStyles.font18wight700weight.copyWith(
                    color: AppColors.myGreen,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.myGreen, width: 1.8),
                  minimumSize: Size(double.infinity.w, 54.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
