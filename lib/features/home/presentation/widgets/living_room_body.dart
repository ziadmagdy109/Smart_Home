import 'package:flutter/material.dart';

class LivingRoomBody extends StatelessWidget {
  const LivingRoomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF00E676), // اللون الأخضر
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "Living Room",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
