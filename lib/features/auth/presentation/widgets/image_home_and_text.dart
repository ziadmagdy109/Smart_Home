import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/features/auth/presentation/widgets/smart_home_text_widget.dart';

class ImageHomeAndText extends StatelessWidget {
  const ImageHomeAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.45),
                Colors.black.withOpacity(0.25),
                Colors.white.withOpacity(0.70),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: Image.asset(AppConstants.imageHomeAndText, fit: BoxFit.cover),
        ),
        Column(children: [SmarHomeTextWidget()]),
      ],
    );
  }
}
