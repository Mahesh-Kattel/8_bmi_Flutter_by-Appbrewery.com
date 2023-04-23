import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  Color color;
  Widget CardChild;

  reusableCard({
    required this.color,
    required this.CardChild,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: CardChild,
      ),
    );
  }
}
