import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/features/home/presentation/views/details_room_view.dart';

class BedRoomBody extends StatelessWidget {
  BedRoomBody({super.key});
  final List<Map<String, String>> rooms = [
    {
      "name": "Master Bed Room",
      "status": "4/8 is on",
      "image": "assets/images_home/Device_list1.png",
    },
    {
      "name": "Edamame Bed Room",
      "status": "2/5 is on",
      "image": "assets/images_home/Device_list2.png",
    },
    {
      "name": "Kids Room",
      "status": "3/7 is on",
      "image": "assets/images_home/Device_list3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 16.h),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsRoomView(image: room["image"]!),
                  ),
                );
              },
              child: Container(
                height: 230.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.myWhite,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                      child: Image.asset(
                        room["image"]!,
                        width: double.infinity,
                        height: 160.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room["name"]!,
                                  style: AppTextStyles.font16wight600weight
                                      .copyWith(color: AppColors.myBlack),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  room["status"]!,
                                  style: AppTextStyles.font12weight400.copyWith(
                                    color: AppColors.myBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              _buildIcon(HeroIcons.sparkles),
                              SizedBox(width: 10.w),
                              _buildIcon(HeroIcons.computerDesktop),
                              SizedBox(width: 10.w),
                              _buildIcon(HeroIcons.lightBulb),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildIcon(HeroIcons iconHero) {
  return Container(
    height: 32.h,
    width: 32.h,
    padding: EdgeInsets.all(8.r),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.circle,
    ),
    child: HeroIcon(iconHero, size: 24.sp, color: Colors.grey.shade700),
  );
}
