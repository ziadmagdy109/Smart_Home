import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final bool obscureText;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({super.key,
    required this.hint,
    required this.label,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      enabled: enabled,
      cursorColor: AppColors.myBlack,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.myColorTextField,
            width: 0.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.myColorTextField,
            width: 0.5.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.myColorTextField,
            width: 0.5.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.myColorTextField,
            width: 0.5.w,
          ),
        ),
        errorStyle: TextStyle(height: 2.h,fontSize: 10.sp,)
      ),
    );
  }
}
