import 'package:flutter/material.dart';

import 'constrains.dart';

class IconContent extends StatelessWidget {
  IconData icon;
  String text;
  IconContent({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(height: 15),
        Text(
          text,
          style: labelTextStyle,
        )
      ],
    );
  }
}
