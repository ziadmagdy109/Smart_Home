import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/components/custom_outlined_button.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/utils/functions.dart';

class AddDeviceBottomSheet extends StatefulWidget {
  const AddDeviceBottomSheet({super.key});

  @override
  State<AddDeviceBottomSheet> createState() => _AddDeviceBottomSheetState();
}

class _AddDeviceBottomSheetState extends State<AddDeviceBottomSheet> {
  final List<Color> colors = [
    const Color(0xffFCF6E8),
    const Color(0xffDDFFFA),
    const Color(0xffF2FFE0),
    const Color(0xffF8F1F1),
  ];

  int currentStep = 0;
  final TextEditingController nameController = TextEditingController();

  final List<Map<String, dynamic>> devices = [
    {
      "icon": "assets/images_home/SVGRepo_iconCarrier.svg",
      "name": "Lamp Light",
      "usage": "2 kwh / Hour",
      "selected": true,
    },
    {
      "icon": "assets/images_home/Group 1000006167.svg",
      "name": "Ceiling Light",
      "usage": "1.5 kwh / Hour",
      "selected": false,
    },
    {
      "icon": "assets/images_home/Group 1000006166.svg",
      "name": "Air Condition",
      "usage": "3.2 kwh / Hour",
      "selected": false,
    },
    {
      "icon": "assets/images_home/Group 1000006168.svg",
      "name": "Smart TV",
      "usage": "1.8 kwh / Hour",
      "selected": false,
    },
  ];

  void nextStep() {
    if (currentStep < 3) {
      setState(() => currentStep++);
    } else {
      Navigator.pop(context);
    }
  }

  void previousStep() {
    if (currentStep > 0) setState(() => currentStep--);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, anim) => SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(anim),
          child: child,
        ),
        child: _buildStep(currentStep),
      ),
    );
  }

  Widget _buildStep(int step) {
    switch (step) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep2();
      case 2:
        return _buildStep3();
      case 3:
        return _buildStep4();
      default:
        return const SizedBox();
    }
  }

  // STEP 1 – Enter Room Name
  Widget _buildStep1() {
    return Column(
      key: const ValueKey(1),
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.h,),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  AppConstants.kAddDevice,
                  style: AppTextStyles.font18wight700weight,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 35.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppConstants.kRoomName,
            style: AppTextStyles.font16wight500weight.copyWith(
              color: AppColors.c780,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CustomTextField(hint: '', label: '',controller: nameController,),
        SizedBox(height: 40.h),
        CustomButton(title: AppConstants.kContinue,onPressed: nextStep,),
        SizedBox(height: 10.h),
        CustomOutlinedButton(title: AppConstants.kCancel, onPressed: (){
          Get.back();
        })
      ],
    );
  }

  // STEP 2 – Select Room Image
  Widget _buildStep2() {
    final List<String> roomImages = [
      'assets/images_home/Device_list1.png',
      'assets/images_home/Device_list2.png',
      'assets/images_home/Device_list3.png',
    ];

    int? selectedRoomIndex;

    return StatefulBuilder(
      key: const ValueKey(2),
      builder: (context, setState) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState((){
                    currentStep --;
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18.sp,

                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Room Image',
                    style: AppTextStyles.font18wight700weight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35.h),

          // 🔹 الجريد اللي فيها الكاميرا + الغرف
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 1.3,
            ),
            itemCount: roomImages.length + 1,
            itemBuilder: (context, index) {
              if (index == roomImages.length) {
                return DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 1.5,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(16.r),
                  dashPattern: const [6, 6],
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.myWhite,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                      child: Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: const BoxDecoration(
                          color: AppColors.myGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.myWhite,
                          size: 25.sp,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                final isSelected = selectedRoomIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedRoomIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.myGreen
                            : Colors.grey.shade300,
                        width: 2.w,
                      ),
                      image: DecorationImage(
                        image: AssetImage(roomImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
            },
          ),

          SizedBox(height: 20.h),
          CustomButton(title: AppConstants.kContinue, onPressed: () {
            if (selectedRoomIndex != null){ nextStep();} else{  showSnackBar(message: 'You have to select room image', isError: true);};
          },),

          SizedBox(height: 10.h),
          CustomOutlinedButton(title: AppConstants.kCancel, onPressed: (){
            Get.back();
          })
        ],
      ),
    );
  }

  // STEP 3 – Select Device Type (with SVG icons)
  Widget _buildStep3() {
    return Container(
      key: const ValueKey(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(height: 10.h,),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                   currentStep--;
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18.sp,

                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    AppConstants.kAddDevice,
                    style: AppTextStyles.font18wight700weight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35.h),

          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                final isSelected = device[AppConstants.kSelected] == true;

                return GestureDetector(
                  onTap: () => setState(() {
                    for (int i = 0; i < devices.length; i++) {
                      devices[i][AppConstants.kSelected] = i == index;
                    }
                  }),
                  child: Container(
                    height: 72.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.myWhite,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.myBlack.withOpacity(0.05),
                          blurRadius: 5.r,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 45.w,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: colors[index % colors.length],
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(device["icon"]!),
                          ),
                        ),
                        title: Text(
                          device["name"] as String,
                          style: AppTextStyles.font16wight600weight.copyWith(
                            color: AppColors.myBlack,
                          ),
                        ),
                        subtitle: Text(
                          device["usage"] as String,
                          style: AppTextStyles.font12weight400.copyWith(
                            color: AppColors.c780,
                          ),
                        ),
                        trailing: Container(
                          height: 22.w,
                          width: 22.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.myGreen
                                  : AppColors.myGrey,
                              width: 2.w,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    height: 10.w,
                                    width: 10.w,
                                    decoration: const BoxDecoration(
                                      color: AppColors.myGreen,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20.h),

          CustomButton(title: AppConstants.kContinue, onPressed: () {
            final selectedDevice = devices.firstWhere(
                  (d) => d["selected"] == true,
            );
            debugPrint("Selected Device: ${selectedDevice["name"]}");
            nextStep();
          },),
          SizedBox(height: 10.h),
          CustomOutlinedButton(title: AppConstants.kCancel, onPressed: (){
            Get.back();
          })
        ],
      ),
    );
  }

  // STEP 4 – Congratulations
  Widget _buildStep4() {
    return Column(
      key: const ValueKey(4),
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 30.h,),
        Image.asset('assets/images_home/success_check.png',height: 100,),
        SizedBox(height: 30.h),
        Text(
          AppConstants.kCongratulations,
          style: AppTextStyles.font22weight700.copyWith(
            color: AppColors.myGreen,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          '${nameController.text} Added!',
          style: TextStyle(fontSize: 14.sp, color: AppColors.myBlack),
        ),
        SizedBox(height: 25.h),
        CustomButton(title: 'Home', onPressed: () {
         Get.back();
        },),
      ],
    );
  }

}
