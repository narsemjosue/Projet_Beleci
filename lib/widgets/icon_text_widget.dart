import 'package:flutter/material.dart';
import 'package:reservia/utils/app_style.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                 Icon(icon, color: Color(0xFFBFC2DF),),
                const SizedBox(width: 10,),
                Text(text, style: Styles.textStyle,)
              ],
            ),
          );
  }
}