import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/roooms/list_rooms.dart';
import 'package:smart_home/view_model/home_view_model.dart';

class ListHomeGrid extends StatefulWidget {
  const ListHomeGrid({super.key});

  @override
  State<ListHomeGrid> createState() => _ListHomeGridState();
}

class _ListHomeGridState extends State<ListHomeGrid> {
  final ctrl = Get.find<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.isLoadingHomes ? LoadingIndicator() : controller.homes.isEmpty? Text('No Homes Added Yet!',style: AppTextStyles.font12weight400.copyWith(
        color: Colors.grey
      ),):GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.homes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(()=> ListRooms());
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    controller.homes[index].backgroundUrl??'',
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      "assets/images_home/home${index + 1}.png",
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  left: 10.w,
                  bottom: 7.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.homes[index].name}',
                        style: AppTextStyles.font14weight600.copyWith(
                          color: AppColors.myWhite,
                        ),
                      ),
                      SizedBox(height: 3.h,),
                      Text(
                        '${controller.homes[index].geoName}',
                        style: AppTextStyles.font12weight400.copyWith(
                          color: AppColors.myWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
