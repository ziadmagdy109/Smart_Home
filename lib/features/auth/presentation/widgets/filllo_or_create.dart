import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class FillloOrCreate extends StatefulWidget {
  const FillloOrCreate({super.key});

  @override
  State<FillloOrCreate> createState() => _FillloOrCreateState();
}

class _FillloOrCreateState extends State<FillloOrCreate> {
  String selectedValue = AppConstants.kFilloHouse;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<String>(
          title: Text(
            AppConstants.kFilloHouse,
            style: AppTextStyles.font18wight500weight,
          ),
          value: AppConstants.kFilloHouse,
          groupValue: selectedValue,
          activeColor: AppColors.myGreen,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
        const Divider(height: 1, thickness: 0.2, indent: 5, endIndent: 5),
        RadioListTile<String>(
          title: Text(
            AppConstants.kCreateNew,
            style: AppTextStyles.font18wight500weight,
          ),
          value: AppConstants.kCreateNew,
          groupValue: selectedValue,
          activeColor: AppColors.myGreen,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}
