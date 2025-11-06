import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

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
        Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              size: 18.sp,
              color: Colors.transparent,
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
        SizedBox(height: 25.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppConstants.kRoomName,
            style: AppTextStyles.font16wight500weight.copyWith(
              color: AppColors.myBlack,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.myGreen, width: 1.5.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: AppColors.myGreen),
            ),
          ),
        ),
        SizedBox(height: 25.h),
        _buildContinueButton(AppConstants.kContinue, onPressed: nextStep),
        SizedBox(height: 10.h),
        _buildCancelButton(),
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
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => currentStep--),
                child: const Icon(Icons.arrow_back_ios_new, size: 18),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Select Room',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),

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

          _buildContinueButton(
            'Continue',
            onPressed: () {
              if (selectedRoomIndex != null) nextStep();
            },
          ),
          SizedBox(height: 10.h),
          _buildCancelButton(),
        ],
      ),
    );
  }

  // STEP 3 – Select Device Type (with SVG icons)
  Widget _buildStep3() {
    return Container(
      key: const ValueKey(3),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: previousStep,
                child: const Icon(Icons.arrow_back_ios_new, size: 18),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    AppConstants.kAddDevice,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
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
                    margin: EdgeInsets.only(bottom: 12.h),
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
                            color: AppColors.myBlack,
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

          // 🔹 زرار Continue
          _buildContinueButton(
            'Continue',
            onPressed: () {
              final selectedDevice = devices.firstWhere(
                (d) => d["selected"] == true,
              );
              debugPrint("Selected Device: ${selectedDevice["name"]}");
              nextStep();
            },
          ),
          SizedBox(height: 10.h),
          _buildCancelButton(),
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
        Icon(Icons.check_circle, color: AppColors.myGreen, size: 80.sp),
        SizedBox(height: 20.h),
        Text(
          AppConstants.kCongratulations,
          style: AppTextStyles.font22weight700.copyWith(
            color: AppColors.myGreen,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          '${nameController.text} Added!',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 25.h),
        _buildContinueButton('Home', onPressed: () => Navigator.pop(context)),
      ],
    );
  }

  // Common Buttons
  Widget _buildContinueButton(String text, {required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.myGreen,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(text, style: AppTextStyles.font16wight600weight),
    );
  }

  // Cancel Buttons
  Widget _buildCancelButton() {
    return OutlinedButton(
      onPressed: () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.myGreen),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        AppConstants.kCancel,
        style: AppTextStyles.font18wight700weight.copyWith(
          color: AppColors.myGreen,
        ),
      ),
    );
  }
}
