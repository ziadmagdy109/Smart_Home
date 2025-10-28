import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSignInView extends StatelessWidget {
  const HomeSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 150.h,
          width: 250.w,
          child: Center(
            child: Text(
              "Hi, My name's Bat Man...",
              style: TextStyle(
                color: const Color.fromARGB(255, 9, 33, 52),
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
