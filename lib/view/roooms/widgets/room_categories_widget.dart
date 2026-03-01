import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view_model/list_rooms_view_model.dart';

class RoomCategoriesWidget extends StatefulWidget {
  const RoomCategoriesWidget({super.key});

  @override
  State<RoomCategoriesWidget> createState() => _RoomCategoriesWidgetState();
}

class _RoomCategoriesWidgetState extends State<RoomCategoriesWidget> {
  final controller = Get.put(RoomCategoriesViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
      child: GetBuilder<RoomCategoriesViewModel>(
        builder: (controller) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.roomCategories.length, (i) {
              return GestureDetector(
                onTap: () {
                  controller.selectedCategory = controller.roomCategories[i];
                  controller.update();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 14.w, ),
                  height: 36.h,
                  padding: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                    color: controller.selectedCategory == controller.roomCategories[i]
                        ? AppColors.myGreen : AppColors.myWhite,
                    borderRadius: BorderRadius.circular(10.r),
                    border:controller.selectedCategory == controller.roomCategories[i]
                        ? null :  Border.all(color: AppColors.c153),
                  ),
                  child: Center(
                    child: Text(
                      '${controller.roomCategories[i]}',
                      style: controller.selectedCategory == controller.roomCategories[i]  ? AppTextStyles.font16wight600weight.copyWith(
                        color:  Colors.white,
                      ) : AppTextStyles.font16wight600weight.copyWith(
                        color:  AppColors.c153,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
