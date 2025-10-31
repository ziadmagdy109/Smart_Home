import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppConstants.kDontHaveAnAccount,
                style: GoogleFonts.poppins(
                  textStyle: AppTextStyles.font14weight400.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              TextSpan(
                text: AppConstants.kSignUp,
                style: GoogleFonts.poppins(
                  textStyle: AppTextStyles.font14Green400weight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
