import 'package:flutter/material.dart';

class listTileHome extends StatelessWidget {
  const listTileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25, // حجم الصورة
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
      title: const Text(
        'Ziad Magdy',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('Flutter Developer'),
      onTap: () {},
    );
  }
}
