import 'package:flutter/material.dart';
import 'package:points_rewards/colors.dart';

class PointsButton extends StatelessWidget {
  const PointsButton({super.key, required this.icon, required this.onPressed});

  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: Container(
          width: 56.37,
          height: 56.37,
          decoration: ShapeDecoration(
            color: InductionAppColor.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.29),
            ),
          ),
          child: Icon(icon, color: Colors.white, size: 32)),
    );
  }
}
