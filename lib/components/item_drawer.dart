import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_circle_icon.dart';
import 'package:movie_app/theme/app_style.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFBEBEBE),
            offset: Offset(10, 10),
            blurRadius: 30,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-10, -10),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          CustomCircleIcon(icon: icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: AppStyles.h4,
          ),
        ],
      ),
    );
  }
}
