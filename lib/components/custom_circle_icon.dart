import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:movie_app/theme/app_colors.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFCED2D5),
            AppColors.kBGCircle,
            Color(0xFFFFFFFF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 30,
            offset: Offset(-20, -20), // changes position of shadow\
          ),
          BoxShadow(
            color: Color(0xFFced2d5),
            blurRadius: 20,
            offset: Offset(20, 20), // changes position of shadow\
          ),
        ],
      ),
      child: Icon(
        icon,
        color: AppColors.kIconColor,
      ),
    );
  }
}
